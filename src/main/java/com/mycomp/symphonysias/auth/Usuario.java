/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycomp.symphonysias.auth;

/**
 *
 * @author Spiri
 */
public class Usuario {
    private int id; // nuevo campo
    private String nombre;
    private String usuario;
    private String clave;
    private String rol;
    
    // Contructor comp
    public Usuario(int id, String nombre, String usuario, String clave, String rol) {
        this.id = id;
        this.nombre = nombre;
        this.usuario = usuario;
        this.clave = clave;
        this.rol = rol;
    }
    
    //Getters
    public int getId() {return id;}
    public String getNombre() { return nombre; }
    public String getUsuario() {return usuario;}
    public String getClave() { return clave; }
    public String getRol() { return rol; }
    
    //Setters
    public void setId(int id) {this.id = id;}
    public void setNombre(String nombre) {this.nombre = nombre;}
    public void setUsuario(String usuario) {this.usuario = usuario;}
    public void setClave(String clave) {this.clave = clave;}
    public void setRol(String rol) {this.rol = rol;}

    @Override
    public String toString() {
        return nombre + "(" + usuario + ")"; // Para mostrar en el dashboard
    }
}
