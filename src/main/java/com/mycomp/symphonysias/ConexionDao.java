/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycomp.symphonysias;

/**
 *
 * @author Spiri
 */

import java.sql.DriverManager;
import java.sql.Connection;
/*import java.sql.SQLException;*/


public class ConexionDao {
    // Declaración de variables para la conexion a la base de datos
    private static final String url ="jdbc:mysql://localhost:33065/dbsymphonysias";
    private static final String username="root";
    private static final String pass="";
    
    // conexion base de datos
    public static Connection obtenerConexion(){
        Connection conn = null;
            try {
                  Class.forName("com.mysql.cj.jdbc.Driver");
                  conn = DriverManager.getConnection(url,username,pass);
              } catch (Exception e) {
                  System.out.println("Error: " + e.getMessage());
              }

              return conn;
    }
    public static void cerrarConexion(Connection Conn){
        try{
            if(Conn !=null){
                Conn.close();
            }
        }catch(Exception e){
        System.out.println("Error al conectarnos"+e.toString());

        }
    }
}    
    
    /* probar la conexión a la base de datos*/
/*Esto es solo para probar la conexion con la base de datos despues lo podemos comentar para que no nos genere ningun problema en nuestro codigo*/
/*    
public static void main(String[]args){
  try
  {
    Connection conn = ConexionDao.obtenerConexion();
    if(conn !=null){
        System.out.println("Conexion a la base de datos exitosa");
    }else{
        System.out.println("No se puede establecer la conexión a la base de datos");
    }
  }catch(Exception ex){
        System.out.println("Error al conectar");
	ex.printStackTrace();
  }
  
   }
}*/

    
    
