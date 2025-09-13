/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Spiri
 */

package com.mycomp.symphonysias.resources;

import com.mycomp.symphonysias.model.EstudianteDao;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/EliminarEstudiante")
public class EliminarEstudiante extends HttpServlet {    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            EstudianteDao dao = new EstudianteDao();
            dao.eliminar(id);
            response.sendRedirect("Estudiante.jsp?eliminado=true");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("Estudiante.jsp?errorEliminar=true");
        }
    }
}
