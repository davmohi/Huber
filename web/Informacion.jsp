<!DOCTYPE html>
<html lang="en">
<head>
  <title>Historia</title>
  <meta charset="utf-8">
  <link rel="stylesheet" title="aereolinea" type="text/css" href="css/style.css">
  <link rel="stylesheet" title="aereolinea" type="text/css" href="css/jquery.dataTables.min.css">
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
<jsp:include page="header.jspf"/>
 <jsp:include page="login.jsp"/>
<div class="jumbotron text-center">
  <h1>Aereolineas Sauron</h1> 
  <p>Tu mejor opci�n en viajes</p> 
</div>

<div id="about" class="container-fluid">
  <div class="row">
    <div class="col-sm-8">
      <h2>s</h2><br>
      <h4> s </h4><br>
      <p>q</p>
    </div>
  </div>
</div>

<div class="container-fluid bg-grey">
  <div class="row">
    <div class="col-sm-4">
      <span> <img src="images/avion2.jpg" class="img-responsive"></span>
    </div>
    <div id="valores" class="col-sm-8">
      <h2>Valores</h2><br>
      <h4><strong>MISI�N:</strong>s.</h4><br>
      <p><strong>VISI�N:</strong>s</p>
    </div>
  </div>
</div>



<!-- Container (Portfolio Section) -->
<div id="portfolio" class="container-fluid text-center bg-grey">
  <h2>s</h2><br>
  <div class="row text-center slideanim">
    <div class="col-sm-4">
      <div class="thumbnail">
        <img src="images/cancun.jpg" alt="Cancun" width="400" height="300">
        <p><strong>s</strong></p>
        <p>s</p>
      </div>
    </div>
    <div class="col-sm-4">
      <div class="thumbnail">
        <img src="images/italia.jpg" alt="Italia" width="400" height="300">
        <p><strong>d</strong></p>
        <p>Ed</p>
      </div>
    </div>
    <div class="col-sm-4">
      <div class="thumbnail">
        <img src="images/newyork.jpg" alt="New York" width="400" height="300">
        <p><strong>New York</strong></p>
        <p>Puedes disfrutar de esta bella ciudad.</p>
      </div>
    </div>
  </div><br>
  
  <h2>Feedback de nuestros clientes</h2>
  <div id="myCarousel" class="carousel slide text-center" data-ride="carousel"> <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
        <h4>"Uno de las mejores aereolineas de Latinoamerica"<br><span>David Morales, Co-Presidente, Mordor Industries</span></h4>
      </div>
      <div class="item">
        <h4>Simplemente perfecto!!<br><span>John Herrera, Futbolista, Real Madrid</span></h4>
      </div>
      <div class="item">
        <h4>"No podr�a estar m�s feliz con este compa��a"<br><span>Alonso Morgan, Jugador de Snooker,UK </span></h4>
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>

<div id="contact" class="container-fluid bg-grey">
  <h2 class="text-center">Contacto</h2>
  <div class="row">
    <div class="col-sm-5">
      <p>Contactanos y en menos de 24 horas te contestaremos.</p>
      <p><span class="glyphicon glyphicon-map-marker"></span>y</p>
      <p><span class="glyphicon glyphicon-phone"></span> y</p>
      <p><span class="glyphicon glyphicon-envelope"></span> fghjdjjyjgj</p>
    </div>
    <div class="col-sm-7 slideanim">
      <div class="row">
        <div class="col-sm-6 form-group">
          <input class="form-control" id="nombre" name="nombre" placeholder="Nombre" type="text" required>
        </div>
        <div class="col-sm-6 form-group">
          <input class="form-control" id="email" name="email" placeholder="Email" type="email" required>
        </div>
      </div>
      <textarea class="form-control" id="comentarios" name="comentarios" placeholder="Comentarios" rows="5"></textarea><br>
      <div class="row">
        <div class="col-sm-12 form-group">
          <button class="btn btn-default pull-right" type="submit">Enviar</button>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>