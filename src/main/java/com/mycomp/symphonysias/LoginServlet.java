/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycomp.symphonysias;

import com.mycomp.symphonysias.Login;
import com.mycomp.symphonysias.model.Usuario;

import javax.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String usuario = request.getParameter("usuario");
        String clave = request.getParameter("clave");

        Login login = new Login();
        Usuario usuarioAutenticado = login.autenticar(usuario, clave);

        if (usuarioAutenticado != null) {
            HttpSession session = request.getSession();
            session.setAttribute("usuario", usuarioAutenticado);
            response.sendRedirect("bienvenida.jsp");
        } else {
            response.sendRedirect("login.jsp?error=1");
        }
    }

    // 👇 Este método es solo para probar si el servlet está activo
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().println("LoginServlet activo");
    }
}
