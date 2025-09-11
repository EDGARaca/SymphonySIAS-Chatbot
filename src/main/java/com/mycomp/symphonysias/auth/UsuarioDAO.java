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
import static java.lang.System.out;

public class UsuarioDAO {
    
    public Usuario validar(String usuario, String clave) {
    Usuario usuarioObj = null;
    
    Connection conn = DBConexion.getConnection();
    if (conn == null) {
        System.out.println("Conexion fallida en usuarioDAO");
        return null;
    }

    try {
        String sql = "SELECT id, nombre, usuario, password_hash, rol FROM usuarios WHERE usuario = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, usuario);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String hashBD = rs.getString("password_hash");
                
                //Limpieza y trazabilidad
                String claveLimpia = clave.trim();
                System.out.println("Clave limpia: " + claveLimpia);

                // Generar hash SHA-256 del input
                MessageDigest md = MessageDigest.getInstance("SHA-256");
                byte[] hashBytes = md.digest(clave.getBytes(StandardCharsets.UTF_8));
                String hashInput = HexFormat.of().formatHex(hashBytes);
                
                System.out.println("Hash generado: " + hashInput);
                System.out.println("Hash en BD: " + hashBD);
                System.out.println("Coincidencia: " + hashBD.equalsIgnoreCase(hashInput));
            
                //Comparar hash
                if (hashBD.equalsIgnoreCase(hashInput)) {
                    String rolNombre = rs.getString("rol");
                    System.out.println("Usuario autenticado con rol ID: " + rolNombre);
                                        
                    usuarioObj = new Usuario(
                        rs.getInt("id"),
                        rs.getString("nombre"),
                        rs.getString("usuario"),
                        rs.getString("password_hash"),
                        rolNombre   
                    );
                } else {
                    System.out.println("Hash no coincide");
                }
            } else {
                System.out.println("Usuario no encontrado en BD");
            }
        } catch (Exception e) {
            System.out.println("Error en validacion");
            e.printStackTrace(); // Puedes redirigir a logs institucionales si lo prefiere
        }

        return usuarioObj;
    }
}

  
