<%-- 
    Document   : gestionTipoAviones
    Created on : May 22, 2017, 9:41:09 PM
    Author     : Ivan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html5>
<html lang="en">
<head>
  <title>Gestión de tipos de aviones</title>
  <meta charset="utf-8">
 
  <link rel="stylesheet" title="aereolinea" type="text/css" href="css/jquery.dataTables.min.css">
  <link rel="stylesheet" title="aereolinea" type="text/css" href="css/style.css">
  <script type="text/javascript" src="js/Avion.js"></script>
  <script type="text/javascript" src="js/Oferta.js"></script>
  <script type="text/javascript" src="js/Storage.js"></script>
  <script type="text/javascript" src="js/Usuario.js"></script>
  <script type="text/javascript" src="js/Vuelo.js"></script>
  <script type="text/javascript" src="js/Proxy.js"></script>
  <script type="text/javascript" src="js/JsonUtils.js"></script>
  <script type="text/javascript" src="js/TipoAvion.js"></script>
  <script type="text/javascript" src="js/Pais.js"></script>
  <script type="text/javascript" src="js/Ciudad.js"></script>
  <script type="text/javascript" src="js/Pais.js"></script>
  <script type="text/javascript" src="js/Horario.js"></script>
  <script type="text/javascript" src="js/TrueVuelo.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js"></script>
  <script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
	<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />
	<!-- lo anterior es para incluir los estilos y funcionalidades de bootstrap -->
</head>

<body>
<h3>Gestión de tipos de aviones</h3>

<form class="form-horizontal" role="form" onreset="borrar();" onsubmit=" crear();">
        <div class="col-xs-3">   
          <label for="ID">Identificador:</label> <input type="text" id="id" class="form-control"  required>
         </div>
           <div class="col-xs-3">   
                <label for="año">Año</label>
                <input type="number" id="año" class="form-control"  required>
        </div>

         <div class="col-xs-3">   
                <label for="modelo">Modelo</label>
                <input type="text" id="modelo" class="form-control"  required>
        </div>
    
            <div class="col-xs-3">   
           <label for="marca">Marca</label>
           <input type="text" id="marca" class="form-control"  required>
         </div>
    <div class="col-xs-3">   
   <label for="cantPasj">Cantidad de pasajeros</label>
   <input type="number" id="pasajeros" class="form-control"  required> 
     </div>  
 
    <div class="col-xs-3">   
        <label for="cantF">Cantidad de filas</label>
        <input type="number" id="filas" class="form-control"  required> 
   </div> 
  
         <div class="col-xs-2">  
           <br>
           <button type="reset" class="btn btn-default">Eliminar</button>
         </div>  
         <div class="col-xs-2">  
           <br>
           <button type="butom" onclick="editar();" class="btn btn-default">Editar</button>
         </div>  
    <div class="col-xs-2"> 
           <br>
           <button type="submit" class="btn btn-default">Guardar</button>
        </div>
</form>
<br><br><br><br>
<div class="col-sm-12">
  <div class="container-fluid">
    <table class="table table-hover table-responsive" id=tabla>
  <thead class="thead-inverse">
    <tr>
      <th>Id</th>
      <th>Año</th>
      <th>Modelo</th>
      <th>Marca</th>
      <th>Pasajeros</th>
      <th>Filas</th>
    </tr>
  </thead>
  <tbody id=listado>
  </tbody>
</table>
</div>
</div>
<script>
id = document.getElementById("id");  
año = document.getElementById("año"); 
modelo = document.getElementById("modelo");  
marca= document.getElementById("marca"); 
pasajeros = document.getElementById("pasajeros");  
filas = document.getElementById("filas");  


//cuando carga
$( document ).ready(function() {
    var table=$('#tabla').DataTable({
        "searching":false
    });//tiene que estar antes de listar los vuelos
    $('#tabla tbody').on('click', 'tr', function () {
        cargar( table.row( this ).data()[0] );
    } );
    actualizarTabla();
});

function cargar(iden){
    Proxy.tipoAvionConsultar(iden,
        function(tipo){
            id.value=tipo.id;
            año.value=tipo.año;
            modelo.value=tipo.modelo;
            marca.value=tipo.marca;
            pasajeros.value=tipo.pasajeros;
            filas.value=tipo.filas;
        });
}
function editar(){
    Proxy.EditarTipoAvion(id.value,año.value,modelo.value,marca.value,pasajeros.value,filas.value,function(mensaje){
        if(mensaje.length<11&&mensaje.length>0){//si es largo es de error
            actualizarTabla();
        }
    });
}
function crear(){
     Proxy.AgregarTipoAvion(id.value,año.value,modelo.value,marca.value,pasajeros.value,filas.value,function(mensaje){
        if(mensaje.length<11&&mensaje.length>0){//si es largo es de error
            actualizarTabla();
        }
    });
}
function borrar(){
    
    Proxy.tipoAvionEliminar(id.value,
        function(resp){
            actualizarTabla();
        });
}
function actualizarTabla(){
    var tipos=[];
    Proxy.tipoAvionConsultarTodos(function(resul){
            tipos=resul;
            var lineas=[];
            for(var i in tipos)
                lineas.push([tipos[i].id,tipos[i].año,tipos[i].modelo,tipos[i].marca,tipos[i].pasajeros,tipos[i].filas]);
            $('#tabla').dataTable().api().clear().rows.add(lineas).draw();
    });
}
</script>
</body>
</html>

