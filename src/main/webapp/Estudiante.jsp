<%-- 
    Document   : Estudiante
    Created on : 30/08/2025, 1:57:57 p. m.
    Author     : Spiri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistema de Información Academica SYMPHONY - SIAS</title>
          <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
    </head>
    <body style="background-color:#ADD8E6;">
        <!--Aplicando boostrap creamos un contenedor -->
        <div class="container">
            <!-- mediante boostrap vamos a trabajar usando las cards que normalmente se usan para mostrar informacion -->
            <div class="card mt-5">
                <!-- vamos a usar mt-5 para darle un margin-top 5 osea un espacio en la vertical para nuestro elemento -->
                
                <h2 class="text-center mt-3"> Gestion y Registro de Estudiantes SYMPHONY</h2>
                <!-- Cuerpo de la tarjeta-->
                <div class="card-body">
                    <div class="d-flex justify-content-center mb-3">
                        <a href="GuardarEstudiante.jsp" class="btn btn-primary">Nuevo Estudiante</a>
                    </div>
                    <div class="d-flex justify-content-start mb-4">
                        <a href="index.jsp" class="btn btn-warning">Volver</a>
                    </div>
                <!-- Creamos un card-body o el cuerpo de la tarjeta donde vamos a crear nuestra tabla con los datos que vamos a mostrar -->
                <!-- Antes de crear nuestra table vamos a crear nuestro formulario a travez del form -->
                <form action="ServletEstudiante" method="get">
                    <table class="table table-bordered table-striped mt-4">
                        <!-- Aqui estamos trabajando con la tabla y estamos dando estilo mediante boostrap a nuestra tabla al igual que espaciado a traves de margin --> 
                        <thead>
                            <tr class="text-center">
                                <th>Id</th>
                                <th>Nombre</th>
                                <th>Apellido</th>
                                <th>Telefono</th>
                                <th>Direccion</th>
                                <th>Genero</th>
                                <th>Acciones</th>
                                <!-- Acciones es donde vamos a tener editar, eliminar -->
                            </tr>
                        </thead>
                        <!-- Creamos el tbody -->
                        <tbody>
                            <tr>
                                <td></td>
                            </tr>    
                        </tbody>
                    </table>
                </form>

                </div>
                
            </div>    
        </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous"></script>    
    </body>
</html>

<%--
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
--%>