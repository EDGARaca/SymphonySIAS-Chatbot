<%-- 
    Document   : usuario
    Created on : 27/09/2025, 9:19:33 p. m.
    Author     : camiv
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
    <title>Vista Usuario - SymphonySIAS</title>
</head>
<body>
    <h2>SISTEMA DE INFORMACIÓN ACADÉMICA SYMPHONY - SIAS</h2>
    <p>👤 Usuario activo: <strong><%= nombreUsuario %></strong> (<%= rolUsuario %>)</p>
    <p>Bienvenido al módulo de gestión de usuarios.</p>
</body>
</html>