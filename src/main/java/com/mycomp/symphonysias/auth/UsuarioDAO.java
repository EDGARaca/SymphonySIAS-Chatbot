/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Spiri
 */

package com.mycomp.symphonysias.auth;

import java.security.MessageDigest;
import java.nio.charset.StandardCharsets;
import java.util.HexFormat;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.mycomp.symphonysias.model.Usuario;

public class UsuarioDAO {
    
    public Usuario validar(String usuario, String clave) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs= null;
        Usuario usuarioObj = null;

        try {
        conn = DBConexion.getConnection();
        String sql = "SELECT * FROM usuarios WHERE usuario = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, usuario);
        rs = stmt.executeQuery();

        if (rs.next()) {
            String passwordBD = rs.getString("password");

            if (clave.equals(passwordBD)) {
                usuarioObj = new Usuario(
                    rs.getInt("id"),
                    rs.getString("rol"),
                    rs.getString("nombre"),
                    rs.getString("cedula"),
                    rs.getString("direccion"),
                    rs.getString("correo"),
                    rs.getString("usuario"),
                    passwordBD
                );
            } else {
                System.out.println("Contraseña incorrecta");
            }
        } else {
            System.out.println("Usuario no encontrado");
        }

    } catch (Exception e) {
        System.out.println("Error en validación");
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (Exception ex) {
            System.out.println("Error cerrando recursos");
            ex.printStackTrace();
        }
    }

    return usuarioObj;
}
}


  
