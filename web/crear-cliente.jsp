<%-- 
    Document   : crear-usuario
    Created on : 12/02/2020, 23:23:44
    Author     : Caro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   HttpSession sesion = request.getSession(true);
    Object u = sesion.getAttribute("nombre_usuario") == null ? null : sesion.getAttribute("nombre_usuario");
    if(u == null){
        response.sendRedirect("login.jsp");
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear Cliente</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="plugins/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/ionicons.min.css" rel="stylesheet" type="text/css"/>
        <link href="plugins/icheck-bootstrap/icheck-bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/adminlte.min.css" rel="stylesheet" type="text/css"/>
        <link href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css" rel="stylesheet" type="text/css"/>
        <link href="plugins/summernote/summernote-bs4.css" rel="stylesheet" type="text/css"/>
        <link href="css/main.css" rel="stylesheet" type="text/css"/>
        
        <link href="fuentes/Merienda/merienda.css" rel="stylesheet" type="text/css"/>
        <link href="fuentes/Sriracha/sriracha.css" rel="stylesheet" type="text/css"/>
        
        
        <script src="plugins/jquery/jquery.min.js" type="text/javascript"></script>
        <script src="plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
        <script src="plugins/bootstrap/js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <script src="plugins/chart.js/Chart.min.js" type="text/javascript"></script>
        <script src="plugins/sparklines/sparkline.js" type="text/javascript"></script>
        <script src="plugins/jquery-knob/jquery.knob.min.js" type="text/javascript"></script>
        <script src="plugins/summernote/summernote-bs4.min.js" type="text/javascript"></script>
        <script src="plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js" type="text/javascript"></script>
        <script src="js/adminlte.min.js" type="text/javascript"></script>
        <script src="js/demo.js" type="text/javascript"></script>
        <script src="plugins/jquery-validation/jquery.validate.min.js" type="text/javascript"></script>
        <script src="plugins/jquery-validation/additional-methods.min.js" type="text/javascript"></script>
        <script src="js/main.js" type="text/javascript"></script>
        
    </head>
    <body>
        <div class="wrapper" style="">
            <aside class="main-sidebar sidebar-dark-primary elevation-4">
                <a href="home.jsp" class="brand-link" style="padding-top: 20px;">
                    <img src="imagenes/iconoprincipal3.png" alt="AdminLTE Logo" class="img-circle elevation-3" style=" height: 60px; padding: 5px;">
                    <span style="font-size: 25px; padding-top: 50%;"><span style="font-family: 'Sriracha', cursive;">Turismo</span><span style="font-family: 'Merienda', cursive;">SA</span></span>
                </a>
                <div class="sidebar">
                    <div class="user-panel mt-3 pb-3 mb-3">
                        <nav class="mt-2">
                            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                                <li class="nav-item has-treeview">
                                    <a class="nav-link">
                                        <img src="imagenes/user.png" class="img-circle elevation-2 nav-icon fas" alt="User Image">
                                        <p href="#" class="">
                                            <%= request.getSession().getAttribute("nombre_usuario") %>
                                            <i class="right fas fa-angle-left"></i>
                                        </p>
                                    </a>
                                    <ul class="nav nav-treeview">
                                        <li class="nav-item">
                                            <a href="modificar-usuario.jsp" class="nav-link">
                                              <i class="far fa-circle nav-icon"></i>
                                              <p>Modificar Usuario</p>
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="cambiar-clave.jsp" class="nav-link">
                                              <i class="far fa-circle nav-icon"></i>
                                              <p>Cambiar Clave</p>
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="logout" class="nav-link">
                                              <i class="far fa-circle nav-icon"></i>
                                              <p>Logout</p>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </nav>
                    </div>
                    <nav class="mt-2">
                        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                            <li class="nav-item has-treeview menu-open">
                                <a href="#" class="nav-link">
                                    <i class="nav-icon fas fa-circle"></i>
                                    <p>
                                      Clientes
                                      <i class="right fas fa-angle-left"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="obtener-clientes" class="nav-link">
                                          <i class="far fa-circle nav-icon"></i>
                                          <p>Ver Clientes</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="crear-cliente.jsp" class="nav-link active">
                                          <i class="far fa-circle nav-icon"></i>
                                          <p>Crear Cliente</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-item has-treeview">
                                <a href="#" class="nav-link">
                                    <i class="nav-icon fas fa-circle"></i>
                                    <p>
                                      Paquetes
                                      <i class="right fas fa-angle-left"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="obtener-paquetes" class="nav-link">
                                          <i class="far fa-circle nav-icon"></i>
                                          <p>Ver Paquetes</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="obtener-crear-paquete" class="nav-link">
                                          <i class="far fa-circle nav-icon"></i>
                                          <p>Crear Paquete</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-item has-treeview">
                                <a href="#" class="nav-link">
                                    <i class="nav-icon fas fa-circle"></i>
                                    <p>
                                      Servicios
                                      <i class="right fas fa-angle-left"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="obtener-servicios" class="nav-link">
                                          <i class="far fa-circle nav-icon"></i>
                                          <p>Ver Servicios</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="crear-servicio.jsp" class="nav-link">
                                          <i class="far fa-circle nav-icon"></i>
                                          <p>Crear Servicios</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-item has-treeview">
                                <a href="#" class="nav-link">
                                    <i class="nav-icon fas fa-circle"></i>
                                    <p>
                                      Promociones
                                      <i class="right fas fa-angle-left"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="obtener-promociones" class="nav-link">
                                          <i class="far fa-circle nav-icon"></i>
                                          <p>Ver Promociones</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-item has-treeview">
                                <a href="#" class="nav-link">
                                    <i class="nav-icon fas fa-circle"></i>
                                    <p>
                                      Reservas
                                      <i class="right fas fa-angle-left"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="obtener-reservas" class="nav-link">
                                          <i class="far fa-circle nav-icon"></i>
                                          <p>Ver Reservas</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="obtener-crear-reserva" class="nav-link">
                                          <i class="far fa-circle nav-icon"></i>
                                          <p>Crear Reservas</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                </div>
            </aside>
            <div class="content-wrapper" style="padding: 30px;">
                <div class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-6">
                                <h1 class="m-0 text-dark">CREAR CLIENTE</h1>
                            </div>
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a href="home.jsp">Home</a></li>
                                    <li class="breadcrumb-item active">Crear Cliente</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
                
                
                <section class="content" style="padding: 70px;">
                    <div class="container" id="mensaje_crear_cliente" style="position: fixed; display: none;">
                        <div id="mensaje_crear_cliente_interno" class="container col-md-6 elevation-3" style=" height: 300px; background-color: #FBDAAD">
                            <br> 
                            <button type="button" class="btn btn-primary boton" Style="margin-left: 90%;" onclick="$('#mensaje_crear_cliente').css('display','none')">&times;</button>
                            <br>
                            <h3 class="text-center titulo" style="padding-top: 30px;"><strong>Crear Cliente</strong></h3>
                            <div class="row">
                                <div class="col-md-2"></div>
                                <div class="col-md-8">
                                    <p id="mje_crear_cli"></p>
                                    <button id="aceptar_crear_cli" class="btn btn-primary btn-block boton">Aceptar</button>
                                    <br>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div clas="container-fluid">
                        <div class="row">
                            <div class="col-md-2">
                            </div>
                            <div class="col-md-8">
                                <div id="card-crear-cliente" class="card card-primary">
                                    <div class="card-header">
                                        <h3 class="card-title">Datos del Cliente</h3>
                                    </div>
                                    <form action="crear-cliente" id="frm-crear-cliente">
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-md-4 form-group">
                                                    <label for="crear-cliente-dni">DNI:</label>
                                                    <input type="number" step="1" class="form-control" name="dni" id="crear-cliente-dni" placeholder="Ingrese DNI, solo numeros" maxlength="8" minlength="8" required/>
                                                </div>
                                                <div class="col-md-4 form-group">
                                                    <label for="crear-cliente-nombre">Nombre:</label>
                                                    <input type="text" class="form-control" name="nombre" id="crear-cliente-nombre" placeholder="Ingrese Nombre" maxlength="25" minlength="2" required/>
                                                </div>
                                                <div class="col-md-4 form-group">
                                                    <label for="crear-cliente-apellido">Apellido:</label>
                                                    <input type="text" class="form-control" name="apellido" id="crear-cliente-apellido" placeholder="Ingrese Apellido" maxlength="25" minlength="2" required/>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4 form-group">
                                                    <label for="crear-cliente-fechanac">Fecha de Nacimiento:</label>
                                                    <input type="date" class="form-control" name="fecha_nac" id="crear-cliente-fechanac" placeholder="DD/MM/AAAA" maxlength="10" minlength="10" required/>
                                                </div>
                                                <div class="col-md-4 form-group">
                                                    <label for="crear-cliente-edad">Edad:</label>
                                                    <input type="number" step="1" class="form-control" name="edad" id="crear-cliente-edad" placeholder="Ingrese su edad" maxlength="3" minlength="1" required/>
                                                </div>
                                                <div class="col-md-4 form-group">
                                                    <label for="crear-cliente-nacionalidad">Nacionalidad:</label>
                                                    <input type="text" class="form-control" name="nacionalidad" id="crear-cliente-nacionalidad" placeholder="Ingrese su nacionalidad" maxlength="25" minlength="2" required/>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4 form-group">
                                                    <label for="crear-cliente-telefono">Telefono:</label>
                                                    <input type="number" step="1" class="form-control" name="telefono" id="crear-cliente-telefono" placeholder="Ingrese su telefono o celular" maxlength="17" minlength="9" required/>
                                                </div>
                                                <div class="col-md-4 form-group">
                                                    <label for="crear-cliente-email">Email:</label>
                                                    <input type="email" class="form-control" name="email" id="crear-cliente-email" placeholder="usuario1@servidor.com" maxlength="35" minlength="10" required/>
                                                </div>
                                                <div class="col-md-4 form-group">
                                                    <label for="crear-cliente-direccion">Direccion:</label>
                                                    <textarea class="form-control" name="direccion" id="crear-cliente-direccion" placeholder="Ingrese su direccion/domicilio"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card-footer">
                                            <div class="row">
                                                <div class="col-md-4"></div>
                                                <div class="col-md-4">
                                                    <input type="submit" value="Guardar" class="btn btn-primary btn-block boton" name="btn-guardar"/>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                </section>
            </div>
            
        </div>
    </body>
</html>
