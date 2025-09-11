<%-- 
    Document   : bienvenida
    Created on : 11/09/2025, 10:37:49 a. m.
    Author     : Spiri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.*" %>
<%@ page import="com.mycomp.symphonysias.model.Usuario" %>


<%
    Usuario usuarioSesion = (session != null) ? (Usuario) session.getAttribute("usuario") : null;
    if (usuarioSesion == null) {
        response.sendRedirect("login.jsp");
        return;        
    }  
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="refresh" content="4;URL=index.jsp"> 
        <title>Acceso concedido</title>
        <style>
            html, body {
                margin: 0;
                padding: 0;
                height: 100%;
                font-family: Arial, sans-serif;
                background-color: #1a1a1a;
                color: white;
                display: flex;
                align-items: center;
                justify-content: center;
                flex-direction: column;
            }
            .overlay {
                background-color: rgba(0, 0, 0, 0.6);
                padding: 40px;
                border-radius: 10px;
                text-align: center;
            }
            .logo {
                max-width: 300px;
                margin-bottom: 30px;
            }
            h2 {
                font-size: 32px;
                margin-bottom: 20px;
            }
            p {
                font-size: 18px;
            }
        </style>
    </head>
    <body>
        <div class="overlay">
            <img src="public/imagen/logo.png" alt="Logo SymphonySIAS" class="logo">
            
            <h2>Bienvenido, <%= usuarioSesion.getUsuario() %>!</h2>
            <p>Acceso concedido al sistema SymphonySIAS.</p>
            <p>Redirigiendo al menu principal...</p>
        </div>
    </body>
</html>
