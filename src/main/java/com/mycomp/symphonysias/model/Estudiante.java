/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycomp.symphonysias.model;

/**
 *
 * @author Spiri
 */
public class Estudiante {
    private int id;
    private String nombre;
    private String apellido;
    private String telefono;
    private String direccion;
    private String correo;
    private String genero;
    // constructor vacio
    public Estudiante()
    {}
    //constructor completo que me permite crear un estudiante con todos sus datos de una sola vez 
    public Estudiante(int id,String nombre, String apellido, String telefono,String direccion, String correo, String genero)
    {
     this.id=id;
     this.nombre=nombre;
     this.apellido=apellido;
     this.telefono=telefono;
     this.direccion=direccion;
     this.correo=correo;
     this.genero=genero;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String Genero) {
        this.genero = Genero;
    }
    @Override
    public String toString(){
     return "Estudiante{" +
               "id=" + id +
               ", nombre='" + nombre + '\'' +
               ", apellido='" + apellido + '\'' +
               ", telefono=" + telefono +
               ", direccion='" + direccion + '\'' +
               ", correo=" + correo +
               ", genero=" + genero +
               '}';
    }
}