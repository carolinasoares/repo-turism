<%-- 
    Document   : crear-paquete
    Created on : 14/02/2020, 21:11:41
    Author     : Caro
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="Logica.Promocion"%>
<%@page import="Logica.Servicio"%>
<%@page import="java.util.List"%>
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
        <title>Crear Paquete</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="plugins/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/ionicons.min.css" rel="stylesheet" type="text/css"/>
        <link href="plugins/daterangepicker/daterangepicker.css" rel="stylesheet" type="text/css"/>
        <link href="plugins/icheck-bootstrap/icheck-bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css" rel="stylesheet" type="text/css"/>
        <link href="plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" type="text/css"/>
        <link href="plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css"/>
        <link href="plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css" rel="stylesheet" type="text/css"/>
        <link href="plugins/bootstrap4-duallistbox/bootstrap-duallistbox.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/adminlte.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/main.css" rel="stylesheet" type="text/css"/>
        
        <link href="fuentes/Merienda/merienda.css" rel="stylesheet" type="text/css"/>
        <link href="fuentes/Sriracha/sriracha.css" rel="stylesheet" type="text/css"/>
        
        <script src="plugins/jquery/jquery.min.js" type="text/javascript"></script>
        <script src="plugins/bootstrap/js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <script src="plugins/select2/js/select2.full.min.js" type="text/javascript"></script>
        <script src="plugins/bootstrap4-duallistbox/jquery.bootstrap-duallistbox.min.js" type="text/javascript"></script>
        <script src="plugins/moment/moment.min.js" type="text/javascript"></script>
        <script src="plugins/inputmask/min/jquery.inputmask.bundle.min.js" type="text/javascript"></script>
        <script src="plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>
        <script src="plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js" type="text/javascript"></script>
        <script src="plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js" type="text/javascript"></script>
        <script src="plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
        <script src="js/adminlte.min.js" type="text/javascript"></script>
        <script src="js/demo.js" type="text/javascript"></script>
        <script src="plugins/jquery-validation/jquery.validate.min.js" type="text/javascript"></script>
        <script src="plugins/jquery-validation/additional-methods.min.js" type="text/javascript"></script>
        <script src="plugins/datatables/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="plugins/datatables-bs4/js/dataTables.bootstrap4.min.js" type="text/javascript"></script>
        <script src="js/main.js" type="text/javascript"></script>
    </head>
    <body>
        <div class="wrapper">
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
                            <li class="nav-item has-treeview">
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
                                        <a href="crear-cliente.jsp" class="nav-link">
                                          <i class="far fa-circle nav-icon"></i>
                                          <p>Crear Cliente</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-item has-treeview menu-open">
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
                                        <a href="obtener-crear-paquete" class="nav-link active">
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
                                <h1 class="m-0 text-dark">CREAR PAQUETE</h1>
                            </div>
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a href="home.jsp">Home</a></li>
                                    <li class="breadcrumb-item active">Crear Paquete</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
                <section class="content" style="padding: 70px;">
                    <div class="container" id="mensaje_crear_paquete" style="position: fixed; display: none;">
                        <div id="mensaje_crear_paquete_interno" class="container col-md-6 elevation-3" style=" height: 300px; background-color: #FBDAAD">
                            <br> 
                            <button type="button" class="btn btn-primary boton" Style="margin-left: 90%;" onclick="$('#mensaje_crear_paquete').css('display','none')">&times;</button>
                            <br>
                            <h3 class="text-center titulo" style="padding-top: 30px;"><strong>Crear Paquete</strong></h3>
                            <div class="row">
                                <div class="col-md-2"></div>
                                <div class="col-md-8">
                                    <p id="mje_crear_paquete"></p>
                                    <button id="aceptar_crear_paquete" class="btn btn-primary btn-block boton">Aceptar</button>
                                    <br>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div clas="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <div id="card-crear-paquete" class="card card-primary">
                                    <div class="card-header">
                                        <h3 class="card-title">Datos del Paquete</h3>
                                    </div>
                                    <form action="crear-paquete" id="frm-crear-paquete">
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-md-4 form-group">
                                                    <label for="crear-paquete-nombre">Nombre Paquete:</label>
                                                    <input type="text" class="form-control" name="nombre" id="crear-paquete-nombre" placeholder="Ingrese el nombre del paquete" maxlength="25" minlength="2" required/>
                                                </div>
                                                <div class="col-md-4 form-group">
                                                    <label for="crear-paquete-descripcion">Descripcion:</label>
                                                    <input type="text" class="form-control" name="descripcion" id="crear-paquete-descripcion" placeholder="Ingrese la descripcion" maxlength="50" minlength="2" required/>
                                                </div>
                                                <div class="col-md-4 form-group">
                                                    <label for="crear-paquete-Promocion">Seleccione una Promocion:</label>
                                                    <select id="crear-paquete-Promocion" name="promocion" class="form-control select2bs4" style="width: 100%;">
                                                        <option value="0"> Elija una Promocion</option>
                                                        <%
                                                            List<Promocion> promociones = sesion.getAttribute("promociones") == null ? null : (List<Promocion>) sesion.getAttribute("promociones");
                                                            if(promociones != null){
                                                                for(Promocion promocion : promociones){
                                                                    out.print("<option value=\""+ promocion.getId_promocion() +"\">");
                                                                    out.print(promocion.getPromocion() + " - Descuento: $" + promocion.getDescuento());
                                                                    out.print("</option>");
                                                                }
                                                            }
                                                        %>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12 form-group">
                                                    <label for="crear-paquete-servicios">Seleccione los Servicios:</label>
                                                    <select name="servicios" id="crear-paquete-servicios" class="duallistbox" multiple="multiple" required style="width: 100%;">
                                                        <%
                                                            List<Servicio> servicios = sesion.getAttribute("servicios") == null? null : (List<Servicio>) sesion.getAttribute("servicios");
                                                            if(servicios != null){
                                                                for(Servicio servicio : servicios){
                                                                    out.print("<option value=\""+ servicio.getId_servicio() +"\">");
                                                                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm");
                                                                    String fromFecha = sdf.format(servicio.getFromFecha()) + " hs.";
                                                                    String toFecha = sdf.format(servicio.getToFecha()) + " hs.";
                                                                    out.print(servicio.getServicio() + " - " + servicio.getDestino() + " - Desde: " + fromFecha + " - Hasta: " + toFecha);
                                                                    out.print("</option>");
                                                                }
                                                            }
                                                        %>
                                                    </select>
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
