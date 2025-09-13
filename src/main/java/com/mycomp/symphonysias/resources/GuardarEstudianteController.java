/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Spiri
 */

package com.mycomp.symphonysias.resources;

import com.mycomp.symphonysias.model.Estudiante;
import com.mycomp.symphonysias.model.EstudianteDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/GuardarEstudiante")
public class GuardarEstudianteController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Estudiante est = new Estudiante();
        est.setNombre(request.getParameter("nombre"));
        est.setApellido(request.getParameter("apellido"));
        est.setTelefono(request.getParameter("telefono"));
        est.setDireccion(request.getParameter("direccion"));
        est.setCorreo(request.getParameter("correo"));
        est.setGenero(request.getParameter("genero"));
        
        System.out.println("Datos recibidos:");
        System.out.println("Nombre: " + est.getNombre());
        System.out.println("Apellido: " + est.getApellido());
        System.out.println("Teléfono: " + est.getTelefono());
        System.out.println("Dirección: " + est.getDireccion());
        System.out.println("Correo: " + est.getCorreo());
        System.out.println("Género: " + est.getGenero());


        EstudianteDao dao = new EstudianteDao();
        boolean exito = dao.guardar(est);

        if (exito) {
            response.sendRedirect("Estudiante.jsp?guardado=true");
        } else {
            response.sendRedirect("GuardarEstudiante.jsp?error=true");
        }
    }
}
