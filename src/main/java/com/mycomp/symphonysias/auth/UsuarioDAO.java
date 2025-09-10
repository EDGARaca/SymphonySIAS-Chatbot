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

public class UsuarioDAO {
    
    public Usuario obtenerUsuario(String usuario, String clave) {
    Usuario usuarioObj = null;

        try (Connection conn = DBConexion.getConnection()) {
            String sql = "SELECT id, usuario, password_hash, rol_id FROM usuarios WHERE usuario = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, usuario);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String hashBD = rs.getString("password_hash");

                // Generar hash SHA-256 del input
                MessageDigest md = MessageDigest.getInstance("SHA-256");
                byte[] hashBytes = md.digest(clave.getBytes(StandardCharsets.UTF_8));
                String hashInput = HexFormat.of().formatHex(hashBytes);
            
                //Comparar hash
                if (hashBD.equalsIgnoreCase(hashInput)) {
                    usuarioObj = new Usuario(
                        rs.getInt("id"),
                        rs.getString("nombre"),
                        rs.getString("usuario"),
                        rs.getString("password_hash"),
                        String.valueOf(rs.getInt("nombre"))
                    );
                }
            }
        } catch (Exception e) {
            e.printStackTrace(); // Puedes redirigir a logs institucionales si lo prefiere
        }

        return usuarioObj;
    }
}

  
