/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author Spiri
 */

package com.mycomp.symphonysias.resources;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import com.mycomp.symphonysias.auth.DBConexion;

@WebListener
public class AppLifecycleListener implements ServletContextListener {
    
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("Aplicacion symphonysias iniciada");
    }
    
    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        DBConexion.cerrarHiloJDBC(); //Cierre limpio del hilo JDBC
    }
}
