<%-- 
    Document   : Estudiante
    Created on : 30/08/2025, 1:57:57 p. m.
    Author     : Spiri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.mycomp.symphonysias.model.Estudiante"%>
<%@page import="com.mycomp.symphonysias.model.EstudianteDao"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistema de Información Academica SYMPHONY - SIAS</title>
          <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
    </head>
    <body style="background-color:#ADD8E6;">
        <div class="container">
            <div class="card mt-5">
                <h2 class="text-center mt-3"> Gestion y Registro de Estudiantes SYMPHONY</h2>
                <div class="card-body">
                    <div class="d-flex justify-content-center mb-3">
                        <a href="GuardarEstudiante.jsp" class="btn btn-primary">Nuevo Estudiante</a>
                    </div>
                    <div class="d-flex justify-content-start mb-4">
                        <a href="index.jsp" class="btn btn-warning">Volver</a>
                    </div>
                    
                    <%
                        EstudianteDao dao = new EstudianteDao();
                        List<Estudiante> lista = dao.ListarEstudiantes();
                    %>
                    
                    <%
                        String actualizado = request.getParameter("actualizado");
                        String errorActualizar = request.getParameter("errorActualizar");

                    if ("true".equals(actualizado)) {
                    %>
                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                            Estudiante actualizado correctamente.
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    <%
                        } else if ("true".equals(errorActualizar)) {
                    %>
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            Error al actualizar estudiante.
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    <%
                        }
                    %>

              
                                      
                    <table class="table table-bordered table-striped mt-4"> 
                        <thead>
                            <tr class="text-center">
                                <th>Id</th>
                                <th>Nombre</th>
                                <th>Apellido</th>
                                <th>Telefono</th>
                                <th>Direccion</th>
                                <th>Correo</th>
                                <th>Genero</th>
                                <th>Acciones</th>
                                <!-- Acciones es donde vamos a tener editar, eliminar -->
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (Estudiante est : lista) {
                            %>
                            <tr>
                                <td><%= est.getId() %></td>
                                <td><%= est.getNombre() %></td>
                                <td><%= est.getApellido() %></td>
                                <td><%= est.getTelefono() %></td>
                                <td><%= est.getDireccion() %></td>
                                <td><%= est.getCorreo() %></td>
                                <td><%= est.getGenero() %></td>
                                <td>
                                    <a href="ModificarEstudiante.jsp?id=<%= est.getId() %>" class="btn btn-sm btn-primary">Editar</a>

                                    <form action="EliminarEstudiante" method="post" style="display:inline;">
                                        <input type="hidden" name="id" value="<%= est.getId() %>">
                                        <button type="submit" class="btn btn-sm btn-danger" onclick="return confirm('¿Estás seguro de eliminar este estudiante?');">Eliminar</button>
                                    </form>
                                </td>

                            </tr>
                            <%
                                }
                            %>                        
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous"></script>    
    </body>
</html>
