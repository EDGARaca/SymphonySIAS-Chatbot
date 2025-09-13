<%-- 
    Document   : GuardarEstudiante
    Created on : 30/08/2025, 12:22:51 p. m.
    Author     : Spiri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
        <title>Sistema de Informacion Acádemica SIA</title>
    </head>
    <body style="background-color:#C1CDCD;">
        <div class="container">
            <form action="GuardarEstudiante" method="post">
                <div class="card mt-3">
                    <div class="card-body">
                            <div class="d-flex justify-content-start mb-3">
                        <a href="Estudiante.jsp" class="btn btn-block btn-warning">Volver</a> 
                        <hr>
                        
                        </div>
                        <h1><center>Registrar un Estudiante</center></h1>
                        <div class="col">
                            <label>Nombre</label>
                                <input type="text" name="nombre"  class="form-control" placeholder="Digite el nombre estudiante" required>
                        </div>
                        <div class="col">
                                <label>Apellido</label>
                                <input type="text" name="apellido"  class="form-control" placeholder="Digite el apellido del estudiante" required>
                        </div>
                        <div class="col">
                                <label>Telefono</label>
                                <input type="text" name="telefono"  class="form-control" placeholder="Digite el número de Teléfono" required>
                        </div>
                        <div class="col">
                                <label>Direccion</label>
                        <input type="text" name="direccion"  class="form-control" placeholder="Digite dirección" required>
                        </div>
                        <div class="col">
                                <label>Correo</label>
                                <input type="text" name="correo"  class="form-control" placeholder="Digite el Correo Electronico" required>
                        </div>
                        <div class="col">
                                <label>Genero</label>
                                <input type="text" name="genero"  class="form-control" placeholder="Digite el genero" required>
                        </div>
                        <div class="col mt-3">
                                <button type="submit" name="action" value="guardar" class="btn btn-primary">Guardar</button>
                        </div>
                        
                        
                    </div>
                </div>
                
            </form>
            
            
        </div>
    </body>
</html>
    
    
    
    
    
    
    
    
    
    
    
    
    