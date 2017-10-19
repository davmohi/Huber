<%-- 
    Document   : login
    Created on : May 25, 2017, 6:44:41 PM
    Author     : Ivan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
    </head>
    
    <body>

<!-- line modal -->
<div class="modal fade" id="squarespaceModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
  <div class="modal-dialog">
	<div class="modal-content">
            <form id="signInForm" class="form-horizontal"
                    data-fv-framework="bootstrap"
                    data-fv-icon-valid="glyphicon glyphicon-ok"
                    data-fv-icon-invalid="glyphicon glyphicon-remove"
                    data-fv-icon-validating="glyphicon glyphicon-refresh"
                    onsubmit="return ingresar();" action="index.jsp">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
			<h3 class="modal-title" id="lineModalLabel">Login</h3>
		</div>
		<div class="modal-body">	
            <!-- content goes here -->

                    <div class="form-group">
                        <label id="cedl" class="col-xs-3 control-label">Cedula</label>
                        <div class="col-xs-5">
                            <input type="text" class="form-control" name="username" id="cedula"
                                required
                                data-fv-notempty-message="The username is required" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label id="conl" class="col-xs-3 control-label">Contraseña</label>
                        <div class="col-xs-5">
                            <input type="password" class="form-control" name="password" id="contraseña"
                                required
                                data-fv-notempty-message="The password is required" />
                        </div>
                    </div>
		</div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-default">Ingresar</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
              </div>
	</div>
      </form>
  </div>
</div>
<script>
function ingresar(){
    usuario = new Usuario(document.getElementById("cedula").value,document.getElementById("contraseña").value,"","","","","","","","");
        Proxy.userLogin(usuario,
                function(usuario){
                    switch(usuario.rol){
                        case 0: // usuario no existe
                            alert("Usuario no existe");
                            break;
                        case 2: // usuario
                            sessionStorage.cedula= usuario.cedula; 
                            sessionStorage.modo="usuario";
                            sessionStorage.nombre= usuario.nombre;
                            window.location.href = 'index.jsp';
                            break;
                        case 1: // manager
                            sessionStorage.cedula= usuario.cedula; 
                            sessionStorage.modo="administrador";
                            sessionStorage.nombre= usuario.nombre;
                            window.location.href = 'index.jsp';
                            break;
                        default:
                            alert("algo ha salido mal");
                            break;
                    }
                });
                document.getElementById("cedl").style.color = 'red';
                document.getElementById("conl").style.color = 'red';
                return false;
}
</script>
</body>
</html>
