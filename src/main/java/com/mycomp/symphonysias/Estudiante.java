/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycomp.symphonysias;

/**
 *
 * @author Spiri
 */
public class Estudiante {
    private int id;
    private String nombreAlumno;
    private String apellidoAlumno;
    private String telefono;
    private String direccion;
    private String correo;
    private String Genero;
    // constructor vacio
    public Estudiante()
    {}
    //constructor completo que me permite crear un estudiante con todos sus datos de una sola vez 
    public Estudiante(int id,String nombreAlumno, String apellidoAlumno, String telefono,String direccion, String correo, String genero)
    {
     this.id=id;
     this.nombreAlumno=nombreAlumno;
     this.apellidoAlumno=apellidoAlumno;
     this.telefono=telefono;
     this.direccion=direccion;
     this.correo=correo;
     this.Genero=genero;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombreAlumno() {
        return nombreAlumno;
    }

    public void setNombreAlumno(String nombreAlumno) {
        this.nombreAlumno = nombreAlumno;
    }

    public String getApellidoAlumno() {
        return apellidoAlumno;
    }

    public void setApellidoAlumno(String apellidoAlumno) {
        this.apellidoAlumno = apellidoAlumno;
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
        return Genero;
    }

    public void setGenero(String Genero) {
        this.Genero = Genero;
    }
    @Override
    public String toString(){
     return "Nota{" +
               "id=" + id +
               ", nombreAlumno='" + nombreAlumno + '\'' +
               ", apellidoAlumno='" + apellidoAlumno + '\'' +
               ", telefono=" + telefono +
               ", direccion='" + direccion + '\'' +
               ", correo=" + correo +
               ", genero=" +Genero +
               '}';
    }
}