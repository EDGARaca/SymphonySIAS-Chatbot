/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author Spiri
 */
package com.mycomp.symphonysias;

import java.security.MessageDigest;
import java.sql.*;
import java.time.LocalDateTime;

public class MigrarClaves {
    public static void main(String[] args){
        String url = "jdbc:mysql://localhost:33065/dbsymphonysias";
        String usuario = "root";
        String password = "";
        
        System.out.println("Inicio de migracion:" + LocalDateTime.now());
        
        try (
            Connection conn = DriverManager.getConnection(url,usuario,password);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT id, clave FROM usuarios")
           ){
            while (rs.next()){
                int id = rs.getInt("id");
                String claveOriginal = rs.getString("clave");
                String claveHash = sha256(claveOriginal);
                
                try (PreparedStatement ps = conn.prepareStatement(
                        "UPDATE usuarios SET clave = ? WHERE id= ?")){
                    ps.setString(1, claveHash);
                    ps.setInt(2, id);
                    ps.executeUpdate();
                }
                System.out.println("Migrado ID: " + id + " → Hash: " + claveHash);
            }
            System.out.println("Migración completa.");
        } catch (Exception e){
            System.err.println("Error durante la migracion: ");
            e.printStackTrace();
        }
    }    
    public static String sha256(String input) throws Exception {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        byte[] hash = md.digest(input.getBytes("UTF-8"));
        StringBuilder hex = new StringBuilder();
        for(byte b : hash) {
            hex.append(String.format("%02x", b));
        }
        return hex.toString();
    }
}
