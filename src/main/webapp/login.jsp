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
    </head>
    <body>
        <h2>Ingreso al sistema</h2>
        <form method="post" action="login">
            <label>Usuario: </label>
            <input type="text" name="usuario" required><br><br>
            <label>Contraseña: </label>
            <input type="password" name="clave" required><br><br>
            <input type="submit" value="Ingresar">
        </form>
    </body>
</html>
