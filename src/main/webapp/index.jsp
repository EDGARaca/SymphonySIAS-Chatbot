<%-- 
    Document   : index
    Created on : 30/08/2025, 11:45:58 a. m.
    Author     : Spiri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
        <title>Sistema de Informacion Academico SYMPHONY - SIAS</title>
    </head>
    
    <body style="background-color:#CDC5BF;">
        <div class="container">
            <div class="row mt-4">
                <div class="card" style="display: flex; margin:0px auto; margin-top: 6px;">
                    <div class="card-body">
                        <div class="col" style="padding:6px; text-align: center;">
                           <a href="" class="btn btn-outline-info">Usuarios</a>
                           <a href="Estudiante.jsp" class="btn btn-outline-info" target="_blank">Gestion de Estudiantes</a>
                           <a href="" class="btn btn-outline-info">Gestion de Materias</a>
                           <a href="" class="btn btn-outline-info">Gestion de Docentes</a>
                           <a href="" class="btn btn-outline-info">Gestion de Programas</a>
                           <a href="" class="btn btn-outline-info">Gestion de Notas</a>
                           <hr>
                           <h2><center><font color="#E3A869"><b>SISTEMA DE INFORMACION ACADEMICA SYMPHONY - SIAS</b></font></center></h2>
                           <hr>
                           <img src="public/imagen/banda.jpg" width="1100" height="650" class="400">
                        </div>
                    </div>
                </div>
            </div>
        </div>     
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous"></script>
    </body>
</html>    




<%--
         <div class="container">
            <div class="card mt-5">
                <h2 class="text-center mt-3"> Gestión y Registro de Estudiantes SYMPHONY</h2>
                <div class="card-body">
                    <div class="d-grip gap-2 d-md-flex justify-content-md-end mb-3">
                        <a href="GuardarEstudiante.jsp" class="btn btn-primary">Nuevo Estudiante</a>
                    </div>
                    <form action="ServletEstudiante" method="GET">
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
                            </tr>
                        </thead>
                        <tbody>
   <%
        List<Estudiante> estudiantes = (List<Estudiante>) request.getAttribute("listadestudiantes");
        if (estudiantes != null) {
            for(Estudiante estudiante : estudiantes) {
   %>
   <tr>
       <td><%= estudiante.getId()%></td>
       <td><%= estudiante.getNombreAlumno()%></td>
       <td><%= estudiante.getApellidoAlumno()%></td>
       <td><%= estudiante.getTelefono()%></td>
       <td><%= estudiante.getDireccion()%></td>
       <td><%= estudiante.getCorreo()%></td>
       <td><%= estudiante.getGenero()%></td>
       <td class="text-center">
           <a href="ServletEstudiante?action=modificar&id=<%= estudiante.getId()%>" class="btn btn-warning btn-sm">Editar</a>
           <a href="" class="btn btn-danger btn-sm">Eliminar</a>
       </td>
   </tr>
   <%
            }
        } else {
   %>
   <tr>
       <td colspan="8" class="text-center">No se encontraron estudiantes.</td>
   </tr>
    <%
        }
    %>
    </form>
    </tbody>
    </body>
</html>
--%>