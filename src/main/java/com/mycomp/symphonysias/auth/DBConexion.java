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
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConexion {

    private static final String URL = "jdbc:mysql://localhost:33065/login_symphony";
    private static final String USER = "root";
    private static final String PASSWORD = "";
    
    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            System.out.println("Driver JDBC no encontrado");
            e.printStackTrace();
            return null;
        } catch (SQLException e){
            System.out.println("Error al conectar con la base de datos");
            e.printStackTrace();
            return null;
        }
    }
    
    // Metodo para cerrar el hilo de limpieza JDBC
    public static void cerrarHiloJDBC(){
        try {
            com.mysql.cj.jdbc.AbandonedConnectionCleanupThread.checkedShutdown();
            System.out.println("Hilo JDBC cerrado correctamente");
        } catch (Exception e) {
            System.out.println("Error al cerrar hilo JDBC: " + e.getMessage());
        }
    }
}
    
    
    
    
    
    
    

 