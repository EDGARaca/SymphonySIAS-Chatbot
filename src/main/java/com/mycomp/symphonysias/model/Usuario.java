/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */


/**
 *
 * @author Spiri
 */


package com.mycomp.symphonysias.model;

public class Usuario {
    private final int id; // nuevo campo
    private final String nombre;
    private final String usuario;
    private final String passwordHash;
    private final String rol;
    
    // Contructor comp
    public Usuario(int id, String nombre, String usuario, String passwordHash, String rol){
        this.id = id;
        this.nombre = nombre;
        this.usuario = usuario;
        this.passwordHash = passwordHash;
        this.rol = rol;
    }
    
    public int getId() {
        return id;
    }
    
    public String getNombre() { 
        return nombre; 
    }
    
    public String getUsuario() { 
        return usuario; 
    }
    
    public String getPasswordHash() { 
        return passwordHash; 
    }
    
    public String getRol() { 
        return rol; 
    }
}
