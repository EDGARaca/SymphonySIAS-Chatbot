<%-- 
    Document   : MostrarEstudiante
    Created on : 12/09/2025, 5:45:58?p. m.
    Author     : Spiri
--%>
<%@page import="com.mycomp.symphonysias.model.Estudiante"%>
<%@page import="com.mycomp.symphonysias.model.EstudianteDao"%>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    EstudianteDao dao = new EstudianteDao();
    Estudiante est = dao.obtenerEstudiantePorId(id);
%>

<div class="container mt-4">
    <h2>Modificar Estudiante</h2>
    <form action="ActualizarEstudiante" method="post">
        <input type="hidden" name="id" value="<%= est.getId() %>">
        <div class="mb-2">
            <label>Nombre</label>
            <input type="text" name="nombre" class="form-control" value="<%= est.getNombre() %>" required>
        </div>
        <div class="mb-2">
            <label>Apellido</label>
            <input type="text" name="apellido" class="form-control" value="<%= est.getApellido() %>" required>
        </div>
        <div class="mb-2">
            <label>Teléfono</label>
            <input type="text" name="telefono" class="form-control" value="<%= est.getTelefono() %>">
        </div>
        <div class="mb-2">
            <label>Dirección</label>
            <input type="text" name="direccion" class="form-control" value="<%= est.getDireccion() %>">
        </div>
        <div class="mb-2">
            <label>Correo</label>
            <input type="text" name="correo" class="form-control" value="<%= est.getCorreo() %>">
        </div>
        <div class="mb-2">
            <label>Género</label>
            <input type="text" name="genero" class="form-control" value="<%= est.getGenero() %>">
        </div>
        <button type="submit" class="btn btn-success">Actualizar</button>
    </form>
</div>
