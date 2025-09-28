<%-- 
    Document   : Home
    Created on : 30/08/2025, 12:21:25 p. m.
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
            background-color: #FCFCFC;
            text-align: center;
        }
        .titulo {
            background-color: #FCFCFC;
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
            background-color: #CBD6D6;
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
            background-color: #6FE2E8;
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
            background-color: #2EB8BF;
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
        .chat-burbuja {
            position: fixed;
            bottom: 20px;
            right: 20px;
            background-color: #B0C2F2;
            color: white;
            font-size: 24px;
            border-radius: 50%;
            width: 60px;
            height: 60px;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 4px 12px rgba(0,0,0,0.2);
            cursor: pointer;
            transition: transform 0.3s ease;
            z-index: 1000;
        }
        .chat-burbuja:hover {
            transform: scale(1.1);
            background-color: #8FA8D6;
        }

        .chat-contenedor {
            position: fixed;
            bottom: 90px;
            right: 20px;
            width: 280px;
            background-color: #FFF8F0;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.2);
            padding: 15px;
            display: none;
            flex-direction: column;
            z-index: 999;
        }
        .chat-header {
            font-weight: bold;
            font-size: 16px;
            color: #2C3E50;
            margin-bottom: 10px;
        }
        .chat-mensaje {
            font-size: 14px;
            color: #2C3E50;
            margin-bottom: 10px;
        }
        .chat-input {
            padding: 8px;
            border: 1px solid #CBD6D6;
            border-radius: 8px;
            font-size: 14px;
            width: 100%;
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
        <form action="loginRol.jsp" method="post">
            <input type="hidden" name="rol" value="usuario">
            <input type="password" name="clave" placeholder="Clave" required>
            <input type="submit" class="recuadro" value="Usuarios">
        </form>
        <form action="loginRol.jsp" method="post">
            <input type="hidden" name="rol" value="estudiante">
            <input type="password" name="clave" placeholder="Clave" required>
            <input type="submit" class="recuadro" value="Estudiantes">
        </form>
        <form action="loginRol.jsp" method="post">
            <input type="hidden" name="rol" value="materia">
            <input type="password" name="clave" placeholder="Clave" required>
            <input type="submit" class="recuadro" value="Materias">
        </form>
        <form action="loginRol.jsp" method="post">
            <input type="hidden" name="rol" value="docente">
            <input type="password" name="clave" placeholder="Clave" required>
            <input type="submit" class="recuadro" value="Docentes">
        </form>
        <form action="loginRol.jsp" method="post">
            <input type="hidden" name="rol" value="programa">
            <input type="password" name="clave" placeholder="Clave" required>
            <input type="submit" class="recuadro" value="Programas">
        </form>
        <form action="loginRol.jsp" method="post">
            <input type="hidden" name="rol" value="nota">
            <input type="password" name="clave" placeholder="Clave" required>
            <input type="submit" class="recuadro" value="Notas">
        </form>
    </div>

    <hr>

    <div class="imagen-final">
        <img src="public/imagen/banda.jpg" alt="Imagen decorativa">
    </div>
    <div class="chat-burbuja" onclick="abrirChat()">💬</div>

    <div id="chatBot" class="chat-contenedor">
        <div class="chat-header">Asistente Symphony 🎶</div>
        <div class="chat-mensaje">Hola, ¿en qué puedo ayudarte?</div>
        <input type="text" placeholder="Escribe tu mensaje..." class="chat-input">
    </div>
    <script>
        function abrirChat() {
            const chat = document.getElementById("chatBot");
            chat.style.display = (chat.style.display === "flex") ? "none" : "flex";
        }
    </script>
</body>
</html>