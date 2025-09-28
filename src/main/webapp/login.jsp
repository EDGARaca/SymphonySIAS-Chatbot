<%-- 
    Document   : login.jsp
    Created on : 2/09/2025, 11:20:46 a. m.
    Author     : Spiri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mycomp.symphonysias.model.Usuario"%>
<%
    HttpSession sesion = request.getSession(false);
    Usuario usuarioActivo = (Usuario) sesion.getAttribute("usuario");
    String nombreUsuario = (usuarioActivo != null) ? usuarioActivo.getNombre() : "Invitado";
    String rolUsuario = (usuarioActivo != null) ? usuarioActivo.getRol() : "Sin rol";
%>
<!DOCTYPE html>
<html>
<head>
    <title>Panel - Escuela de Música SymphonySIAS</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: #FCFCFC; /* fondo suave */
            text-align: center;
        }
        .titulo {
            background-color: #FCFCFC; /* fondo titulo */
            color: #FEDC0B;
            padding: 50px 0 10px;
            font-size: 30px;
            font-weight: bold;
        }
        .usuario {
            font-size: 20px;
            color: #000000;
            margin-bottom: 0px;
        }
        hr {
            border: none;
            height: 2px;
            background-color: #CBD6D6; /* lineas */
            margin: 20px auto;
            width: 80%;
        }
        .fila {
            display: flex;
            justify-content: center;
            gap: 30px;
            padding: 15px 20px;
            flex-wrap: wrap;
        }
        .recuadro {
            background-color: #6FE2E8; /* rosa pastel */
            color: #2C3E50;
            border-radius: 8px;
            padding: 8px 16px;
            font-size: 17px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
            text-decoration: none;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        .recuadro:hover {
            background-color: #2EB8BF; /* más oscuro al hover */
        }
        .imagen-final {
            margin: 40px auto;
        }
        .imagen-final img {
            width: 85%;
            max-width: 900px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.2);
        }
    </style>
</head>
<body>
    <div class="titulo">
        SISTEMA DE INFORMACIÓN ACADÉMICA SYMPHONY - SIAS  
        <div class="usuario">👤 Usuario activo: <strong><%= nombreUsuario %></strong> (<%= rolUsuario %>)</div>
    </div>

    <hr>

    <div class="fila">
        <a href="modulo1.jsp" class="recuadro">Usuarios</a>
        <a href="modulo2.jsp" class="recuadro">Estudiantes</a>
        <a href="modulo3.jsp" class="recuadro">Materias</a>
        <a href="modulo4.jsp" class="recuadro">Docentes</a>
        <a href="modulo5.jsp" class="recuadro">Programas</a>
        <a href="modulo6.jsp" class="recuadro">Notas</a>
    </div>

    <hr>

    <div class="imagen-final">
        <img src="public/imagen/banda.jpg" alt="Imagen decorativa">
    </div>
</body>
</html>