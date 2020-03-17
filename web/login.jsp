<%-- 
    Document   : login
    Created on : 06/02/2020, 19:27:36
    Author     : Caro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
   HttpSession sesion = request.getSession(true);
    Object u = sesion.getAttribute("nombre_usuario") == null ? null : sesion.getAttribute("nombre_usuario");
    if(u != null){
        response.sendRedirect("home.jsp");
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Login</title>
        
        <link href="plugins/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/ionicons.min.css" rel="stylesheet" type="text/css"/>
        <link href="plugins/icheck-bootstrap/icheck-bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/adminlte.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/main.css" rel="stylesheet" type="text/css"/>
        
        <link href="fuentes/Merienda/merienda.css" rel="stylesheet" type="text/css"/>
        <link href="fuentes/Sriracha/sriracha.css" rel="stylesheet" type="text/css"/>
        
        <script src="plugins/jquery/jquery-3.1.1.min.js" type="text/javascript"></script>
        <script src="plugins/bootstrap/js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <script src="js/adminlte.min.js" type="text/javascript"></script>
        <script src="plugins/jquery-validation/jquery.validate.min.js" type="text/javascript"></script>
        <script src="plugins/jquery-validation/additional-methods.min.js" type="text/javascript"></script>
        <script src="js/main.js" type="text/javascript"></script>
    </head>
    <body class="hold-transition register-page body-reg-log">
        <div class="container" id="mensaje_login_usuario" style="position: fixed;">
            <div id="mensaje_login_usuari_interno" class="container col-md-6 elevation-3">
                <br>
                <button type="button" class="btn btn-primary boton" Style="margin-left: 90%;" onclick="$('#mensaje_login_usuario').css('display','none')">&times;</button>
                <br>
                <h3 class="text-center titulo"><strong>Login de Usuario</strong></h3>
                <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-8">
                        <p id="mje_log_usu"></p>
                        <button id="aceptar_log" class="btn btn-primary btn-block boton">Aceptar</button>
                        <br>
                    </div>
                </div>
            </div>
        </div>
        <div class="register-box">
            <div class="register-logo">
                <img src="imagenes/iconoprincipal3.png" alt="AdminLTE Logo" class="img-circle elevation-3" style=" height: 60px; padding: 5px;">
                <span style="font-size: 30px; padding-top: 50%;"><b><span style="font-family: 'Sriracha', cursive;">Turismo</span></b><span style="font-family: 'Merienda', cursive;">SA</span></span>
            </div>
            <div id="tarjeta_login" class="card">
                <div class="card-body register-card-body">
                    <p class="login-box-msg"><b>LOGIN</b></p>
                    <form id="frm-login-usuario" action="autenticar-usuario" method="POST">
                        <div class="input-group mb-3">
                            <div class="input-group-append">
                              <div class="input-group-text" id="log-icon-usuario">
                                <span class="fas fa-user"></span>
                              </div>
                            </div>
                            <input name="nombre_usuario" id="log-nombre-usuario" type="text" class="form-control input-reg-log" placeholder="Nombre de usuario" maxlength="10" minlength="4" required/><br>
                        </div>
                        <div class="input-group mb-3">
                            <div class="input-group-append">
                              <div class="input-group-text" id="reg-icon-clave" >
                                <span class="fas fa-lock"></span>
                              </div>
                            </div>
                            <input name="clave" id="log-clave" type="password" class="form-control input-reg-log" placeholder="Clave" maxlength="8" minlength="6" required/><br>
                        </div>
                        <div class="row">
                            <div class="col-2">
                            </div>
                            <div class="col-8">
                                <input type="submit" class="btn btn-primary btn-block boton" name="login" value="Login"/>
                            </div>
                        </div>
                    </form>
                    <br>
                    <a href="registro.jsp" class="text-center enlace">No tiene un usuario</a>
                </div>
            </div>
        </div>
    </body>
</html>
