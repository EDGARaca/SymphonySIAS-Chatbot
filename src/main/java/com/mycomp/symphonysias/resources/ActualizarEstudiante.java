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

@WebServlet("/ActualizarEstudiante")
public class ActualizarEstudiante extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String telefono = request.getParameter("telefono");
            String direccion = request.getParameter("direccion");
            String correo = request.getParameter("correo");
            String genero = request.getParameter("genero");

            Estudiante est = new Estudiante();
            est.setId(id);
            est.setNombre(nombre);
            est.setApellido(apellido);
            est.setTelefono(telefono);
            est.setDireccion(direccion);
            est.setCorreo(correo);
            est.setGenero(genero);

            EstudianteDao dao = new EstudianteDao();
            boolean actualizado = dao.actualizar(est);

            if (actualizado) {
                response.sendRedirect("Estudiante.jsp?actualizado=true");
            } else {
                response.sendRedirect("Estudiante.jsp?errorActualizar=true");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("Estudiante.jsp?errorActualizar=true");
        }
    }

}
