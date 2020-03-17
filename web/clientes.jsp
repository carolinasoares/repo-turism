<%-- 
    Document   : clientes
    Created on : 13/02/2020, 15:33:25
    Author     : Caro
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Logica.Cliente"%>
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
        <title>Clientes</title>
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
                                        <a href="obtener-clientes" class="nav-link active">
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
            <div class="content-wrapper">
                <section class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-6">
                                <h1>CLIENTES</h1>
                            </div>
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a href="home.jsp">Home</a></li>
                                    <li class="breadcrumb-item active">Clientes</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </section>
                <section class="content">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h3 class="card-title" style="color: white;">Clientes Activos</h3>
                                </div>
                                <div class="card-body" style="background-color: white;">
                                    <div class="container" id="mensaje_baja_cliente" style="position: fixed; display: none;">
                                        <div id="mensaje_baja_cliente_interno" class="container col-md-6 elevation-3" style=" height: 350px; background-color: #FBDAAD; margin-top: 150px;">
                                            <br> 
                                            <button type="button" class="btn btn-primary boton" Style="margin-left: 90%;" onclick="$('#mensaje_baja_cliente').css('display','none'); $('#tabla_clientes').css('display','block');">&times;</button>
                                            <br>
                                            <h3 class="text-center titulo" style="padding-top: 30px;"><strong>Baja Cliente</strong></h3>
                                            <div class="row">
                                                <div class="col-md-2"></div>
                                                <div class="col-md-8">
                                                    <p id="mje_baja_cli"></p>
                                                    <form id="frm-baja-cliente" action="baja-cliente">
                                                        <input type="hidden" id="id_baja_cliente" value="" name="id" />
                                                        <button type="submit" class="btn btn-primary btn-block boton">Aceptar</button>
                                                    </form>
                                                    <br>
                                                    <button id="cancelar_baja_cli" class="btn btn-primary btn-block boton" onclick="$('#mensaje_baja_cliente').css('display','none'); $('#tabla-clientes').css('display','block');">Caneclar</button>
                                                    <br>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="container" id="mensaje_conf_baja_cliente" style="position: fixed; display: none;">
                                        <div id="mensaje_conf_baja_cliente_interno" class="container col-md-6 elevation-3" style=" height: 300px; background-color: #FBDAAD">
                                            <br> 
                                            <button type="button" class="btn btn-primary boton" Style="margin-left: 90%;" onclick="$('#mensaje_baja_cliente').css('display','none'); window.location.reload();">&times;</button>
                                            <br>
                                            <h3 class="text-center titulo" style="padding-top: 30px;"><strong>Baja Cliente</strong></h3>
                                            <div class="row">
                                                <div class="col-md-2"></div>
                                                <div class="col-md-8">
                                                    <p id="mje_conf_baja_cli"></p>
                                                    <button id="aceptar_baja__cli" class="btn btn-primary btn-block boton" onclick="$('#mensaje_baja_cliente').css('display','none'); window.location.reload();">Aceptar</button>
                                                    <br>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <table id="tabla-clientes" class="table table-hover table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>DNI</th>
                                                <th>Nombre</th>
                                                <th>Apellido</th>
                                                <th>Fecha de Nacimieto</th>
                                                <th style="width: 20px;">Edad</th>
                                                <th style="width: 30px;">Nacionalidad</th>
                                                <th>Telefono</th>
                                                <th>Email</th>
                                                <th>Direccion</th>
                                                <th>Modificar</th>
                                                <th>Baja</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            
                                            <%
                                                List<Cliente> clientes = sesion.getAttribute("clientes") == null? null : (List<Cliente>) sesion.getAttribute("clientes");
                                                if(clientes!=null){
                                                    for(Cliente cliente : clientes){
                                                        out.println("<tr class=\"fila\">");
                                                        out.println("<td>"+cliente.getId_cliente()+"</td>");
                                                        out.println("<td>"+cliente.getDni()+"</td>");
                                                        out.println("<td>"+cliente.getNombre()+"</td>");
                                                        out.println("<td>"+cliente.getApellido()+"</td>");
                                                        String fecha = cliente.getFechaNac().substring(8, 10) + "/" + cliente.getFechaNac().substring(5, 7) + "/" + cliente.getFechaNac().substring(0, 4);
                                                        out.println("<td>"+fecha+"</td>");
                                                        out.println("<td>"+cliente.getEdad()+"</td>");
                                                        out.println("<td>"+cliente.getNacionalidad()+"</td>");
                                                        out.println("<td>"+cliente.getTelefono()+"</td>");
                                                        out.println("<td>"+cliente.getEmail()+"</td>");
                                                        out.println("<td>"+cliente.getDireccion()+"</td>");
                                                        out.println("<td><button type=\"button\" class=\"btn btn-primary btn-block boton\" style=\"color:white\" onclick=\"modificarCliente("+ cliente.getId_cliente()  +");\">Modificar</button></td>");
                                                        out.println("<td><button type=\"button\" class=\"btn btn-primary btn-block boton\" style=\"color:white\" onclick=\"bajaCliente("+ cliente.getId_cliente()  + ", '" + cliente.getNombre() + "', '" + cliente.getApellido() +"');\">Baja</button></td>");
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
                </section>
                
            </div>
        </div>
    </body>
</html>
