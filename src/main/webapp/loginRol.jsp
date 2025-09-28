<%-- 
    Document   : logiRol
    Created on : 27/09/2025, 6:55:48 p. m.
    Author     : camiv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String claveIngresada = request.getParameter("clave");
    String rol = request.getParameter("rol");

    // Clave general o por rol
    String claveCorrecta = "musica2025";

    if (claveIngresada != null && claveIngresada.equals(claveCorrecta)) {
        session.setAttribute("rol", rol);
        response.sendRedirect(rol + ".jsp"); // Redirige a usuario.jsp, estudiante.jsp, etc.
    } else {
%>
    <script>alert("Clave incorrecta"); window.history.back();</script>
<%
    }
%>