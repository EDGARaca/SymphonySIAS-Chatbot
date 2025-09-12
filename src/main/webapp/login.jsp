<%-- 
    Document   : login.jsp
    Created on : 2/09/2025, 11:20:46 a. m.
    Author     : Spiri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login - SymphonySIAS</title>
        
        <link rel="stylesheet" href="public/css/style.css">
    </head>
    <body>
        <div class="login-container">
            <h5>Ingreso al sistema</h5>
            <h2>SYMPHONY SIAS</h2>
            <form action="login" method="post" class="login-form">
                <h4 class="mb-3">Inicio de sesión</h4>
                <div class="mb-3">
                    <input type="text" name="usuario" class="form-control" placeholder="Usuario" required>
                </div>
                <div class="mb-3">
                    <input type="password" name="clave" class="form-control" placeholder="Clave" required>
                </div>
                <button type="submit" class="btn btn-success w-100">Ingresar</button>
                
                <%
                    String error = request.getParameter("error");
                    if ("1".equals(error)) {
                %>    
                    <p class="text-danger mt-2">Usuario o clave incorrectos</p>
                <% 
                    } 
                %>
            </form>
            <div class="login-options">
                <label><input type="checkbox" checked> Recordarme</label>
                <a href="#">¿Olvidaste tu contraseña?</a>
            </div>
        </div>
    </body>
</html>
