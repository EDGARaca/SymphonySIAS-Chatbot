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
    private final String rol;
    private final String nombre;
    private final String cedula;
    private final String direccion;
    private final String correo;
    private final String usuario;
    private final String password;
    
    
    // Contructor comp
    public Usuario(int id, String rol, String nombre, String cedula, String direccion, String correo, String usuario, String password){
        this.id = id;
        this.rol = rol;
        this.nombre = nombre;
        this.cedula = cedula;
        this.direccion = direccion;
        this.correo = correo;
        this.usuario = usuario;
        this.password = password;
    }
    
    public int getId() { return id; }
    public String getRol() { return rol; }
    public String getNombre() { return nombre; }
    public String getCedula() { return cedula; }
    public String getDireccion() { return direccion; }
    public String getCorreo() { return correo; }
    public String getUsuario() { return usuario; }
    public String getPassword() { return password; }   
}
