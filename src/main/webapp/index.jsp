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
    if (usuario == null){
        response.sendRedirect("login.jsp");
        return;
    }
    boolean autenticado = true;
%>

<!DOCTYPE html>

<html>
    <head>
        <meta charset="UTF-8">
        <title>Sistema de Informacion Academico SYMPHONY - SIAS</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
        <style>
        /* === ESTILOS GENERALES === */
        body {
          font-family: Arial, sans-serif;
          margin: 0;
          background-color: #f9f9f9;
        }

        /* === BURBUJA FLOTANTE === */
        .chat-bubble {
          position: fixed;
          bottom: 20px;
          right: 20px;
          width: 60px;
          height: 60px;
          border-radius: 50%;
          background: #007bff;
          color: #fff;
          display: flex;
          align-items: center;
          justify-content: center;
          cursor: pointer;
          box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
          transition: background 0.3s;
          z-index: 9999;
        }

        .chat-bubble:hover {
          background: #0056b3; /* Contraste mayor al pasar el mouse */
        }

        /* === CONTENEDOR DEL CHATBOT (oculto inicialmente) === */
        .chat-container {
          position: fixed;
          bottom: 90px;
          right: 20px;
          width: 100%;
          max-width: 380px;
          height: 500px;
          background: #fff;
          border-radius: 12px;
          box-shadow: 0 6px 16px rgba(0, 0, 0, 0.2);
          display: flex;
          flex-direction: column;
          opacity: 0;
          pointer-events: none;
          transform: translateY(20px);
          transition: opacity 0.3s ease, transform 0.3s ease;
          overflow: hidden;
          z-index: 9999;
        }

        /* Cuando está activo se muestra con animación */
        .chat-container.active {
          opacity: 1;
          pointer-events: auto;
          transform: translateY(0);
        }

        /* === CABECERA DEL CHATBOT === */
        .chat-header {
          background: #007bff;
          color: #fff;
          padding: 12px;
          text-align: center;
          font-size: 16px;
          font-weight: bold;
          position: relative;
        }

        /* Botón para cerrar el chat */
        .close-btn {
          position: absolute;
          right: 12px;
          top: 12px;
          background: transparent;
          border: none;
          color: #fff;
          font-size: 18px;
          cursor: pointer;
        }

        /* === ÁREA DE MENSAJES === */
        .messages {
          flex: 1;
          padding: 12px;
          overflow-y: auto;
          background: #f4f4f4;
        }

        .message {
          margin: 8px 0;
          padding: 10px;
          border-radius: 10px;
          max-width: 75%;
          font-size: 14px;
          line-height: 1.4;
        }

        .user {
          background-color: #d1e7ff;
          align-self: flex-end;
          margin-left: auto;
        }

        .bot {
          background-color: #e9ecef;
          align-self: flex-start;
          margin-right: auto;
        }

        /* === ÁREA DE INPUT === */
        .input-area {
          display: flex;
          border-top: 1px solid #ccc;
          background: #fff;
        }

        .input-area input {
          flex: 1;
          padding: 12px;
          border: none;
          outline: none;
          font-size: 14px;
        }

        .input-area button {
          padding: 12px 16px;
          background: #007bff;
          color: white;
          border: none;
          cursor: pointer;
          transition: background 0.3s;
        }

        .input-area button:hover {
          background: #0056b3;
        }

        /* === ACCESIBILIDAD Y RESPONSIVIDAD === */
        @media (max-width: 480px) {
          .chat-container {
            right: 10px;
            left: 10px;
            height: 70vh; /* altura dinámica para móviles */
          }
        }
        </style>
        
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
        
        <!-- BURBUJA FLOTANTE -->
        <button class="chat-bubble" id="chatToggle" aria-label="Abrir chat con el bot">💬</button>

        <!-- CONTENEDOR PRINCIPAL DEL CHAT -->
        <div class="chat-container" id="chatContainer" role="dialog" aria-modal="true" aria-labelledby="chatTitle">
        <!-- CABECERA -->
        <div class="chat-header">
            <span id="chatTitle">Chatbot Educativo</span>
            <button class="close-btn" id="closeChat" aria-label="Cerrar chat">✖</button>
        </div>

        <!-- ÁREA DE MENSAJES -->
        <div class="messages" id="messages" role="log" aria-live="polite"></div>

        <!-- ÁREA DE INPUT -->
        <div class="input-area">
            <input type="text" id="userInput" aria-label="Escribe tu mensaje" placeholder="Escribe tu pregunta..." />
            <button id="sendBtn">Enviar</button>
        </div>
        </div>

        <script>
        // === REFERENCIAS A ELEMENTOS DEL DOM ===
        const chatToggle = document.getElementById("chatToggle");
        const chatContainer = document.getElementById("chatContainer");
        const closeChat = document.getElementById("closeChat");
        const messages = document.getElementById("messages");
        const userInput = document.getElementById("userInput");
        const sendBtn = document.getElementById("sendBtn");

        /* === FUNCIÓN: agregar mensaje al área === */
        function addMessage(text, sender) {
            const div = document.createElement("div");
            div.classList.add("message", sender);
            div.textContent = text;
            messages.appendChild(div);
            messages.scrollTop = messages.scrollHeight; // siempre baja al último mensaje
        }

        /* === RESPUESTAS SIMPLES DEL BOT === */
        function botResponse(input) {
            const pregunta = input.toLowerCase();
            if (pregunta.includes("hola")) {
                return "Hola soy ChatBot SYMPHONY, me encanta ayudarte a resolver tus melodiosas preguntas frecuentes, sobre el proyecto de música SYMPHONY-SIAS de la escuela La Gran Sinfonía.";
            }
            else if (pregunta.includes("objetivo")) {
                return "El objetivo del proyecto es desarrollar habilidades en programación y tecnología.";
            } else if (pregunta.includes("tecnologias")) {
                return "Estamos usando JavaScript como base del chatbot, pero también se aplica en Python.";
            } else if (pregunta.includes("integracion")) {
                return "La integración consiste en combinar el chatbot con tu proyecto formativo.";
            } else if (pregunta.includes("salir")) {
                return "Gracias por conversar conmigo. ¡Éxitos en tu proyecto! 👋";
            } else if (pregunta.includes("instrumentos")) {
                return "Tú puedes aprender a tocar Piano, Guitarra Eléctrica, Guitarra Acústica, Batería, Violín, Trompeta, Saxofón, Tiple.";
            } else if (pregunta.includes("cursos")) {
                return "Tenemos los curso de Preparatorio 1, Preparatorio 2, Básico 1, Básico 2, Básico 3, Básico 4";
            } else if (pregunta.includes("valor")) {
                return "El valor del semestre es de $ 3.850.000 COP y si gustas cursar con Armonía Aplicada $ 5.000.000 COP.";
            } else if (pregunta.includes("forma")) {
                return "Para tú comodidad puedes pagar en efectivo en nuestras oficinas, pago eléctronico con Daviplata, Nequi, PayPal.";
            } else {
                return "Lo siento, aún no tengo respuesta para esa pregunta.";
            }
        }

        /* === FUNCIÓN: enviar mensaje del usuario === */
        function sendMessage() {
            const text = userInput.value.trim();
            if (!text) return;

            addMessage(text, "user"); // añade mensaje de usuario
            userInput.value = ""; // limpia input

            // pequeña pausa para simular procesamiento
            const respuesta = botResponse(text);
            setTimeout(() => addMessage(respuesta, "bot"), 400);
        }

        /* === EVENTOS === */

        // Abrir / cerrar chatbot al hacer clic en la burbuja
        chatToggle.addEventListener("click", () => {
            chatContainer.classList.toggle("active");
            if (chatContainer.classList.contains("active")) {
                userInput.focus();
            }
        });


        // Cerrar chatbot y limpiar historial de mensajes
        closeChat.addEventListener("click", () => {
            chatContainer.classList.remove("active");
            messages.innerHTML = ""; // limpia mensajes automáticamente
        });

        // Botón enviar
        sendBtn.addEventListener("click", sendMessage);

        // Enviar con tecla Enter
        userInput.addEventListener("keypress", (e) => {
            if (e.key === "Enter") sendMessage();
        });
        /*************************************************************************
        * Inicialización: añadir mensaje de bienvenida (opcional)
        *************************************************************************/
        (function init() {
            // Mensaje inicial del bot para orientar al aprendiz
            addMessage('Hola — soy el asistente del proyecto de música SYMPHONY. Puedes preguntar por Qué instrumento tocar?, Qué cursos hay?, Valor del curso. o Formas de pago. ');
            })();
    </script>
        
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous"></script>
    </body>
</html>    


