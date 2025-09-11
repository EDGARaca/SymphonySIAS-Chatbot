/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Spiri
 */

package com.mycomp.symphonysias.resources;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import com.mycomp.symphonysias.Login;
import com.mycomp.symphonysias.model.Usuario;

@WebServlet("/login")
public class LoginController extends HttpServlet {
    private Login loginService;
    
    @Override
    public void init() throws ServletException {
        loginService = new Login();
    }
        
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        System.out.println("LoginController invocado"); // Verifica si el servlet se ejecuta
        
        String usuario = request.getParameter("usuario");
        String clave = request.getParameter("clave");
        
        System.out.println("Usuario recibido: " + usuario);
        System.out.println("Clave recibida: " + clave);
        
        Usuario user = loginService.autenticar(usuario, clave);
        
        System.out.println("Resultado autenticacion: " + (user != null ? "Autenticado" : "Fallo"));
        
        if(user != null) {
            HttpSession sesion = request.getSession();
            sesion.setAttribute("usuario", user);
            
            String rol = user.getRol().toLowerCase();
            
            if (rol.startsWith("admin")) {
                response.sendRedirect("bienvenida.jsp");
            } else if (rol.startsWith("docente")){
                response.sendRedirect("docente.jsp");
            } else if (rol.startsWith("estudiante")){
                response.sendRedirect("estudiante.jsp");
            } else if (rol.startsWith("funcionario")){    
                response.sendRedirect("funcionario.jsp");
            } else {
                System.out.println("Rol no reconocido: " + rol);
                response.sendRedirect("index.jsp");
            }
        } else {
            request.setAttribute("error", "Credenciales inválidas");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }   
}
