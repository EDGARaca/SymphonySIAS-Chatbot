/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycomp.symphonysias.model;
import com.mycomp.symphonysias.ConexionDao;
import java.sql.*;
import java.util.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


/**
 *
 * @author Spiri
 */
public class EstudianteDao {
    // creamos una función la cual nos permite insertar nuevos registros de estudiante
    public void InsertarEstudiante(String nombre, String apellido,String telefono, String direccion, String correo, String genero){
        Connection conn = null;
        PreparedStatement stmt = null;
        try{
           // consulta inserccion de registro en la base de datos
           conn = ConexionDao.obtenerConexion();
           String sql = "INSERT INTO estudiantes(Nombre,Apellido,Telefono,Direccion,Correo,Genero) VALUES(?,?,?,?,?,?)";
           stmt = conn.prepareStatement(sql);
           stmt.setString(1, nombre);
           stmt.setString(2, apellido);
           stmt.setString(3, telefono);
           stmt.setString(4, direccion);
           stmt.setString(5, correo);
           stmt.setString(6, genero);
           stmt.executeUpdate();
           
          }catch(Exception e){
              System.out.println("Error al insertar estudiante"+e.getMessage());
              e.printStackTrace();
          }finally{
                   ConexionDao.cerrarConexion(conn);
                  }
    }
    
    public boolean guardar(Estudiante est) {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
        conn = ConexionDao.obtenerConexion();
        String sql = "INSERT INTO estudiantes (nombre, apellido, telefono, direccion, correo, genero) VALUES (?, ?, ?, ?, ?, ?)";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, est.getNombre());
        stmt.setString(2, est.getApellido());
        stmt.setString(3, est.getTelefono());
        stmt.setString(4, est.getDireccion());
        stmt.setString(5, est.getCorreo());
        stmt.setString(6, est.getGenero());
        return stmt.executeUpdate() > 0;
    } catch (Exception e) {
        System.out.println("Error al guardar estudiante: " + e.getMessage());
        e.printStackTrace();
        return false;
    } finally {
        ConexionDao.cerrarConexion(conn);
    }
    }/////aqui
    ///
    public boolean actualizar(Estudiante est) {
    Connection conn = null;
    PreparedStatement stmt = null;
    boolean exito = false;
    try {
        conn = ConexionDao.obtenerConexion();
        String sql = "UPDATE estudiantes SET nombre = ?, apellido = ?, telefono = ?, direccion = ?, correo = ?, genero = ? WHERE id = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, est.getNombre());
        stmt.setString(2, est.getApellido());
        stmt.setString(3, est.getTelefono());
        stmt.setString(4, est.getDireccion());
        stmt.setString(5, est.getCorreo());
        stmt.setString(6, est.getGenero());
        stmt.setInt(7, est.getId());
        exito = stmt.executeUpdate() > 0;
    } catch (Exception e) {
        System.out.println("Error al actualizar estudiante: " + e.getMessage());
        e.printStackTrace();
    } finally {
        ConexionDao.cerrarConexion(conn);
    }
    return exito;
}

    

    // creamos una función tipo publica la cual nos permite actualizar los datos de los estudiantes
    public void ActualizarEstudiante(int id, String nombre, String apellido, String telefono, String direccion, String correo, String genero){
     Connection conn = null;
     PreparedStatement stmt = null;
     try{
         // para conectarnos a nuestra base de datos con la función obtenerConexion
        conn = ConexionDao.obtenerConexion();
        // Realizamos la consulta a nuestra base de datos
        String sql ="update estudiantes set Nombre =?,Apellido =?,Telefono=?,Direccion=?,Correo=?,Genero=? WHERE id=?";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, nombre);
        stmt.setString(2, apellido);
        stmt.setString(3, telefono);
        stmt.setString(4, direccion);
        stmt.setString(5, correo);
        stmt.setString(6, genero);
        stmt.setInt(7, id);
        stmt.executeUpdate();
        
     }catch(Exception e){
          System.out.println("Error al actualizar registro de estudiante"+e.getMessage());
              e.printStackTrace();
     }finally{
                   ConexionDao.cerrarConexion(conn);
                  }
    }
    // Listar Estudiantes
    public List<Estudiante> ListarEstudiantes(){
    List<Estudiante> estudiantes = new ArrayList<>();
    Connection conn= null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    try{
        conn = ConexionDao.obtenerConexion();
        String sql ="SELECT * FROM estudiantes;";
        stmt = conn.prepareStatement(sql);
        rs = stmt.executeQuery();
        while(rs.next()){
        Estudiante student = new Estudiante();
        student.setId(rs.getInt("id"));
        student.setNombre(rs.getString("nombre"));
        student.setApellido(rs.getString("apellido"));
        student.setTelefono(rs.getString("telefono"));
        student.setDireccion(rs.getString("direccion"));
        student.setCorreo(rs.getString("correo"));
        student.setGenero(rs.getString("genero"));
        estudiantes.add(student);
        }
    }catch(Exception e){
      e.printStackTrace();
    }finally{
        ConexionDao.cerrarConexion(conn);
        
    }
        return estudiantes;
        
    }
// Funcion para obtenerEstudiantesPorId el cual nos permite actualizar los datos de los estudiantes 
  public Estudiante obtenerEstudiantePorId(int id){
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    Estudiante estudiante = null;

    try{
        // Conexión a la base de datos
        conn = ConexionDao.obtenerConexion();
        String sql = "SELECT * FROM estudiantes WHERE Id = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setInt(1, id);
        rs = stmt.executeQuery();

        if(rs.next()){
            estudiante = new Estudiante();
            estudiante.setId(rs.getInt("id"));
            estudiante.setNombre(rs.getString("Nombre"));
            estudiante.setApellido(rs.getString("Apellido"));
            estudiante.setTelefono(rs.getString("Telefono"));
            estudiante.setDireccion(rs.getString("Direccion"));
            estudiante.setCorreo(rs.getString("Correo"));
            estudiante.setGenero(rs.getString("Genero"));
        }

    }catch(Exception e){
        System.out.println("Error al obtener estudiante por ID: " + e.getMessage());
        e.printStackTrace();
    }finally{
        ConexionDao.cerrarConexion(conn);
    }

    return estudiante;
}
 /*
    Se crea una función para contar el numero de estudiantes e implementar en dashboard principal y muestre en una card el numerode estudiantes
  */
  
  public int contarEstudiantes(){
   int total = 0;
   Connection conn = null;
   PreparedStatement stmt = null;
   ResultSet rs = null;
   try{
       conn = ConexionDao.obtenerConexion();
       String sql = "SELECT COUNT(*) FROM estudiantes;";
       stmt = conn.prepareStatement(sql);
       rs = stmt.executeQuery();
       if(rs.next()){
           total = rs.getInt(1);
       }
   }catch(Exception e ){
       System.out.println("Error al contar estudiantes" +e.getMessage());
   }finally{
     ConexionDao.cerrarConexion(conn);
   }
   return total;
  }
  
  public void eliminar(int id) {
    Connection conn = null;
    PreparedStatement stmt = null;
    try {
        conn = ConexionDao.obtenerConexion();
        String sql = "DELETE FROM estudiantes WHERE id = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setInt(1, id);
        stmt.executeUpdate();
    } catch (Exception e) {
        System.out.println("Error al eliminar estudiante: " + e.getMessage());
        e.printStackTrace();
    } finally {
        ConexionDao.cerrarConexion(conn);
    }
}

  
  
  
}