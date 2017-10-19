

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Administración</title>
  <meta charset="utf-8">
</head>
<body>
 <%@ include file="header.jspf" %>
 <jsp:include page="login.jsp"/>
<h3>Administración</h3> 
<div class="float-left">
  <div class="col-sm-2">
    <div class="sidebar-nav">
      <div class="navbar navbar-default" role="navigation">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-navbar-collapse">
            <span class="sr-only">Opciones de administración</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <span class="visible-xs navbar-brand">Sidebar menu</span>
        </div>
        <div class="navbar-collapse collapse sidebar-navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active" title="En este apartado puede gestionar todo lo relacionado a los tipos de aviones"> <a href="gestionTipoAviones.jsp"target="frame" ><span class="glyphicon glyphicon-hand-right"></span>p1</a></li>
            <li title="En este apartado puede gestionar todo lo relacionado a los paises"><a href="gestionPais.jsp"target="frame" > <span class="glyphicon glyphicon-hand-right"></span>  o2</a></li>
            <li title="En este apartado puede gestionar todo lo relacionado a los vuelos"><a href="gestionVuelo.jsp"target="frame" > <span class="glyphicon glyphicon-hand-right"></span>  sd</a></li>
            <li title="En este apartado puede gestionar todo lo relacionado a las ciudades"><a href="gestionCiudad.jsp"target="frame" > <span class="glyphicon glyphicon-hand-right"></span>  sd</a></li>
            <li title="En este apartado puede gestionar todo lo relacionado a los horarios"><a href="gestionHorario.jsp"target="frame" > <span class="glyphicon glyphicon-hand-right"></span>  sd</a></li>
            <li title="En este apartado puede gestionar los horarios respectivos."><a href="gestionHorarios.jsp"target="frame" > <span class="glyphicon glyphicon-hand-right"></span>  s</a></li>
            <li title ="En este apartado puede gestionar todo lo relacionado a los aviones."><a href="gestionAviones.jsp"target="frame"><span class="glyphicon glyphicon-hand-right"></span> s</a></li>
           
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>
  </div>
  <div class="col-sm-1">  
   <iframe class="embed-responsive-item" scrolling="no" frameBorder="0" name="frame" src= "gestionTipoAviones.jsp" style=" width: 1000px; height: 800px;  overflow: hidden;"> </iframe>
  </div>
</div>
</body>
</html>
   

      
    
    
   
 
  

<script>
    $('.nav-tabs-dropdown').each(function(i, elm) {
    
    $(elm).text($(elm).next('ul').find('li.active a').text());
    
});
  
$('.nav-tabs-dropdown').on('click', function(e) {

    e.preventDefault();
    
    $(e.target).toggleClass('open').next('ul').slideToggle();
    
});

$('#nav-tabs-wrapper a[data-toggle="tab"]').on('click', function(e) {

    e.preventDefault();
    
    $(e.target).closest('ul').hide().prev('a').removeClass('open').text($(this).text());
      
});
    
    </script>
    </body>
</html>
