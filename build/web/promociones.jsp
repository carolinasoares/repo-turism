<%-- 
    Document   : promociones
    Created on : 14/02/2020, 16:05:29
    Author     : Caro
--%>

<%@page import="Logica.Promocion"%>
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
        <title>Promociones</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        
        <link href="plugins/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/ionicons.min.css" rel="stylesheet" type="text/css"/>
        <link href="plugins/icheck-bootstrap/icheck-bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="plugins/datatables-bs4/css/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css"/>
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
        <script src="plugins/datatables/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="plugins/datatables-bs4/js/dataTables.bootstrap4.min.js" type="text/javascript"></script>
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
                                        <a href="obtener-paquetes" class="nav-link" onclick="window.location=''">
                                          <i class="far fa-circle nav-icon"></i>
                                          <p>Ver Paquetes</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="obtener-crear-paquete" class="nav-link" onclick="window.location='obtener-crear-paquete'">
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
                            <li class="nav-item has-treeview  menu-open">
                                <a href="#" class="nav-link">
                                    <i class="nav-icon fas fa-circle"></i>
                                    <p>
                                      Promociones
                                      <i class="right fas fa-angle-left"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="obtener-promociones" class="nav-link active">
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
                                <h1 class="m-0 text-dark">PROMOCIONES</h1>
                            </div>
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a href="home.jsp">Home</a></li>
                                    <li class="breadcrumb-item active">Promociones</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
                <section class="content" style="padding: 70px;">
                    
                    <div clas="container-fluid">
                        <div class="row">
                            <div class="col-md-2">
                            </div>
                            <div class="col-md-8">
                                <div class="row">
                                    <div class="col-md-12" id="mensaje_crear_promocion" style="display: none; margin-bottom: 20px;">
                                        <div id="mensaje_crear_promocion_interno" class="container col-md-6 elevation-3" style="  height: 350px; background-color: #FBDAAD">
                                            <br> 
                                            <button type="button" class="btn btn-primary boton" Style="margin-left: 90%;" onclick="$('#mensaje_crear_promocion').css('display','none')">&times;</button>
                                            <br>
                                            <h3 class="text-center titulo" style="padding-top: 30px;"><strong>Crear Promocion</strong></h3>
                                            <div class="row">
                                                <div class="col-md-2"></div>
                                                <div class="col-md-8">
                                                    <p id="mje_crear_prom"></p>
                                                    <button id="aceptar_crear_prom" class="btn btn-primary btn-block boton">Aceptar</button>
                                                    <br>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div id="card-crear-promocion" class="col-md-12 card card-primary">
                                        <div class="card-header">
                                            <h3 class="card-title">Crear Promocion</h3>
                                        </div>
                                        <form action="crear-promocion" id="frm-crear-promocion">
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-md-4 form-group">
                                                        <label for="crear-promocion-prom">Promocion:</label>
                                                        <input type="text" class="form-control" name="promocion" id="crear-promocion-prom" placeholder="Ingrese el nombre o descripcion del servicio" maxlength="25" minlength="2" required/>
                                                    </div>
                                                    <div class="col-md-4 form-group">
                                                        <label for="crear-promocion-descuento">Descuento:</label>
                                                        <input type="number" class="form-control" name="descuento" id="crear-promocion-descuento" placeholder="00.00" step=".01" maxlength="25" minlength="1" required/>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <br>
                                                        <input type="submit" value="Guardar" class="btn btn-primary btn-block boton" name="btn-guardar" style="margin-top: 6px;"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="card-footer">
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-md-2">
                            </div>
                            <div class="col-md-8">
                                <div class="row">
                                    <div class="col-md-12" id="mensaje_modificar_promocion" style="display: none; margin-bottom: 20px;">
                                        <div id="mensaje_modificar_promocion_interno" class="container col-md-6 elevation-3" style=" height: 350px; background-color: #FBDAAD">
                                            <br> 
                                            <button type="button" class="btn btn-primary boton" Style="margin-left: 90%;" onclick="$('#mensaje_modificar_promocion').css('display','none')">&times;</button>
                                            <br>
                                            <h3 class="text-center titulo" style="padding-top: 30px;"><strong>Modificar Promocion</strong></h3>
                                            <div class="row">
                                                <div class="col-md-2"></div>
                                                <div class="col-md-8">
                                                    <p id="mje_mod_prom"></p>
                                                    <button id="aceptar_mod_prom" class="btn btn-primary btn-block boton">Aceptar</button>
                                                    <br>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div id="card-modificar-promocion" class="col-md-12 card card-primary" style="display: none">
                                        <div class="card-header">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <h3 class="card-title">Modificar Promocion</h3>
                                                </div>
                                            </div>
                                        </div>
                                        <form action="modificar-promocion" id="frm-modificar-promocion">
                                            <input type="hidden" name="id" id="id_mod_prom"/>
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-md-4 form-group">
                                                        <label for="modificar-promocion-prom">Promocion:</label>
                                                        <input type="text" class="form-control" name="promocion" id="modificar-promocion-prom" placeholder="Ingrese el nombre o descripcion del servicio" maxlength="25" minlength="2" required/>
                                                    </div>
                                                    <div class="col-md-4 form-group">
                                                        <label for="modificar-promocion-descuento">Descuento:</label>
                                                        <input type="number" class="form-control" name="descuento" id="modificar-promocion-descuento" placeholder="00.00" step=".01" maxlength="25" minlength="2" required/>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <br>
                                                        <input type="submit" value="Guardar" class="btn btn-primary btn-block boton" name="btn-guardar" style="margin-top: 6px;"/>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                <div class="col-md-4"></div>
                                                <div class="col-md-4"></div>
                                                <div class="col-md-4">
                                                    <button type="button" class="btn btn-primary btn-block boton" style="background-color: " onclick="$('#card-modificar-promocion').css('display', 'none')">
                                                        Cancelar
                                                    </button>
                                                </div>
                                            </div>
                                            </div>
                                            <div class="card-footer">
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-2"></div>
                            <div class="col-8">
                                <div class="row">
                                    <div class="col-md-12" id="mensaje_baja_promocion" style="display: none;">
                                        <div id="mensaje_baja_promocion_interno" class="container col-md-6 elevation-3" style=" height: 350px; background-color: #FBDAAD; margin-top: 150px;">
                                            <br> 
                                            <button type="button" class="btn btn-primary boton" Style="margin-left: 90%;" onclick="$('#mensaje_baja_promocion').css('display','none'); $('#datos_promociones').css('display','block');">&times;</button>
                                            <br>
                                            <h3 class="text-center titulo" style="padding-top: 30px;"><strong>Baja Promocion</strong></h3>
                                            <div class="row">
                                                <div class="col-md-2"></div>
                                                <div class="col-md-8">
                                                    <p id="mje_baja_prom"></p>
                                                    <form id="frm-baja-promocion" action="baja-promocion">
                                                        <input type="hidden" id="id_baja_promocion" value="" name="id" />
                                                        <button type="submit" class="btn btn-primary btn-block boton">Aceptar</button>
                                                    </form>
                                                    <br>
                                                    <button id="cancelar_baja_prom" class="btn btn-primary btn-block boton" onclick="$('#mensaje_baja_promocion').css('display','none'); $('#datos_promociones').css('display','block');">Caneclar</button>
                                                    <br>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12" id="mensaje_conf_baja_promocion" style="display: none;">
                                        <div id="mensaje_conf_baja_promocion_interno" class="container col-md-6 elevation-3" style=" height: 350px; background-color: #FBDAAD">
                                            <br> 
                                            <button type="button" class="btn btn-primary boton" Style="margin-left: 90%;" onclick="window.location.reload();">&times;</button>
                                            <br>
                                            <h3 class="text-center titulo" style="padding-top: 30px;"><strong>Baja Cliente</strong></h3>
                                            <div class="row">
                                                <div class="col-md-2"></div>
                                                <div class="col-md-8">
                                                    <p id="mje_conf_baja_prom"></p>
                                                    <button id="aceptar_baja_prom" class="btn btn-primary btn-block boton" onclick="window.location.reload();">Aceptar</button>
                                                    <br>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div id="datos_promociones" class="card col-md-12">
                                        <div class="card-header">
                                            <h3 class="card-title" style="color: white;">Promociones Activas</h3>
                                        </div>
                                        <div class="card-body" style="background-color: white;">
                                            <table id="tabla-promociones" class="table table-hover table-bordered table-striped">
                                                <thead>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>Promocion</th>
                                                        <th>Descuento</th>
                                                        <th>Modificar</th>
                                                        <th>Baja</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%
                                                        List<Promocion> promociones = sesion.getAttribute("promociones") == null ? null : (List<Promocion>) sesion.getAttribute("promociones");
                                                        if(promociones!=null){
                                                            for(Promocion promocion : promociones){
                                                                out.println("<tr class=\"fila\">");
                                                                out.println("<td>"+promocion.getId_promocion()+"</td>");
                                                                out.println("<td>"+promocion.getPromocion()+"</td>");
                                                                out.println("<td> $"+promocion.getDescuento()+"</td>");
                                                                out.println("<td><button class=\"btn btn-primary btn-block boton\" style=\"color:white\" onclick=\"modificarPromocion("+ promocion.getId_promocion() + ", '" + promocion.getPromocion() + "', " + promocion.getDescuento() +");\">Modificar</button></td>");
                                                                out.println("<td><button class=\"btn btn-primary btn-block boton\" style=\"color:white\" onclick=\"bajaPromocion("+ promocion.getId_promocion() + ", '" + promocion.getPromocion() +"');\">Baja</button></td>");
                                                                out.println("</tr>");
                                                            }
                                                        }
                                                        
                                                    %>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                    
                </section>
            </div>
            
        </div>
    </body>
</html>
