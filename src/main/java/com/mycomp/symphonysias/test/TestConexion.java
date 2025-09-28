/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycomp.symphonysias.test;

import java.sql.Connection;
import com.mycomp.symphonysias.auth.DBConexion;


/**
 *
 * @author Edgar
 */
public class TestConexion {
    public static void main(String[] args) {
        Connection conn = DBConexion.getConnection();
        if (conn != null) {
            System.out.println("✅ Conexión exitosa a login_symphony");
            DBConexion.cerrarConexion(conn);
        } else {
            System.out.println("❌ No se pudo conectar a la base de datos");
        }
    }
}
