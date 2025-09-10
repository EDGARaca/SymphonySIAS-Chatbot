/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author Spiri
 */

package com.mycomp.symphonysias.auth;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
        
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
        String usuario = req.getParameter("usuario");
        String clave = req.getParameter("clave");
        
        UsuarioDAO dao = new UsuarioDAO();
        Usuario usuarioObj = dao.obtenerUsuario(usuario, clave);

        if (usuario != null) {
            HttpSession session = req.getSession();
            session.setAttribute("nombre", usuarioObj.getNombre());
            session.setAttribute("rol", usuarioObj.getRol());
            resp.sendRedirect("dashboard.jsp");
        } else {
            resp.sendRedirect(req.getContextPath() + "/error.jsp");
        }
    }
}