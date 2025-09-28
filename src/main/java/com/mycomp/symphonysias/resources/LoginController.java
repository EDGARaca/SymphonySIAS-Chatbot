/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package com.mycomp.symphonysias.resources;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import com.mycomp.symphonysias.auth.UsuarioDAO;
import com.mycomp.symphonysias.model.Usuario;

@WebServlet("/login")
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Si alguien accede directamente a /login, redirige al formulario inicial
        response.sendRedirect("login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String fase = request.getParameter("fase");

        // Si no se especifica fase, redirige al login inicial
        if (fase == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Fase 1: ingreso con clave general
        if ("inicio".equals(fase)) {
            String clave = request.getParameter("clave");

            if ("symphony2025".equals(clave)) {
                response.sendRedirect("home.jsp");
            } else {
                response.sendRedirect("login.jsp?error=1");
            }
            return;
        }

        // Fase 2: ingreso por rol con usuario y contraseña
        if ("rol".equals(fase)) {
            String usuario = request.getParameter("usuario");
            String clave = request.getParameter("clave");
            String rol = request.getParameter("rol");

            UsuarioDAO dao = new UsuarioDAO();
            Usuario user = dao.validar(usuario, clave);

            if (user != null && user.getRol().equalsIgnoreCase(rol)) {
                HttpSession sesion = request.getSession();
                sesion.setAttribute("usuario", user);

                switch (rol) {
                    case "admin":
                        response.sendRedirect("admin.jsp");
                        break;
                    case "estudiante":
                        response.sendRedirect("gestionEstudiantes.jsp");
                        break;
                    default:
                        response.sendRedirect("bienvenida.jsp");
                        break;
                }
            } else {
                response.sendRedirect("loginRol.jsp?rol=" + rol + "&error=1");
            }
        }
    }
}