/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycomp.symphonysias;

import com.mycomp.symphonysias.model.Estudiante;
import com.mycomp.symphonysias.model.EstudianteDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author Spiri
 */
@WebServlet(name = "ServletEstudiante", urlPatterns = {"/ServletEstudiante"})
public class ServletEstudiante extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try(PrintWriter out = response.getWriter()){
            /*Todo output your page here. You may use following xample code.*/
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServletEstudiante</title>");
            out.println("/head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletEstudiante at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    public void GuardarEstudiante(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        String apellido =request.getParameter("apellido");
        String telefono = request.getParameter("telefono");
        String direccion = request.getParameter("direccion");
        String correo = request.getParameter("correo");
        String genero = request.getParameter("genero");
        EstudianteDao estudianteDao = new EstudianteDao();
        estudianteDao.InsertarEstudiante(nombre, apellido, telefono, direccion, correo, genero);
        //Redirigimos al JSP con mensaje de exito
        response.sendRedirect("GuardarEstudiante.jsp?mensaje=Ok");
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        if("mostrar".equals(action)){
            mostrarEstudiante(request,response);
        }else if("modificar".equals(action)){
            // Mostrar el formulario con los datos del estudiante teniendo como filtro el ID
            int id = Integer.parseInt(request.getParameter("id"));
            EstudianteDao estudianteDao = new EstudianteDao();
            Estudiante estudiante =estudianteDao.obtenerEstudiantePorId(id);
            request.setAttribute("estudiante",estudiante);
            request.getRequestDispatcher("ModificarEstudiante.jsp").forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if("guardar".equals(action)){
          GuardarEstudiante(request,response);
        }else if("actualizar".equals(action)){
            ActualizarEstudiante(request,response); 
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
     public void mostrarEstudiante(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
            EstudianteDao estudianteDao = new EstudianteDao();
            List<Estudiante> estudiantes = estudianteDao.ListarEstudiantes();
            request.setAttribute("listadestudiantes",estudiantes);
            request.getRequestDispatcher("index.jsp").forward(request, response);
            mostrarEstudianteModificar(request,response);
            
     }
     
     
     public void mostrarEstudianteModificar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
            EstudianteDao estudianteDao = new EstudianteDao();
            List<Estudiante> estudiantes = estudianteDao.ListarEstudiantes();
            request.setAttribute("listadestudiantes",estudiantes);
            request.getRequestDispatcher("ModificarEstudiantes.jsp").forward(request, response);
     }
     
     public void ActualizarEstudiante(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
       int id = Integer.parseInt(request.getParameter("id"));
       String nombre = request.getParameter("nombre");
       String apellido = request.getParameter("nombre");
       String telefono = request.getParameter("telefono");
       String direccion = request.getParameter("direccion");
       String correo = request.getParameter("correo");
       String genero = request.getParameter("genero");
       EstudianteDao estudianteDao = new EstudianteDao();
       estudianteDao.ActualizarEstudiante(id, nombre, apellido, telefono, direccion, correo, genero);
       response.sendRedirect("ServletEstudiante?action=mostrar");
     }

}