/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package com.mycomp.symphonysias.model;

public class Usuario {
    private int id;
    private String nombre;
    private String usuario;
    private String password;
    private String rol;

    public Usuario(int id, String nombre, String usuario, String password, String rol) {
        this.id = id;
        this.nombre = nombre;
        this.usuario = usuario;
        this.password = password;
        this.rol = rol;
    }

    public int getId() { return id; }
    public String getNombre() { return nombre; }
    public String getUsuario() { return usuario; }
    public String getPassword() { return password; }
    public String getRol() { return rol; }
}