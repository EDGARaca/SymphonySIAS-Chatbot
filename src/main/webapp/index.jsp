<%-- 
    Document   : index
    Created on : 30/08/2025, 11:45:58 a. m.
    Author     : Spiri
--%>

<%@page import="java.util.List"%>
<%@page import="com.mycomp.symphonysias.Estudiante"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mycomp.symphonysias.model.Usuario"%>
<%@page session="true"%>

<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    boolean autenticado = (usuario != null);
%>

<!DOCTYPE html>

<html>
    <head>
        <meta charset="UTF-8">
        <title>Sistema de Informacion Academico SYMPHONY - SIAS</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
        <style>
            body {
                margin: 0;
                padding: 0;
                background-image: url("public/imagen/pexels-jplenio-1103970.jpg");
                background-size: cover; 
                background-position: center;
                backdrop-filter: blur(<%= autenticado ? "0px" : "6px" %>);
            }
            .login-container {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                display: <%= autenticado ? "none" : "flex" %>;
                background-color: rgba(255, 255, 255, 0.95);
                border-radius: 12px;
                box-shadow: 0 0 20px rgba(0,0,0,0.3);
                padding: 30px;
                width: 500px;
                max-width: 90%;
                z-index: 10; <%--Garantiza el login este por encima del fondo y del dashboard--%>
            }
            .login-logo {
                width: 100px;
                margin-right: 20px;
            }
            .login-form {
                flex: 1;
            }
            
            .dashboard {
                opacity: <%= autenticado ? "1" : "0.4" %>; 
                pointer-events: <%= autenticado ? "auto" : "none" %>;
                transition: opacity 0.5s ease;
                padding: 20px;
                position: relative;
                z-index: 1; <%--Garantiza que el dashboard quede por debajo del formulario de login--%>
            }
        </style>
    </head>
    
       <body>
        <%--Login--%>
        <div class="login-container">
            <img src="public/imagen/logo.png" alt="Logo SymphonySIAS" class="login-logo">
            <form action="login" method="post" class="login-form">
                <h4 class="mb-3">Inicio de sesión</h4>
                <div class="mb-3">
                    <input type="text" name="usuario" class="form-control" placeholder="Usuario" required>
                </div>
                <div class="mb-3">
                    <input type="password" name="clave" class="form-control" placeholder="Clave" required>
                </div>
                <button type="submit" class="btn btn-success w-100">Ingresar</button>
                <% if (request.getParameter("error") != null) { %>
                <p class="text-danger mt-2">Credenciales incorrectas.</p>
                <% }%>
            </form>
        </div>
        
        <%--Dashboard--%>
        <div class="dashboard">
            <div class="container text-center">
                <div class="row mt-4">
                    <div class="card">
                        <div class="card-body">
                            <h2 class="text-warning"><b>SISTEMA DE INFORMACION ACADEMICA SYMPHONY - SIAS</b></h2>
                            <hr>
                            <a href="" class="btn btn-outline-info">Usuarios</a>
                            <a href="Estudiante.jsp" class="btn btn-outline-info" target="_blank">Gestion de Estudiantes</a>
                            <a href="" class="btn btn-outline-info">Gestion de Materias</a>
                            <a href="" class="btn btn-outline-info">Gestion de Docentes</a>
                            <a href="" class="btn btn-outline-info">Gestion de Programas</a>
                            <a href="" class="btn btn-outline-info">Gestion de Notas</a>
                            <hr>
                            <div class="d-flex justify-content-end align-items-center" style="margin-right: 20px;">
                                <form action="LogoutController" method="post">
                                <button type="submit" class="btn btn-outline-danger btn-sm" title="Cerrar sesión">
                                    <i class="fas fa-sign-out-alt"></i> Salir
                                </button>
                                </form>
                            </div>  
                            <img src="public/imagen/banda.jpg" width="100%" style="max-height: 600px; object-fit: cover;">
                        </div>
                    </div>
                </div>
            </div>
        </div>     
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous"></script>
    </body>
</html>    


