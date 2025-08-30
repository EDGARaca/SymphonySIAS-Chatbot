<%-- 
    Document   : index
    Created on : 30/08/2025, 11:45:58 a. m.
    Author     : Spiri
--%>

<%@page import="java.util.List"%>
<%@page import="com.mycomp.symphonysias.Estudiante"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
        <title>Sistema de Informacion Academico - SIA</title>
    </head>
    
    <body>
         <div class="container">
            <div class="card mt-5">
                <h2 class="text-center mt-3"> Gestión y Registro de Estudiantes Universitarios</h2>
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
