<%-- 
    Document   : dashboard
    Created on : 2/09/2025, 11:21:33 a. m.
    Author     : Spiri
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>



<%
    HttpSession session = request.getSession(false);
    Usuario usuarioSesion = (session != null) ? (Usuario) session.getAttribute("usuario") : null;
    if (usuarioSesion == null) {
        response.sendRedirect(request.getContextPath() + "login.jsp");
        return;        
    }  
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Bienvenido</title>
    </head>
    <body>
        <h2>Bienvenido, <%= usuarioSesion %>!</h2>
        <p>Acceso concedido al sistema SymphonySIAS.</p>
    </body>
</html>
