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
            <form action="login" method="post">
                <label for="usuario">Usuario: </label>
                <input type="text" name="usuario" id="usuario" required>
                
                <label for="clave">Contraseña: </label>
                <input type="password" name="clave" id="clave" required>
                <div class="login-options">
                    <label><input type="checkbox" checked> Recordarme</label>
                    <a href="#">¿Olvidaste tu contraseña?</a>
                </div>
                
                <input type="submit" value="Ingresar">
            </form>
        </div>
    </body>
</html>
