<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="sp">
<head>
  <title>Sección Pública</title>
</head>

<body onload="pageLoad2();">
 <jsp:include page="header.jspf"/>.
 <jsp:include page="login.jsp"/>
 <div class="container-fluid">

     <div id="Carrusel" class="carousel slide" align="center" data-ride-="carousel">


         <!--indicadores de pos (bolitas)-->

         <ol class="carousel-indicators">
             <li data-target="#Carrusel" data-slide-to="0" class="active"></li>
             <li data-target="#Carrusel" data-slide-to="1"></li>
             <li data-target="#Carrusel" data-slide-to="2"></li>
             <li data-target="#Carrusel" data-slide-to="3"></li>
         </ol>
         <!--Sliders -->
         <div class="carousel-inner" role="listbox">
             <div class="item active">
                 <img src="images/foto1.jpg" class="imagen"/>
                 <div class="carousel-caption">
                     <h4 >Autos ultimo modelo</h4>
                 </div>
             </div>
             <div class="item">
                 <img src="images/foto2.jpg" class="imagen"/>
                 <div class="carousel-caption">
                     <h4>Excelente atencion al cliente</h4>
                 </div>
             </div>
             <div class="item">
                 <img src="images/foto3.jpg" class="imagen"/>
                 <div class="carousel-caption">
                     <h4>Disponibilidad 24/7</h4>
                 </div>
             </div>
             <div class="item">
                 <img src="images/foto4.jpg" class="imagen"/>
                 <div class="carousel-caption">
                     <h4>Tarifas economicas</h4>
                 </div>
             </div>
         </div>
         <!--Controles de next y prev -->
         <a class="left carousel-control" href="#Carrusel" role="button" data-slide="prev" >
             <span class="glyphicon glyphicon-chevron-left"></span>
         </a>
         <a class="right carousel-control" href="#Carrusel" role="button" data-slide="next" >
             <span class="glyphicon glyphicon-chevron-right"></span>
         </a>
     </div>
 </div>
 <br>

 <div class="container-fluid">
     <div class="row">
         
         <div class="col-sm-4">
             <div class="well"><h2>Descuentos</h2></div>
             <p>Descuentos en esta mes de Setiembre, desde un 40</p>
             <p>hasta un 50% por viajes de mas de 5000 colones.</p>
         </div>
          <div class="col-sm-4">
              <div class="well"><h2>Recomendaciones</h2></div>
              <p>Descubra nuestras excelentes recomendaciones  </p>
              <p>de cada semana en nuestra seccion de eventos.</p>
          </div>
           <div class="col-sm-4">
               <div class="well"><h2>Consejos</h2></div>
               <p>Recuerden tener su automovil en RTV al dia, </p>
               <p>de lo contrario sufriran inconvenientes a lo largo del año.</p>
           </div>
     </div>
 </div>


<script> //script del carrusel
                var acc = document.getElementsByClassName("acordion");
                var i;

                for (i = 0; i < acc.length; i++) {
                    acc[i].onclick = function () {
                        this.classList.toggle("active");
                        var panel = this.nextElementSibling;
                        if (panel.style.display === "block") {
                            panel.style.display = "none";
                        } else {
                            panel.style.display = "block";
                        }
                    };
                }

        </script>


<script>//vista
var model;
var controller;
var ida,vuelta;
function pageLoad2(){
    Proxy.TipoCambio(function(result){
            sessionStorage.tipoCambio=result; 
        }); 
    model=new AirlineModel();
    controller=new AirlineController(model,window);
    controller.ofertasListAll();
    controller.ciudadListAll();
    var table=$('#tabla').DataTable({
        "searching":false ,
        "columnDefs": 
        [
            {
                "targets": [ 0 ],
                "visible": false
            }
        ]
    });//tiene que estar antes de listar los vuelos
     $('#tabla tbody').on('click', 'tr', function () {
        $(this).toggleClass('selected');
        //alert( table.row( this ).data()[0] );
    } );
    $('#reservar').click( function () {
        var elejidos=table.rows('.selected').data();
        var horarios=[];
        for( i=0;i<elejidos.length;i++){
            alert( elejidos[i][0]);
            horarios.push(elejidos[i][0]);
        }
    } );
    controller.vuelosListAll();
    document.getElementById("idaVuelta").checked=false;// solo ida al principio
    
    $("#idaVuelta").change(function() {//para saber si se quiere que sea ida y vielta o no
        if(this.checked) {
          $('input[name="daterange"]').daterangepicker(
            {
                singleDatePicker: false,
                "minDate": moment()
            },
            function(start, end, label) {
                    ida=start.format('MM/DD/YYYY');
                    vuelta=end.format('MM/DD/YYYY');
            }
            );
        }
        else{
            $('input[name="daterange"]').daterangepicker(
            {
                singleDatePicker: true,
                "minDate": moment()
            },
            function(start, end, label) {
                    ida=start.format('MM/DD/YYYY');
                    vuelta=end.format('MM/DD/YYYY');
            }
            );
        }
    });
    $(function() {
        $('input[name="daterange"]').daterangepicker(
            {
                singleDatePicker: true,
                "minDate": moment()
            },
            function(start, end, label) {
                ida=start.format('MM/DD/YYYY');
                vuelta=end.format('MM/DD/YYYY');
            }
            );
    });
    $('#fecha').change(function() {
       controller.filtrarVuelos();
    });

    $('#tsalida').change(function() {
       controller.filtrarVuelos();
    });

    $('#tdestino').change(function() {
       controller.filtrarVuelos();
    });
    $('#tCantidad').change(function() {
       controller.filtrarVuelos();
    });
}
 function cambio() {
            var change = document.getElementById("cambio");
            if (change.innerHTML === "Dolares"){
              change.innerHTML = "Colones";
            } 
            else {
              change.innerHTML = "Dolares";
            }
            controller.filtrarVuelos();
          }
function mostrarOfertas(){
    var ofertas=model.ofertas;
    $("#ofertas").text("");
    for(var i in ofertas)
        $(
            '<div class="item">'+
                    '<div class="col-md-3 col-sm-6 col-xs-12">'+
                            '<a href="#"><img src="images/'+/*ofertas[i].destino*/"italia"+'.jpg" class="img-responsive">'+
                            '<div class="carousel-caption"><h1>'+ofertas[i].titulo+'</h1><p>'+ofertas[i].descripcion+'</p></div></a>'+
                    '</div>'+
            '</div>'
        ).appendTo('#ofertas');
    $('.item').first().addClass('active');
    $('.carousel[data-type="multi"] .item').each(function(){
        var next = $(this).next();
        if (!next.length) {
          next = $(this).siblings(':first');
        }
        next.children(':first-child').clone().appendTo($(this));
        for (var i=0;i<2;i++) {
          next=next.next();
          if (!next.length) {
              next = $(this).siblings(':first');
              }
          next.children(':first-child').clone().appendTo($(this));
        }
    });
    $('#myCarousel').carousel();
}
function cargarCiudades(){
    var ciudades=model.ciudades;
    var i=0;
    for(i in ciudades){
        $("#tsalida").append('<option value="'+i+'" selected="">'+ciudades[i].nombre+'</option>');
        $("#tdestino").append('<option value="'+i+'" selected="">'+ciudades[i].nombre+'</option>');
    }
    $("#tsalida").append('<option value="'+i+1+'" selected="">'+''+'</option>');
    $("#tdestino").append('<option value="'+i+1+'" selected="">'+''+'</option>');
    $("#tsalida").selectpicker("refresh");
    $("#tdestino").selectpicker("refresh");
}
function actualizarTabla(){
    $('#tabla').dataTable().api().clear().rows.add(model.buscados).draw();
}
</script>

<script>//modelo
function AirlineModel(){
    this.AirlineModel();
}
AirlineModel.prototype={
    AirlineModel: function(){
        this.ciudades;
        this.vuelos;
        this.buscados;
        this.ofertas;
    }
}
</script>

<script>//controlador
function AirlineController(model,view){
    this.AirlineController(model,view);
}
AirlineController.prototype={
    AirlineController:function(model,view){
        this.model=model;
        this.view=view;
    },
    ciudadListAll: function (){
        var model = this.model;
        var view = this.view;
        
        Proxy.CiudadListAll(function(result){
            model.ciudades=result;
            view.cargarCiudades(); }
          );            
    },
    ofertasListAll: function (){
        var model = this.model;
        var view = this.view;
        
        Proxy.HorarioListOfertas(function(result){
            model.ofertas=result;
            view.mostrarOfertas(); }
          );            
    },
    vuelosListAll: function(){
        var model = this.model;
        var view = this.view;
        Proxy.HorarioListAll(function(resul){
            model.vuelos=resul;
            view.controller.filtrarVuelos();
        });
    },
    filtrarVuelos:function (){
        model.buscados=[];
        var salida=this.view.$("#tsalida option:selected").text().toUpperCase();
        var destino=this.view.$("#tdestino option:selected").text().toUpperCase();  
        var cantidad=parseInt(this.view.$("#tCantidad option:selected").text());
        var idavuelta=false;
        if (this.view.$('#idaVuelta').is(':checked')) 
            idavuelta=true;
        var vuelos=model.vuelos;
        for(var i in vuelos)
            if(Date.parse(vuelos[i].fechaDeIda)>=Date.parse(moment().format('MM/DD/YYYY')))//si el vuelo sale de hoy en adelante
                if( salida=='' |vuelos[i].origen.nombre.toUpperCase().indexOf(salida)>-1   &&
                    destino==''|vuelos[i].destino.nombre.toUpperCase().indexOf(destino)>-1 &&//si un vuelo de ida coincide
                    ida==null   |vuelos[i].fechaDeIda.toUpperCase().indexOf(ida)>-1        &&
                    cantidad<=parseInt(vuelos[i].cant)
                                                                                    || 
                    idavuelta==true                                                 &&
                    salida=='' |vuelos[i].destino.nombre.toUpperCase().indexOf(salida)>-1  &&//si un vuelo de vuelta coincide
                    destino==''|vuelos[i].origen.nombre.toUpperCase().indexOf(destino)>-1  &&
                    vuelta==null|vuelos[i].fechaDeIda.toUpperCase().indexOf(vuelta)>-1     &&
                    cantidad<=parseInt(vuelos[i].cant)
                    ){   //lo de arriba es un if
                    var precio=vuelos[i].precio;
                    var cambio=this.view.$("#cambio").text();
                    if(cambio==="Colones")
                        precio= (parseFloat(precio)*parseFloat(sessionStorage.tipoCambio)).toFixed(2);
                    model.buscados.push([vuelos[i].id,vuelos[i].origen.nombre,vuelos[i].destino.nombre,vuelos[i].fechaDeIda,vuelos[i].cant,precio]);
                    }
            this.view.actualizarTabla();
    }
};
</script>
<footer class="container-fluid">
    <p>.</p>
</footer>
</body>
</html>

