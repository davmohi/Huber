<%-- 
    Document   : gestionTipoAviones
    Created on : May 22, 2017, 9:41:09 PM
    Author     : Ivan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html5>
<html lang="en">
<head>
  <title>Gestión de Paises</title>
  <meta charset="utf-8">
 
  <link rel="stylesheet" title="aereolinea" type="text/css" href="css/jquery.dataTables.min.css">
  <link rel="stylesheet" title="aereolinea" type="text/css" href="css/style.css">
  <script type="text/javascript" src="js/Avion.js"></script>
  <script type="text/javascript" src="js/Oferta.js"></script>
  <script type="text/javascript" src="js/Storage.js"></script>
  <script type="text/javascript" src="js/Usuario.js"></script>
  <script type="text/javascript" src="js/Vuelo.js"></script>
  <script type="text/javascript" src="js/Proxy.js"></script>
  <script type="text/javascript" src="js/Pais.js"></script>
  <script type="text/javascript" src="js/Ciudad.js"></script>
  <script type="text/javascript" src="js/Pais.js"></script>
  <script type="text/javascript" src="js/Horario.js"></script>
  <script type="text/javascript" src="js/TrueVuelo.js"></script>
  <script type="text/javascript" src="js/JsonUtils.js"></script>
  <script type="text/javascript" src="js/TipoAvion.js"></script>
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
<h3>Gestión de Paises</h3>

<form class="form-horizontal" role="form" onreset="borrar();" onsubmit=" crear();">
        <div class="col-xs-3">   
          <label for="ID">Identificador:</label> <input type="number" id="id" class="form-control"  required>
         </div>
           <div class="col-xs-3">   
                <label for="año">Nombre</label>
                <input type="text" id="nombre" class="form-control"  required>
        </div>

  
         <div class="col-xs-2">  
           <br>
           <button type="reset" class="btn btn-default">Eliminar</button>
         </div>   
    <div class="col-xs-2"> 
           <br>
           <button type="submit" class="btn btn-default">Agregar</button>
        </div>
</form>
<br><br><br><br>
<div class="col-sm-12">
  <div class="container-fluid">
    <table class="table table-hover table-responsive" id=tabla>
  <thead class="thead-inverse">
    <tr>
      <th>Id</th>
      <th>Nombre</th>
    </tr>
  </thead>
  <tbody id=listado>
  </tbody>
</table>
</div>
</div>
<script>
id = document.getElementById("id");  
nombre = document.getElementById("nombre"); 


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
    Proxy.paisConsultar(iden,
        function(tipo){
            id.value=tipo.id;
            nombre.value=tipo.pais;
        });
}
function crear(){
     Proxy.agregarPais(id.value,nombre.value,function(mensaje){
        if(mensaje.length<11&&mensaje.length>0){//si es largo es de error
            actualizarTabla();
        }
    });
}
function borrar(){
    
    Proxy.paisEliminar(id.value,
        function(resp){
            actualizarTabla();
        });
}
function actualizarTabla(){
    var tipos=[];
    Proxy.paisConsultarTodos(function(resul){
            tipos=resul;
            var lineas=[];
            for(var i in tipos)
                lineas.push([tipos[i].id,tipos[i].pais]);
            $('#tabla').dataTable().api().clear().rows.add(lineas).draw();
    });
}
</script>
</body>
</html>

