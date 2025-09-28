/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycomp.symphonysias;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConexionDao {
    private static final String url = "jdbc:mysql://localhost:3306/login_symphony";
    private static final String username = "root";
    private static final String pass = "";

    public static Connection obtenerConexion() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, username, pass);
        } catch (Exception e) {
            System.out.println("Error al conectar: " + e.getMessage());
        }
        return conn;
    }

    public static void cerrarConexion(Connection conn) {
        try {
            if (conn != null) conn.close();
        } catch (Exception e) {
            System.out.println("Error al cerrar conexión: " + e.toString());
        }
    }
}