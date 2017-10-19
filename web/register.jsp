<%-- 
    Document   : register
    Created on : May 25, 2017, 7:10:25 PM
    Author     : Ivan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Registro</title>
        
        
    </head>
    
    <body >
        <jsp:include page="header.jspf"/>.
        <jsp:include page="login.jsp"/>
        <script src="js/locationpicker.jquery.js"></script>
<div class="container">
        <div class="row">

            <div class="col-md-8 col-md-offset-2">
                <form role="form" method="POST" onsubmit="return registrar();" action="index.jsp">

                    <legend class="text-center">Registro</legend>

                    <fieldset>
                        <legend>Detalles Personales</legend>
                        
                        <div class="form-group col-md-6">
                            <label for="cedula">Cedula</label>
                            <input type="text" class="form-control" name="cedula" id="cedular" placeholder="cedula" required
                                data-fv-notempty-message="Campo requerido">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="password">Contraseña</label>
                            <input type="password" class="form-control" name="psw" id="contraseñar" placeholder="contraseña" required
                                data-fv-notempty-message="Campo requerido">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="name">Nombre</label>
                            <input type="text" class="form-control" name="uname" id="nombre" placeholder="nombre" required
                                data-fv-notempty-message="Campo requerido">
                        </div>
                        
                        <div class="form-group col-md-6">
                            <label for="lastName">Apellidos</label>
                            <input type="text" class="form-control" name="lastName" id="apellidos" placeholder="apellidos" required
                                data-fv-notempty-message="Campo requerido">
                        </div>
                        
                        <div class="form-group col-md-6">
                            <label for="telefono">Telefono</label>
                            <input type="tel" class="form-control" name="telefono" id="telefono" placeholder="telefono de trabajo" required
                                data-fv-notempty-message="Campo requerido">
                        </div>
                        
                        <div class="form-group col-md-6">
                            <label for="celular">Celular</label>
                            <input type="tel" class="form-control" name="celular" id="celular" placeholder="celular" required
                                data-fv-notempty-message="Campo requerido">
                        </div>

                        <div class="form-group col-md-6">
                            <label for="">Email</label>
                            <input type="email" class="form-control" name="" id="email" placeholder="Email" required
                                data-fv-notempty-message="Campo requerido">
                        </div>

                        <div class="form-group col-md-6">
                            <label for="#date">Fecha de nacimiento</label>
                            <input type="date" class="form-control" name="nacimiento" id="nacimiento" placeholder="yyyy-MM-dd" required
                                data-fv-notempty-message="Campo requerido">
                        </div>

                      

                    </fieldset>

                    <fieldset>
                        <legend>Dirección</legend>
                        
                    <input type="text" class="form-control" id="direccion"/>
                    <div id="us2" style="height: 400px;" class="col-md-12"></div>
                    <div class="row">
                        <div class="form-group col-md-6">
                            Lat.: <input type="text" class="form-control" id="lat" />
                        </div>
                        <div class="form-group col-md-6">
                            Long.: <input type="text" class="form-control" id="lon"/>
                        </div>
                    </div>
           
                    </fieldset>

                    <div class="form-group">
                        <div class="col-md-12">
                            <button type="submit" class="btn btn-primary">
                                Registrarse
                            </button>
                            
                        </div>
                    </div>
                </form>
            </div>

        </div>
    </div>
    <script>
        function registrar(){
        nombre = document.getElementById("nombre").value; 
        cedula = document.getElementById("cedular").value; 
        contraseña = document.getElementById("contraseñar").value; 
        apellidos = document.getElementById("apellidos").value; 
        email = document.getElementById("email").value; 
        nacimiento = document.getElementById("nacimiento").value; 
        lat = document.getElementById("lat").value; 
        lon = document.getElementById("lon").value; 
        telefono = document.getElementById("telefono").value; 
        celular = document.getElementById("celular").value; 
        Proxy.AgregarUsuario(cedula,nombre,contraseña,apellidos,email,nacimiento,lat,lon,telefono,celular,2,function(mensaje){
            window.alert(mensaje);
            if(mensaje.length<11&&mensaje.length>0){//si es largo es de error
                sessionStorage.cedula= cedula; 
                sessionStorage.modo="usuario";
                sessionStorage.nombre= nombre;
                window.location.href = 'index.jsp';
                return true;
            }
            else
                return false;
        });
        return false;
    }
    </script>
    </body>
<script> 
    $('#us2').locationpicker({
        location: {
            latitude: 9.9280694,
            longitude: -84.09072459999999
        },
        radius: 0,
        inputBinding: {
            latitudeInput: $('#lat'),
            longitudeInput: $('#lon'),
            radiusInput: $('#us2-radius'),
            locationNameInput: $('#direccion')
        },
        enableAutocomplete: true,
        autocompleteOptions: {
        types: ['(cities)']
    }
    });
    //Para mas información:    http://logicify.github.io/jquery-locationpicker-plugin/     
</script>
</html>
