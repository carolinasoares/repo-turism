<%-- 
    Document   : reservas
    Created on : 16/02/2020, 20:40:31
    Author     : Caro
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="Logica.Reserva"%>
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
        <title>Reservas</title>
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
                            <li class="nav-item has-treeview menu-open">
                                <a href="#" class="nav-link">
                                    <i class="nav-icon fas fa-circle"></i>
                                    <p>
                                      Reservas
                                      <i class="right fas fa-angle-left"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="obtener-reservas" class="nav-link active">
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
                                <h1>Reservas</h1>
                            </div>
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a href="home.jsp">Home</a></li>
                                    <li class="breadcrumb-item active">Reservas</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </section>
                <section class="content">
                    <div class="container" id="mensaje_reserva" style="position: fixed; display: none;">
                        <div class="col-md-6 elevation-3" style=" height: 300px; background-color: #FBDAAD; margin-top: 200px; margin-left: 500px;">
                            <br> 
                            <button type="button" class="btn btn-primary boton" Style="margin-left: 90%;" onclick="$('#mensaje_reserva').css('display','none'); window.location.reload();">&times;</button>
                            <br>
                            <h3 class="text-center titulo" style="padding-top: 30px;"><strong id="titulo-mje"></strong></h3>
                            <div class="row">
                                <div class="col-md-2"></div>
                                <div class="col-md-8">
                                    <p id="mje_reserva"></p>
                                    <button id="aceptar_reserva" class="btn btn-primary btn-block boton" onclick="$('#mensaje_reserva').css('display','none'); window.location.reload();">Aceptar</button>
                                    <br>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="container" id="modal-confirmar" style="position: fixed; display: none;">
                        <div class="container col-md-6 elevation-3" style=" height: 400px; background-color: #FBDAAD; margin-top: 200px; margin-left: 500px;">
                            <br> 
                            <button type="button" class="btn btn-primary boton" Style="margin-left: 90%;" onclick="$('#modal-confirmar').css('display','none'); $('#card-reservas').css('display','block');">&times;</button>
                            <br>
                            <h3 class="text-center titulo" style="padding-top: 30px;"><strong>Confirmar Reserva</strong></h3>
                            <br>
                            <form action="confirmar-reserva" id="frm-reservas-confirmar">
                                <div class="row">
                                    <div class="col-md-2"></div>
                                    <div class="form-group col-md-8">
                                        <label for="reservas-confirmar-id">Para confirmar la reserva el cliente debe abonar el 15% del precio total.<br>El monto a pagar es de: <span id="conf-pago"></span></label>
                                        <input type="hidden" name="id" id="reservas-confirmar-id">
                                        <input type="hidden" id="reserva-confirmar-pago">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-2"></div>
                                    <div class="form-group col-md-8">
                                        <label>Seleccione medio de pago</label>
                                        <select name="medio_pago" id="medio_pago_confirmar" class="form-control select2bs4" style="width: 100%;" required="">
                                            <option value="EFECTIVO"> Efectivo (Descuento: 10%) </option>
                                            <option value="TARJETA_CREDITO"> Tarjeta de Credito (Recargo: 6%) </option>
                                            <option value="TARJETA_DEBITO"> Tarjeta de Debito </option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-2"></div>
                                    <div class="form-group col-md-8">
                                        <input type="submit" class="btn btn-primary btn-block boton" value="Guardar">
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="container" id="modal-finalizar" style="position: fixed; display: none;">
                        <div class="container col-md-6 elevation-3" style=" height: 400px; background-color: #FBDAAD; margin-top: 200px; margin-left: 500px;">
                            <br> 
                            <button type="button" class="btn btn-primary boton" Style="margin-left: 90%;" onclick="$('#modal-finalizar').css('display','none'); $('#card-reservas').css('display','block');">&times;</button>
                            <br>
                            <h3 class="text-center titulo" style="padding-top: 30px;"><strong>Finalizar Pago</strong></h3>
                            <br>
                            <form action="finalizar-pago" id="frm-finalizar-pago">
                                <div class="row">
                                    <div class="col-md-2"></div>
                                    <div class="form-group col-md-8">
                                        <label for="reservas-finalizar-pago">Para finalizar el pago, el cliente debe abonar: <span id="fin-pago"></span> </label>
                                        <input type="hidden" id="reserva-finalizar-pago">
                                        <input type="hidden" name="id" id="reserva-finalizar-id">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-2"></div>
                                    <div class="form-group col-md-8">
                                        <label>Seleccione medio de pago</label>
                                        <select name="medio_pago" id="medio_pago_finalizar" class="form-control select2bs4" style="width: 100%;" required="">
                                            <option value="EFECTIVO"> Efectivo (Descuento: 10%) </option>
                                            <option value="TARJETA_CREDITO"> Tarjeta de Credito (Recargo: 6%) </option>
                                            <option value="TARJETA_DEBITO"> Tarjeta de Debito </option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-2"></div>
                                    <div class="form-group col-md-8">
                                        <input type="submit" class="btn btn-primary btn-block boton" value="Guardar">
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>   
                    <div class="container" id="modal-rechazar" style="position: fixed; display: none;">
                        <div class="container col-md-6 elevation-3" style=" height: 400px; background-color: #FBDAAD; margin-top: 200px; margin-left: 500px;">
                            <br> 
                            <button type="button" class="btn btn-primary boton" Style="margin-left: 90%;" onclick="$('#modal-rechazar').css('display','none'); $('#card-reservas').css('display','block');">&times;</button>
                            <br>
                            <h3 class="text-center titulo" style="padding-top: 30px;"><strong>Rechazar Reserva</strong></h3>
                            <br>
                            <form action="rechazar-reserva" id="frm-rechazar-reserva">
                                <div class="row">
                                    <div class="col-md-2"></div>
                                    <div class="form-group col-md-8">
                                        <label for="reserva-rechazar-id">Esta seguro de que desea Rechazar la Reserva?</label>
                                        <input type="hidden" name="id" id="reserva-rechazar-id">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-2"></div>
                                    <div class="form-group col-md-8">
                                        <input type="submit" class="btn btn-primary btn-block boton" value="Aceptar">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-2"></div>
                                    <div class="form-group col-md-8">
                                        <button type="button" class="btn btn-primary btn-block boton" onclick="$('#modal-rechazar').css('display','none'); $('#card-reservas').css('display','block');" >Cancelar</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="container" id="modal-cancelar" style="position: fixed; display: none;">
                        <div class="container col-md-6 elevation-3" style=" height: 400px; background-color: #FBDAAD; margin-top: 200px; margin-left: 500px;">
                            <br> 
                            <button type="button" class="btn btn-primary boton" Style="margin-left: 90%;" onclick="$('#modal-cancelar').css('display','none'); $('#card-reservas').css('display','block');">&times;</button>
                            <br>
                            <h3 class="text-center titulo" style="padding-top: 30px;"><strong>Cancelar Reserva</strong></h3>
                            <br>
                            <form action="cancelar-reserva" id="frm-cancelar-reserva">
                                <div class="row">
                                    <div class="col-md-2"></div>
                                    <div class="form-group col-md-8">
                                        <label for="cancelar-cancelar-id">Esta seguro de que desea Cancelar la Reserva?</label>
                                        <input type="hidden" name="id" id="reserva-cancelar-id">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-2"></div>
                                    <div class="form-group col-md-8">
                                        <input type="submit" class="btn btn-primary btn-block boton" value="Aceptar">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-2"></div>
                                    <div class="form-group col-md-8">
                                        <button type="button" class="btn btn-primary btn-block boton" onclick="$('#modal-cancelar').css('display','none'); $('#card-reservas').css('display','block');" >Cancelar</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="container" id="modal-baja" style="position: fixed; display: none;">
                        <div class="container col-md-6 elevation-3" style=" height: 400px; background-color: #FBDAAD; margin-top: 200px; margin-left: 500px;">
                            <br> 
                            <button type="button" class="btn btn-primary boton" Style="margin-left: 90%;" onclick="$('#modal-baja').css('display','none'); $('#card-reservas').css('display','block');">&times;</button>
                            <br>
                            <h3 class="text-center titulo" style="padding-top: 30px;"><strong>Baja Reserva</strong></h3>
                            <br>
                            <form action="baja-reserva" id="frm-baja-reserva">
                                <div class="row">
                                    <div class="col-md-2"></div>
                                    <div class="form-group col-md-8">
                                        <label for="reserva-baja-id">Esta seguro de que desea dar de Baja la Reserva?</label>
                                        <input type="hidden" name="id" id="reserva-baja-id">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-2"></div>
                                    <div class="form-group col-md-8">
                                        <input type="submit" class="btn btn-primary btn-block boton" value="Aceptar">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-2"></div>
                                    <div class="form-group col-md-8">
                                        <button type="button" class="btn btn-primary btn-block boton" onclick="$('#modal-cancelar').css('display','none'); $('#card-reservas').css('display','block');" >Cancelar</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <div class="card" id="card-reservas">
                                <div class="card-header">
                                    <h3 class="card-title" style="color: white;">Reservas Activas</h3>
                                </div>
                                <div class="card-body" style="background-color: white;">
                                    <table id="tabla-reservas" class="table table-hover table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th style="width: 20px;">#</th>
                                                <th style="width: 50px">Cliente</th>
                                                <th style="width: 20px">Tipo</th>
                                                <th style="width: 200px;">Reserva</th>
                                                <th style="width: 50px;">Fecha</th>
                                                <th style="width: 20px;">Estado</th>
                                                <th style="width: 80px;">Pago Adelanto (15%)</th>
                                                <th style="width: 80px;">Pago Reserva</th>
                                                <th style="width: 20px">Precio Total</th>
                                                <th style="width: 80px">Accion</th>
                                                <th style="width: 80px">Baja</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                List<Reserva> reservas = sesion.getAttribute("reservas") == null ? null : (List<Reserva>) sesion.getAttribute("reservas");
                                                if(reservas != null){
                                                    for(Reserva reserva : reservas){
                                                        Date fecha_actual =  new Date();
                                                        if(fecha_actual.compareTo(reserva.getFecha_caducidad()) >= 0 && reserva.getEstado().equals("PENDIENTE"))
                                                            out.println("<tr class=\"fila\" style=\"background-color: #F5C2AF;\">");
                                                        else out.println("<tr class=\"fila\">");
                                                        out.print("<td>" + reserva.getId_reserva() + "</td>>");
                                                        if(reserva.getCliente().isBaja()) out.print("<td style=\"color: grey;\">(Inactivo)<br>" + reserva.getCliente().getApellido() + ", " + reserva.getCliente().getNombre() + "<br>DNI:" + reserva.getCliente().getDni() + "</td>>");
                                                        else out.print("<td>" + reserva.getCliente().getApellido() + ", " + reserva.getCliente().getNombre() + "<br>DNI:" + reserva.getCliente().getDni() + "</td>>");
                                                        out.print("<td>" + reserva.getTipo() + "</td>>");
                                                        if(reserva.getTipo().equals("PAQUETE")){
                                                            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");
                                                            String fromFecha = sdf.format(reserva.getPaquete().getFromFecha()) + " hs.";
                                                            String toFecha = sdf.format(reserva.getPaquete().getToFecha()) + " hs.";
                                                            if(reserva.getPaquete().isBaja()) out.print("<td style=\"color: grey;\">(Inactivo)<br>" + reserva.getPaquete().getNombre() + "<br> Precio: " + String.format("%.2f", reserva.getPaquete().getPrecio()) + "<br> Desde: " + "" + "<br> Hasta: " + "" + "</td>>");
                                                            else out.print("<td>" + reserva.getPaquete().getNombre() + "<br> Precio: " + String.format("%.2f", reserva.getPaquete().getPrecio()) + "<br> Desde: " + fromFecha + "<br> Hasta: "+ toFecha + "</td>>");
                                                        }else if(reserva.getTipo().equals("SERVICIO")){
                                                            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");
                                                            String fromFecha = sdf.format(reserva.getServicio().getFromFecha()) + " hs.";
                                                            String toFecha = sdf.format(reserva.getServicio().getToFecha()) + " hs.";
                                                            if(reserva.getServicio().isBaja()) out.print("<td style=\"color: grey;\">(Inactivo)<br>" + reserva.getServicio().getServicio() + "<br> Destino: " + reserva.getServicio().getDestino() + "<br> Precio: " + String.format("%.2f", reserva.getServicio().getPrecio()) + "<br> Desde: " + fromFecha + "<br> Hasta: " + toFecha + "</td>>");
                                                            else out.print("<td>" + reserva.getServicio().getServicio() + "<br> Destino: " + reserva.getServicio().getDestino() + "<br> Precio: " + String.format("%.2f", reserva.getServicio().getPrecio()) + "<br> Desde: " + fromFecha + "<br> Hasta: " + toFecha + "</td>>");
                                                        }
                                                        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                                                        String fecha_reserva = sdf.format(reserva.getFecha_reserva());
                                                        String fecha_caducidad = sdf.format(reserva.getFecha_caducidad());
                                                        out.print("<td> Fecha de Reserva: " + fecha_reserva + "<br> Fecha de Caducidad: " + fecha_caducidad + "</td>>");
                                                        out.print("<td>" + reserva.getEstado() + "</td>>");
                                                        if(reserva.getAdelanto()>0){
                                                            out.print("<td> Medio de Pago: " + reserva.getMedio_pago_adelanto() + "<br> Monto: " + String.format("%.2f", reserva.getAdelanto()) + "</td>>");
                                                        }else if(reserva.getEstado().equals("PENDIENTE")){
                                                            out.print("<td><button type=\"button\" class=\"btn btn-primary btn-block boton\" onclick=\"confirmar("+ reserva.getId_reserva() + ", " + reserva.getPrecioTotal() +")\"> Confirmar </button></td>>");
                                                        }else out.print("<td> </td>");
                                                        if(reserva.getPago_reserva() > 0){
                                                            out.print("<td> Medio de Pago: " + reserva.getMedio_pago() + "<br> Monto: " + String.format("%.2f", reserva.getPago_reserva()) + "</td>>");
                                                        }else if(reserva.getEstado().equals("PENDIENTE") || reserva.getEstado().equals("CONFIRMADA")){
                                                            out.print("<td><button type=\"button\" class=\"btn btn-primary btn-block boton\" onclick=\"finalizarPago("+ reserva.getId_reserva() + ", " + reserva.getPrecioTotal() + ", " + reserva.getAdelanto() +")\"> Finalizar Pago </button></td>>");
                                                        }else out.print("<td> </td>");
                                                        out.print("<td> $" + String.format("%.2f", reserva.getPrecioTotal()) + "</td>>");
                                                        if(fecha_actual.compareTo(reserva.getFecha_caducidad()) >= 0 && reserva.getEstado().equals("PENDIENTE"))
                                                            out.print("<td><button type=\"button\" class=\"btn btn-primary btn-block boton\" onclick=\"rechazarReserva("+ reserva.getId_reserva() +")\"> Rechazar </button></td>>");
                                                        else if(reserva.getEstado().equals("PENDIENTE"))
                                                            out.print("<td> La reserva sigue vigente </td>");
                                                        else if(reserva.getEstado().equals("CONFIRMADA") || reserva.getEstado().equals("PAGO_FINALIZADO"))
                                                            out.print("<td><button type=\"button\" class=\"btn btn-primary btn-block boton\" onclick=\"cancelarReserva("+ reserva.getId_reserva() +")\"> Cancelar </button></td>>");
                                                        else out.print("<td> </td>");
                                                        out.print("<td><button type=\"button\" class=\"btn btn-primary btn-block boton\" onclick=\"bajaReserva("+ reserva.getId_reserva() +")\"> Baja </button></td>>");
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
