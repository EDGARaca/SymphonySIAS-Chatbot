/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Spiri
 */

package com.mycomp.symphonysias.auth;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UsuarioDAO {
    
    public boolean validarUsuario(String usuario, String clavePlano) {
        String sql = "SELECT A2_clave FROM usuarios WHERE LOWER(TRIM(A1_usuario)) = ?";
        try (
            Connection conn = DBConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql)
        ) {
            
            stmt.setString(1, usuario.toLowerCase().trim());
            ResultSet rs = stmt.executeQuery();
    
            if (rs.next()) {
                String claveHash = rs.getString("A2_clave");
                String claveIngresadaHash = HashUtil.sha256(clavePlano);
                return claveHash.equals(claveIngresadaHash);
            }
        } catch (SQLException e) {
            System.err.println("Error de validación de usuario: " + e.getMessage());
        }
        return false;
    }   
}
  
