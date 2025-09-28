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

public class TestHash {
    public static void main(String[] args) throws Exception{
        String claveOriginal = "admin123"; // reemplaza con la contrasena original
        
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        byte[] hash = md.digest(claveOriginal.getBytes("UTF-8"));
        
        StringBuilder hex = new StringBuilder();
        for (byte b : hash) {
            hex.append(String.format("%02x", b));
        }
        
        System.out.println("Hash SHA-256 generado: ");
        System.out.println(hex.toString());
    }
    
}
