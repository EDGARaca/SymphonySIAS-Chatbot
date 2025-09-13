<%-- 
    Document   : ModificarEstudiante
    Created on : 30/08/2025, 12:23:39 p. m.
    Author     : Spiri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mycomp.symphonysias.model.Estudiante"%>
<%@page import="com.mycomp.symphonysias.model.EstudianteDao"%>
<%
    String idParam = request.getParameter("id");
    Estudiante est = null;

    if (idParam != null && !idParam.isEmpty()) {
        try {
            int id = Integer.parseInt(idParam);
            EstudianteDao dao = new EstudianteDao();
            est = dao.obtenerEstudiantePorId(id);

            if (est == null) {
%>
    <div class="alert alert-danger">No se pudo cargar el estudiante. Verificar el ID.</div>
<%
            }
        } catch (Exception e) {
%>
    <div class="alert alert-danger">ID inválido o error técnico al cargar estudiante.</div>
<%
        }
    } else {
%>
    <div class="alert alert-warning">No se recibió el parámetro ID.</div>
<%
    }
%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Estudiantes Sistema de Información Academica SYMPHONY - SIAS </title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
    </head>
    <body style="background-color:#ADD8E6;">
    <div class="container mt-5">
        <div class="card">
            <h2 class="text-center mt-3">Modificar Datos del Estudiante</h2>
            <div class="card-body">
                <% if (est != null) { %>

                <form action="ActualizarEstudiante" method="post">
                    <input type="hidden" name="id" value="<%= est.getId() %>">
                    <div class="mb-3">
                        <label>Nombre</label>
                        <input type="text" name="nombre" class="form-control" value="<%= est.getNombre() %>" required>
                    </div>
                    <div class="mb-3">
                        <label>Apellido</label>
                        <input type="text" name="apellido" class="form-control" value="<%= est.getApellido() %>" required>
                    </div>
                    <div class="mb-3">
                        <label>Teléfono</label>
                        <input type="text" name="telefono" class="form-control" value="<%= est.getTelefono() %>">
                    </div>
                    <div class="mb-3">
                        <label>Dirección</label>
                        <input type="text" name="direccion" class="form-control" value="<%= est.getDireccion() %>">
                    </div>
                    <div class="mb-3">
                        <label>Correo</label>
                        <input type="email" name="correo" class="form-control" value="<%= est.getCorreo() %>">
                    </div>
                    <div class="mb-3">
                        <label for="genero" class="form-label">Género</label>
                        <select class="form-select" id="genero" name="genero" required>
                            <option value="Masculino" <%= "Masculino".equals(est.getGenero()) ? "selected" : "" %>>Masculino</option>
                            <option value="Femenino" <%= "Femenino".equals(est.getGenero()) ? "selected" : "" %>>Femenino</option>
                            <option value="Otro" <%= "Otro".equals(est.getGenero()) ? "selected" : "" %>>Otro</option>
                        </select>
                    </div>

                    <div class="d-flex justify-content-between">
                        <a href="Estudiante.jsp" class="btn btn-warning">Cancelar</a>
                        <button type="submit" class="btn btn-success">Actualizar</button>
                    </div>
                </form>
            
                <% } else { %>
                    <div class="alert alert-danger">No se pudo cargar el estudiante. Verifica el ID.</div>
                <% } %>
        
            </div>        
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
