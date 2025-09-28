/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package com.mycomp.symphonysias.auth;

import java.security.MessageDigest;
import java.nio.charset.StandardCharsets;
import java.util.HexFormat;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.mycomp.symphonysias.ConexionDao;
import com.mycomp.symphonysias.model.Usuario;

public class UsuarioDAO {
    public Usuario validar(String usuario, String clave) {
        Connection conn = ConexionDao.obtenerConexion();
        if (conn == null) return null;

        Usuario usuarioObj = null;
        try {
            String sql = "SELECT id, nombre, usuario, password, rol FROM usuarios WHERE usuario = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, usuario);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String hashBD = rs.getString("password");
                String hashInput = generarHash(clave.trim());

                if (hashBD.equalsIgnoreCase(hashInput)) {
                    usuarioObj = new Usuario(
                        rs.getInt("id"),
                        rs.getString("nombre"),
                        rs.getString("usuario"),
                        hashBD,
                        rs.getString("rol")
                    );
                }
            }
            rs.close();
            stmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConexionDao.cerrarConexion(conn);
        }

        return usuarioObj;
    }

    private String generarHash(String clave) throws Exception {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        byte[] hashBytes = md.digest(clave.getBytes(StandardCharsets.UTF_8));
        return HexFormat.of().formatHex(hashBytes);
    }
}