/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(function(){
    $("#frm-registro-usuario").validate({
        rules : {
            clave2 : {
               equalTo : "#reg-clave"
            }
        },
        messages : {
            reg_nombre_usuario : {
                required : "Este campo es requerido",
                minlength : "Por favor ingrese almenos 4 caracteres",
                maxlength : "Este campo soporta hasta 10 caracteres"
            },
            clave : {
                required : "Este campo es requerido",
                minlength : "Por favor ingrese almenos 6 caracteres",
                maxlength : "Este campo soporta hasta 8 caracteres"
            },
            clave2 : {
                required : "Este campo es requerido",
                minlength : "Por favor ingrese almenos 6 caracteres",
                maxlength : "Este campo soporta hasta 8 caracteres",
                equalTo : "Las claves no son iguales"
            }
        },
        submitHandler: function (form){
            $("#tarjeta_registro").css('display', 'none');
            var data = $("#frm-registro-usuario").serialize();
            $.post("registrar-usuario", data, function (respuesta, estado, jqXHR){
                if(respuesta == '2'){
                    $("#mje_reg_usu").text("El registro fue exitoso, sera redireccionado a la pagina de login");
                    $('#aceptar_reg').unbind('click');
                    $("#aceptar_reg").click(function () {
                        window.location = "login.jsp";
                    });
                    $("#mensaje_registro_usuario").css('display','block');
                    setTimeout(function() {
                        window.location = "login.jsp";
                    },5000);
                }else if(respuesta == '1'){
                    $("#mje_reg_usu").text("Ya existe el usaurio, por favor intente nuevamente");
                    $('#aceptar_reg').unbind('click');
                    $("#aceptar_reg").click(function () {
                        $("#mensaje_registro_usuario").css('display','none');
                        $("#tarjeta_registro").css('display', 'block');
                    });
                    $("#mensaje_registro_usuario").css('display','block');
                }else{
                    $("#mje_reg_usu").text("Hubo un error al registrar el usuario, por favor intente nuevamente");
                    $('#aceptar_reg').unbind('click');
                    $("#aceptar_reg").click(function () {
                        $("#mensaje_registro_usuario").css('display','none');
                        $("#tarjeta_registro").css('display', 'block');
                    });
                    $("#mensaje_registro_usuario").css('display','block');
                }
            });
        }
    });
});

$(function(){
    $("#frm-login-usuario").validate({
        messages : {
            reg_nombre_usuario : {
                required : "Este campo es requerido",
                minlength : "Por favor ingrese almenos 4 caracteres",
                maxlength : "Este campo soporta hasta 10 caracteres"
            },
            clave : {
                required : "Este campo es requerido",
                minlength : "Por favor ingrese almenos 6 caracteres",
                maxlength : "Este campo soporta hasta 8 caracteres"
            }
        },
        submitHandler: function (form){
            $("#tarjeta_login").css('display', 'none');
            var data = $("#frm-login-usuario").serialize();
            $.post("autenticar-usuario", data, function (respuesta, estado, jqXHR){
                if(respuesta == '1'){
                    $("#mje_log_usu").text("El registro fue exitoso, sera redireccionado a la pagina principal");
                    $('#aceptar_log').unbind('click');
                    $("#aceptar_log").click(function () {
                        window.location = "home.jsp";
                    });
                    $("#mensaje_login_usuario").css('display','block');
                    setTimeout(function() {
                        window.location = "home.jsp";
                    },5000);
                }else if(respuesta == '0'){
                    $("#mje_log_usu").text("El usuario o la clave son incorrectos, por favor intente nuevamente");
                    $('#aceptar_log').unbind('click');
                    $("#aceptar_log").click(function () {
                        $("#mensaje_login_usuario").css('display','none');
                        $("#tarjeta_login").css('display', 'block');
                    });
                    $("#mensaje_login_usuario").css('display','block');
                }
            });
        }
    });
});

$(function(){
    $("#frm-modificar-usuario").validate({
        messages : {
            usuario_nuevo : {
                required : "Este campo es requerido",
                minlength : "Por favor ingrese almenos 4 caracteres",
                maxlength : "Este campo soporta hasta 10 caracteres"
            },
            clave : {
                required : "Este campo es requerido",
                minlength : "Por favor ingrese almenos 6 caracteres",
                maxlength : "Este campo soporta hasta 8 caracteres"
            }
        },
        submitHandler: function (form){
            $("#card-modificar-usuario").css('display', 'none');
            var data = $("#frm-modificar-usuario").serialize();
            $.post("modificar-usuario", data, function (respuesta, estado, jqXHR){
                if(respuesta == '1'){
                    $("#mje_mod_usu").text("EL usuario se modifico correctamente");
                    $('#aceptar_mod_usuario').unbind('click');
                    $("#aceptar_mod_usuario").click(function () {
                        window.location = "login.jsp";
                    });
                    $("#mensaje_mod_usuario").css('display','block');
                    setTimeout(function() {
                        window.location = "login.jsp";
                    },5000);
                }else if(respuesta == '0'){
                    $("#mje_mod_usu").text("Hubo un problema al modificar el usuario, por favor intenete nuevamente");
                    $('#aceptar_mod_usuario').unbind('click');
                    $("#aceptar_mod_usuario").click(function () {
                        $("#mensaje_mod_usuario").css('display','none');
                        $("#card-modificar-usuario").css('display', 'block');
                    });
                    $("#mensaje_mod_usuario").css('display','block');
                }else if(respuesta == '2'){
                    $("#mje_mod_usu").text("Ya existe un usuario con ese nombre, por favor intenete nuevamente");
                    $('#aceptar_mod_usuario').unbind('click');
                    $("#aceptar_mod_usuario").click(function () {
                        $("#mensaje_mod_usuario").css('display','none');
                        $("#card-modificar-usuario").css('display', 'block');
                    });
                    $("#mensaje_mod_usuario").css('display','block');
                }
            });
        }
    });
});

$(function(){
    $("#frm-cambiar-clave").validate({
        rules : {
            clave_nueva_2 : {
               equalTo : "#cambiar-clave-clave-nueva1"
            }
        },
        messages : {
            usuario : {
                required : "Este campo es requerido",
                minlength : "Por favor ingrese almenos 4 caracteres",
                maxlength : "Este campo soporta hasta 10 caracteres"
            },
            clave : {
                required : "Este campo es requerido",
                minlength : "Por favor ingrese almenos 6 caracteres",
                maxlength : "Este campo soporta hasta 8 caracteres"
            },
            clave_nueva_1 : {
                required : "Este campo es requerido",
                minlength : "Por favor ingrese almenos 6 caracteres",
                maxlength : "Este campo soporta hasta 8 caracteres"
            },
            clave_nueva_2 : {
                required : "Este campo es requerido",
                minlength : "Por favor ingrese almenos 6 caracteres",
                maxlength : "Este campo soporta hasta 8 caracteres",
                equalTo : "Las claves no son iguales"
            }
        },
        submitHandler: function (form){
            $("#card-cambiar-clave").css('display', 'none');
            var data = $("#frm-cambiar-clave").serialize();
            $.post("cambiar-clave", data, function (respuesta, estado, jqXHR){
                if(respuesta == '1'){
                    $("#mje_mod_clave").text("La clave se modifico correctamente");
                    $('#aceptar_mod_clave').unbind('click');
                    $("#aceptar_mod_clave").click(function () {
                        window.location = "login.jsp";
                    });
                    $("#mensaje_mod_clave").css('display','block');
                    setTimeout(function() {
                        window.location = "login.jsp";
                    },5000);
                }else if(respuesta == '0'){
                    $("#mje_mod_clave").text("Hubo un problema al modificar el usuario, por favor intenete nuevamente");
                    $('#aceptar_mod_clave').unbind('click');
                    $("#aceptar_mod_clave").click(function () {
                        $("#mensaje_mod_clave").css('display','none');
                        $("#card-cambiar-clave").css('display', 'block');
                    });
                    $("#mensaje_mod_clave").css('display','block');
                }
            });
        }
    });
});


$(function(){
    $("#frm-crear-cliente").validate({
        messages : {
            dni : {
                required : "Este campo es requerido",
                minlength : "Por favor ingrese almenos 8 caracteres",
                maxlength : "Este campo soporta hasta 8 caracteres"
            },
            nombre : {
                required : "Este campo es requerido",
                minlength : "Por favor ingrese almenos 2 caracteres",
                maxlength : "Este campo soporta hasta 25 caracteres"
            },
            apellido : {
                required : "Este campo es requerido",
                minlength : "Por favor ingrese almenos 2 caracteres",
                maxlength : "Este campo soporta hasta 25 caracteres"
            },
            fecha_nac : {
                required : "Este campo es requerido",
                minlength : "Por favor ingrese almenos 10 caracteres",
                maxlength : "Este campo soporta hasta 10 caracteres"
            },
            edad : {
                required : "Este campo es requerido",
                minlength : "Por favor ingrese almenos 1 caracteres",
                maxlength : "Este campo soporta hasta 3 caracteres"
            },
            nacionalidad : {
                required : "Este campo es requerido",
                minlength : "Por favor ingrese almenos 2 caracteres",
                maxlength : "Este campo soporta hasta 25 caracteres"
            },
            telefono : {
                required : "Este campo es requerido",
                minlength : "Por favor ingrese almenos 9 caracteres",
                maxlength : "Este campo soporta hasta 17 caracteres"
            }
        },
        errorElement: 'span',
        errorPlacement: function (error, element) {
            error.addClass('invalid-feedback');
            element.closest('.form-group').append(error);
        },
        highlight: function (element, errorClass, validClass) {
            $(element).addClass('is-invalid');
        },
        unhighlight: function (element, errorClass, validClass) {
            $(element).removeClass('is-invalid');
        },
        submitHandler: function (form){
            var data = $("#frm-crear-cliente").serialize();
            $.post("crear-cliente", data, function (respuesta, estado, jqXHR){
                $("#card-crear-cliente").css('display','none');
                if(respuesta == '0'){
                    $("#mje_crear_cli").text("Hubo un error al registrar el cliente, por favor intente nuevamente");
                    $('#aceptar_crear_cli').unbind('click');
                    $("#aceptar_crear_cli").click(function () {
                        $("#mensaje_crear_cliente").css('display','none');
                        $("#card-crear-cliente").css('display','block');
                    });
                    $("#mensaje_crear_cliente").css('display','block');
                }else if(respuesta == '1'){
                    $("#mje_crear_cli").text("Ya existe un cliente con ese DNI, por favor intente nuevamente ingresando otro DNI");
                    $('#aceptar_crear_cli').unbind('click');
                    $("#aceptar_crear_cli").click(function () {
                        $("#mensaje_crear_cliente").css('display','none');
                        $("#card-crear-cliente").css('display','block');
                    });
                    $("#mensaje_crear_cliente").css('display','block');
                }else if(respuesta == '2'){
                    $("#mje_crear_cli").text("El cliente se creo correctamente");
                    $('#aceptar_crear_cli').unbind('click');
                    $("#aceptar_crear_cli").click(function () {
                        window.location.reload();
                    });
                    $("#mensaje_crear_cliente").css('display','block');
                    setTimeout(function() {
                        window.location.reload();
                    },5000);
                }
            });
        }
    });
});

$(function(){
    $("#frm-modificar-cliente").validate({
        messages : {
            dni : {
                required : "Este campo es requerido",
                minlength : "Por favor ingrese almenos 8 caracteres",
                maxlength : "Este campo soporta hasta 8 caracteres"
            },
            nombre : {
                required : "Este campo es requerido",
                minlength : "Por favor ingrese almenos 2 caracteres",
                maxlength : "Este campo soporta hasta 25 caracteres"
            },
            apellido : {
                required : "Este campo es requerido",
                minlength : "Por favor ingrese almenos 2 caracteres",
                maxlength : "Este campo soporta hasta 25 caracteres"
            },
            fecha_nac : {
                required : "Este campo es requerido",
                minlength : "Por favor ingrese almenos 10 caracteres",
                maxlength : "Este campo soporta hasta 10 caracteres"
            },
            edad : {
                required : "Este campo es requerido",
                minlength : "Por favor ingrese almenos 1 caracteres",
                maxlength : "Este campo soporta hasta 3 caracteres"
            },
            nacionalidad : {
                required : "Este campo es requerido",
                minlength : "Por favor ingrese almenos 2 caracteres",
                maxlength : "Este campo soporta hasta 25 caracteres"
            },
            telefono : {
                required : "Este campo es requerido",
                minlength : "Por favor ingrese almenos 9 caracteres",
                maxlength : "Este campo soporta hasta 17 caracteres"
            }
        },
        errorElement: 'span',
        errorPlacement: function (error, element) {
            error.addClass('invalid-feedback');
            element.closest('.form-group').append(error);
        },
        highlight: function (element, errorClass, validClass) {
            $(element).addClass('is-invalid');
        },
        unhighlight: function (element, errorClass, validClass) {
            $(element).removeClass('is-invalid');
        },
        submitHandler: function (form){
            var data = $("#frm-modificar-cliente").serialize();
            $.post("modificar-cliente", data, function (respuesta, estado, jqXHR){
                $("#card-modificar-cliente").css('display','none');
                if(respuesta == '0'){
                    $("#mje_modificar_cli").text("Hubo un error al modificar el cliente, por favor intente nuevamente");
                    $('#aceptar_modificar_cli').unbind('click');
                    $("#aceptar_modificar_cli").click(function () {
                        $("#mensaje_modificar_cliente").css('display','none');
                        $("#card-modificar-cliente").css('display','block');
                    });
                    $("#mensaje_modificar_cliente").css('display','block');
                }else if(respuesta == '1'){
                    $("#mje_modificar_cli").text("El cliente se modifico correctamente");
                    $('#aceptar_modificar_cli').unbind('click');
                    $("#aceptar_modificar_cli").click(function () {
                        window.location.reload();
                    });
                    $("#mensaje_modificar_cliente").css('display','block');
                    setTimeout(function() {
                        window.location.reload();
                    },5000);
                }
            });
        }
    });
});

$(function(){
    $("#frm-baja-cliente").validate({
        submitHandler: function (form){
            data = $("#frm-baja-cliente").serialize();
            $.post("baja-cliente", data, function (respuesta, estado, jqXHR){
                $("#mensaje_baja_cliente").css("display", "none");
                if(respuesta == '0'){
                    $("#mje_conf_baja_cli").text("Hubo un problema al dar de baja el cliente, por favor intente nuevamente");
                    $("#mensaje_conf_baja_cliente").css("display", "none");
                }else if(respuesta == '1'){
                    $("#mje_conf_baja_cli").text("El cliente se dio de baja correctamente");
                    $("#mensaje_conf_baja_cliente").css("display", "block");
                }
            });
        }
    });
});

function modificarCliente(idCliente){
    $.post("obtener-cliente", {idCliente: idCliente}, function (respuesta, estado, jqXHR){
        if(respuesta == '1'){
            window.location = "modificar-cliente.jsp";
        }else{
            alert('0');
        }
    });
    
}

function bajaCliente(id, nombre, apellido){
    $("#mje_baja_cli").text("Esta seguro que desea dar de baja el cliente: " + apellido + ", " + nombre + "?");
    $("#id_baja_cliente").val(id);
    $("#tabla-clientes").css("display", "none");
    $("#mensaje_baja_cliente").css("display", "block");
}

$(function(){
    $("#frm-crear-servicio").validate({
        messages : {
            servicio : {
                required : "Este campo es requerido",
                minlength : "Por favor ingrese almenos 2 caracteres",
                maxlength : "Este campo soporta hasta 25 caracteres"
            },
            destino : {
                required : "Este campo es requerido",
                minlength : "Por favor ingrese almenos 2 caracteres",
                maxlength : "Este campo soporta hasta 25 caracteres"
            },
            precio : {
                required : "Este campo es requerido",
                minlength : "Por favor ingrese almenos 2 caracteres",
                maxlength : "Este campo soporta hasta 25 caracteres"
            },
            from_fecha : {
                required : "Este campo es requerido",
                minlength : "Por favor ingrese almenos 10 caracteres",
                maxlength : "Este campo soporta hasta 10 caracteres"
            },
            to_fecha : {
                required : "Este campo es requerido",
                minlength : "Por favor ingrese almenos 10 caracteres",
                maxlength : "Este campo soporta hasta 10 caracteres"
            },
            from_hora : {
                required : "Este campo es requerido",
                minlength : "Por favor ingrese almenos 5 caracteres",
                maxlength : "Este campo soporta hasta 5 caracteres"
            },
            to_hora : {
                required : "Este campo es requerido",
                minlength : "Por favor ingrese almenos 5 caracteres",
                maxlength : "Este campo soporta hasta 5 caracteres"
            }
        },
        errorElement: 'span',
        errorPlacement: function (error, element) {
            error.addClass('invalid-feedback');
            element.closest('.form-group').append(error);
        },
        highlight: function (element, errorClass, validClass) {
            $(element).addClass('is-invalid');
        },
        unhighlight: function (element, errorClass, validClass) {
            $(element).removeClass('is-invalid');
        },
        submitHandler: function (form){
            var data = $("#frm-crear-servicio").serialize();
            $.post("crear-servicio", data, function (respuesta, estado, jqXHR){
                $("#card-crear-servicio").css('display','none');
                if(respuesta == '0'){
                    $("#mje_crear_serv").text("Hubo un error al crear el servicio, por favor intente nuevamente");
                    $('#aceptar_crear_serv').unbind('click');
                    $("#aceptar_crear_serv").click(function () {
                        $("#mensaje_crear_servicio").css('display','none');
                        $("#card-crear-servicio").css('display','block');
                    });
                    $("#mensaje_crear_servicio").css('display','block');
                }else if(respuesta == '1'){
                    $("#mje_crear_serv").text("El servicio se creo correctamente");
                    $('#aceptar_crear_serv').unbind('click');
                    $("#aceptar_crear_serv").click(function () {
                        window.location.reload();
                    });
                    $("#mensaje_crear_servicio").css('display','block');
                    setTimeout(function() {
                        window.location.reload();
                    },5000);
                }
            });
        }
    });
});

$(function(){
    $("#frm-mod-servicio").validate({
        messages : {
            servicio : {
                required : "Este campo es requerido",
                minlength : "Por favor ingrese almenos 2 caracteres",
                maxlength : "Este campo soporta hasta 25 caracteres"
            },
            destino : {
                required : "Este campo es requerido",
                minlength : "Por favor ingrese almenos 2 caracteres",
                maxlength : "Este campo soporta hasta 25 caracteres"
            },
            precio : {
                required : "Este campo es requerido",
                minlength : "Por favor ingrese almenos 2 caracteres",
                maxlength : "Este campo soporta hasta 25 caracteres"
            },
            from_fecha : {
                required : "Este campo es requerido",
                minlength : "Por favor ingrese almenos 10 caracteres",
                maxlength : "Este campo soporta hasta 10 caracteres"
            },
            to_fecha : {
                required : "Este campo es requerido",
                minlength : "Por favor ingrese almenos 10 caracteres",
                maxlength : "Este campo soporta hasta 10 caracteres"
            },
            from_hora : {
                required : "Este campo es requerido",
                minlength : "Por favor ingrese almenos 5 caracteres",
                maxlength : "Este campo soporta hasta 5 caracteres"
            },
            to_hora : {
                required : "Este campo es requerido",
                minlength : "Por favor ingrese almenos 5 caracteres",
                maxlength : "Este campo soporta hasta 5 caracteres"
            }
        },
        errorElement: 'span',
        errorPlacement: function (error, element) {
            error.addClass('invalid-feedback');
            element.closest('.form-group').append(error);
        },
        highlight: function (element, errorClass, validClass) {
            $(element).addClass('is-invalid');
        },
        unhighlight: function (element, errorClass, validClass) {
            $(element).removeClass('is-invalid');
        },
        submitHandler: function (form){
            var data = $("#frm-mod-servicio").serialize();
            $.post("modificar-servicio", data, function (respuesta, estado, jqXHR){
                $("#card-mod-servicio").css('display','none');
                if(respuesta == '0'){
                    $("#mje_mod_serv").text("Hubo un error al modificar el servicio, por favor intente nuevamente");
                    $('#aceptar_mod_serv').unbind('click');
                    $("#aceptar_mod_serv").click(function () {
                        $("#mensaje_modificar_servicio").css('display','none');
                        $("#card-mod-servicio").css('display','block');
                    });
                    $("#mensaje_modificar_servicio").css('display','block');
                }else if(respuesta == '1'){
                    $("#mje_mod_serv").text("El servicio se modifico correctamente");
                    $('#aceptar_mod_serv').unbind('click');
                    $("#aceptar_mod_serv").click(function () {
                        window.location.reload();
                    });
                    $("#mensaje_modificar_servicio").css('display','block');
                    setTimeout(function() {
                        window.location.reload();
                    },5000);
                }
            });
        }
    });
});



function modificarServicio(id){
    $.post("obtener-servicio", {id: id}, function (respuesta, estado, jqXHR){
        if(respuesta == '1'){
            window.location = "modificar-servicio.jsp";
        }else{
            alert('0');
        }
    });
}

function bajaServicio(id, servicio, destino){
    $("#mje_baja_serv").text("Esta seguro que desea dar de baja el servicio: " + servicio + ", " + destino + "?");
    $("#id_baja_servicio").val(id);
    $("#tabla-servicios").css("display", "none");
    $("#mensaje_baja_servicio").css("display", "block");
}

$(function(){
    $("#frm-baja-servicio").validate({
        submitHandler: function (form){
            var data = $("#frm-baja-servicio").serialize();
            $.post("baja-servicio", data, function (respuesta, estado, jqXHR){
                $("#mensaje_baja_servicio").css("display", "none");
                if(respuesta == '0'){
                    $("#mje_conf_baja_serv").text("Hubo un problema al dar de baja el servicio, por favor intente nuevamente");
                    $("#mensaje_conf_baja_servicio").css("display", "none");
                }else if(respuesta == '1'){
                    $("#mje_conf_baja_serv").text("El servicio se dio de baja correctamente");
                    $("#mensaje_conf_baja_servicio").css("display", "block");
                }
            });
        }
    });
});

$(function(){
    $("#frm-crear-promocion").validate({
        messages : {
            promocion : {
                required : "Este campo es requerido",
                minlength : "Por favor ingrese almenos 2 caracteres",
                maxlength : "Este campo soporta hasta 25 caracteres"
            },
            descuento : {
                required : "Este campo es requerido",
                minlength : "Por favor ingrese almenos 2 caracteres",
                maxlength : "Este campo soporta hasta 25 caracteres"
            }
        },
        errorElement: 'span',
        errorPlacement: function (error, element) {
            error.addClass('invalid-feedback');
            element.closest('.form-group').append(error);
        },
        highlight: function (element, errorClass, validClass) {
            $(element).addClass('is-invalid');
        },
        unhighlight: function (element, errorClass, validClass) {
            $(element).removeClass('is-invalid');
        },
        submitHandler: function (form){
            var data = $("#frm-crear-promocion").serialize();
            $.post("crear-promocion", data, function (respuesta, estado, jqXHR){
                $("#card-crear-promocion").css('display','none');
                if(respuesta == '0'){
                    $("#mje_crear_prom").text("Hubo un error al crear la promocion, por favor intente nuevamente");
                    $('#aceptar_crear_prom').unbind('click');
                    $("#aceptar_crear_prom").click(function () {
                        $("#mensaje_crear_promocion").css('display','none');
                        $("#card-crear-promocion").css('display','block');
                    });
                    $("#mensaje_crear_promocion").css('display','block');
                }else if(respuesta == '1'){
                    $("#mje_crear_prom").text("La promocion se creo correctamente");
                    $('#aceptar_crear_prom').unbind('click');
                    $("#aceptar_crear_prom").click(function () {
                        window.location.reload();
                    });
                    $("#mensaje_crear_promocion").css('display','block');
                    setTimeout(function() {
                        window.location.reload();
                    },5000);
                }
            });
        }
    });
});

function modificarPromocion(id, promocion, descuento){
    $("#id_mod_prom").val(id);
    $("#modificar-promocion-prom").val(promocion);
    $("#modificar-promocion-descuento").val(descuento);
    $("#card-modificar-promocion").css('display', 'block');
}

$(function(){
    $("#frm-modificar-promocion").validate({
        messages : {
            promocion : {
                required : "Este campo es requerido",
                minlength : "Por favor ingrese almenos 2 caracteres",
                maxlength : "Este campo soporta hasta 25 caracteres"
            },
            descuento : {
                required : "Este campo es requerido",
                minlength : "Por favor ingrese almenos 2 caracteres",
                maxlength : "Este campo soporta hasta 25 caracteres"
            }
        },
        errorElement: 'span',
        errorPlacement: function (error, element) {
            error.addClass('invalid-feedback');
            element.closest('.form-group').append(error);
        },
        highlight: function (element, errorClass, validClass) {
            $(element).addClass('is-invalid');
        },
        unhighlight: function (element, errorClass, validClass) {
            $(element).removeClass('is-invalid');
        },
        submitHandler: function (form){
            var data = $("#frm-modificar-promocion").serialize();
            $.post("modificar-promocion", data, function (respuesta, estado, jqXHR){
                $("#card-modificar-promocion").css('display','none');
                if(respuesta == '0'){
                    $("#mje_mod_prom").text("Hubo un error al modificar la promocion, por favor intente nuevamente");
                    $('#aceptar_mod_prom').unbind('click');
                    $("#aceptar_mod_prom").click(function () {
                        $("#mensaje_modificar_promocion").css('display','none');
                        $("#card-modificar-promocion").css('display','block');
                    });
                    $("#mensaje_modificar_promocion").css('display','block');
                }else if(respuesta == '1'){
                    $("#mje_mod_prom").text("La promocion se modifico correctamente");
                    $('#aceptar_mod_prom').unbind('click');
                    $("#aceptar_mod_prom").click(function () {
                        window.location.reload();
                    });
                    $("#mensaje_modificar_promocion").css('display','block');
                    setTimeout(function() {
                        window.location.reload();
                    },5000);
                }
            });
        }
    });
});

function bajaPromocion(id, promocion){
    $("#mje_baja_prom").text("Esta seguro que desea dar de baja la promocion: " + promocion + "?");
    $("#id_baja_promocion").val(id);
    $("#datos_promociones").css("display", "none");
    $("#mensaje_baja_promocion").css("display", "block");
}

$(function(){
    $("#frm-baja-promocion").validate({
        submitHandler: function (form){
            var data = $("#frm-baja-promocion").serialize();
            $.post("baja-promocion", data, function (respuesta, estado, jqXHR){
                $("#mensaje_baja_promocion").css("display", "none");
                if(respuesta == '0'){
                    $("#mje_conf_baja_prom").text("Hubo un problema al dar de baja la promocion, por favor intente nuevamente");
                    $("#mensaje_conf_baja_promocion").css("display", "block");
                }else if(respuesta == '1'){
                    $("#mje_conf_baja_prom").text("La promocion se dio de baja correctamente");
                    $("#mensaje_conf_baja_promocion").css("display", "block");
                }
            });
        }
    });
});

$(function () {
    $('.select2').select2()
    $('.select2bs4').select2({
      theme: 'bootstrap4'
    })
    $('.duallistbox').bootstrapDualListbox()
    $('.my-colorpicker1').colorpicker()
    //color picker with addon
    $('.my-colorpicker2').colorpicker()

    $('.my-colorpicker2').on('colorpickerChange', function(event) {
      $('.my-colorpicker2 .fa-square').css('color', event.color.toString());
    });
    
});

$(function(){
    $("#frm-crear-paquete").validate({
        messages : {
            nombre : {
                required : "Este campo es requerido",
                minlength : "Por favor ingrese almenos 2 caracteres",
                maxlength : "Este campo soporta hasta 25 caracteres"
            },
            descripcion : {
                required : "Este campo es requerido",
                minlength : "Por favor ingrese almenos 2 caracteres",
                maxlength : "Este campo soporta hasta 50 caracteres"
            }
        },
        errorElement: 'span',
        errorPlacement: function (error, element) {
            error.addClass('invalid-feedback');
            element.closest('.form-group').append(error);
        },
        highlight: function (element, errorClass, validClass) {
            $(element).addClass('is-invalid');
        },
        unhighlight: function (element, errorClass, validClass) {
            $(element).removeClass('is-invalid');
        },
        submitHandler: function (form){
            var data = $("#frm-crear-paquete").serialize();
            $.post("crear-paquete", data, function (respuesta, estado, jqXHR){
                $("#card-crear-paquete").css('display','none');
                if(respuesta == '0'){
                    $("#mje_crear_paquete").text("Hubo un error al crear el paquete, por favor intente nuevamente");
                    $('#aceptar_crear_paquete').unbind('click');
                    $("#aceptar_crear_paquete").click(function () {
                        $("#mensaje_crear_paquete").css('display','none');
                        $("#card-crear-paquete").css('display','block');
                    });
                    $("#mensaje_crear_paquete").css('display','block');
                }else if(respuesta == '1'){
                    $("#mje_crear_paquete").text("El paquete se creo correctamente");
                    $('#aceptar_crear_paquete').unbind('click');
                    $("#aceptar_crear_paquete").click(function () {
                        window.location.reload();
                    });
                    $("#mensaje_crear_paquete").css('display','block');
                    setTimeout(function() {
                        window.location.reload();
                    },5000);
                }
            });
        }
    });
});

function modificarPaquete(id){
    $.post("obtener-paquete", {id: id}, function (respuesta, estado, jqXHR){
        if(respuesta == '1'){
            window.location = "modificar-paquete.jsp";
        }else{
            alert('0');
        }
    });
}

$(function(){
    $("#frm-modificar-paquete").validate({
        messages : {
            nombre : {
                required : "Este campo es requerido",
                minlength : "Por favor ingrese almenos 2 caracteres",
                maxlength : "Este campo soporta hasta 25 caracteres"
            },
            descripcion : {
                required : "Este campo es requerido",
                minlength : "Por favor ingrese almenos 2 caracteres",
                maxlength : "Este campo soporta hasta 50 caracteres"
            }
        },
        errorElement: 'span',
        errorPlacement: function (error, element) {
            error.addClass('invalid-feedback');
            element.closest('.form-group').append(error);
        },
        highlight: function (element, errorClass, validClass) {
            $(element).addClass('is-invalid');
        },
        unhighlight: function (element, errorClass, validClass) {
            $(element).removeClass('is-invalid');
        },
        submitHandler: function (form){
            var data = $("#frm-modificar-paquete").serialize();
            $.post("modificar-paquete", data, function (respuesta, estado, jqXHR){
                $("#card-modificar-paquete").css('display','none');
                if(respuesta == '0'){
                    $("#mje_mod_paquete").text("Hubo un error al modificar el paquete, por favor intente nuevamente");
                    $('#aceptar_mod_paquete').unbind('click');
                    $("#aceptar_mod_paquete").click(function () {
                        $("#mensaje_modificar_paquete").css('display','none');
                        $("#card-modificar-paquete").css('display','block');
                    });
                    $("#mensaje_modificar_paquete").css('display','block');
                }else if(respuesta == '1'){
                    $("#mje_mod_paquete").text("El paquete se modifico correctamente");
                    $('#aceptar_modificar_paquete').unbind('click');
                    $("#aceptar_modificar_paquete").click(function () {
                        window.location.reload();
                    });
                    $("#mensaje_modificar_paquete").css('display','block');
                    setTimeout(function() {
                        window.location.reload();
                    },5000);
                }
            });
        }
    });
});

function bajaPaquete(id, nombre){
    $("#mje_baja_paquete").text("Esta seguro que desea dar de baja el paquete: " + nombre + "?");
    $("#id_baja_paquete").val(id);
    $("#tabla-paquetes").css("display", "none");
    $("#mensaje_baja_paquete").css("display", "block");
}

$(function(){
    $("#frm-baja-paquete").validate({
        submitHandler: function (form){
            var data = $("#frm-baja-paquete").serialize();
            $.post("baja-paquete", data, function (respuesta, estado, jqXHR){
                $("#mensaje_baja_paquete").css("display", "none");
                if(respuesta == '0'){
                    $("#mje_conf_baja_paquete").text("Hubo un problema al dar de baja el paquete, por favor intente nuevamente");
                    $("#mensaje_conf_baja_paquete").css("display", "block");
                }else if(respuesta == '1'){
                    $("#mje_conf_baja_paquete").text("El paquete se dio de baja correctamente");
                    $("#mensaje_conf_baja_paquete").css("display", "block");
                }
            });
        }
    });
});

$(function(){
    $('input[type=radio][name=tipo]').change(function() {
        if(this.value == 'PAQUETE'){
            $("#seleccionar_servicio").css("display", "none");
            $("#seleccionar_paquete").css("display", "block");
        }else if(this.value == 'SERVICIO'){
            $("#seleccionar_paquete").css("display", "none");
            $("#seleccionar_servicio").css("display", "block");
        }
    });
});


$(function(){
    $("#frm-crear-reserva").validate({
        messages : {
            cliente : {
                required : "Por favor seleccione un Cliente",
            }
        },
        errorElement: 'span',
        errorPlacement: function (error, element) {
            error.addClass('invalid-feedback');
            element.closest('.form-group').append(error);
        },
        highlight: function (element, errorClass, validClass) {
            $(element).addClass('is-invalid');
        },
        unhighlight: function (element, errorClass, validClass) {
            $(element).removeClass('is-invalid');
        },
        submitHandler: function (form){
            var data = $("#frm-crear-reserva").serialize();
            $.post("crear-reserva", data, function (respuesta, estado, jqXHR){
                $("#card-crear-reserva").css('display','none');
                if(respuesta == '0'){
                    $("#mje_crear_res").text("Hubo un error alcrear la reserva, por favor intente nuevamente");
                    $('#aceptar_crear_res').unbind('click');
                    $("#aceptar_crear_res").click(function () {
                        $("#mensaje_crear_reserva").css('display','none');
                        $("#card-crear-reserva").css('display','block');
                    });
                    $("#mensaje_crear_reserva").css('display','block');
                }else if(respuesta == '1'){
                    $("#mje_crear_res").text("Primero debe elegir un Tipo");
                    $('#aceptar_crear_res').unbind('click');
                    $("#aceptar_crear_res").click(function () {
                        $("#mensaje_crear_reserva").css('display','none');
                        $("#card-crear-reserva").css('display','block');
                    });
                    $("#mensaje_crear_reserva").css('display','block');
                }else if(respuesta == '2'){
                    $("#mje_crear_res").text("La reserva se creo correctamente");
                    $('#aceptar_crear_res').unbind('click');
                    $("#aceptar_crear_res").click(function () {
                        window.location.reload();
                    });
                    $("#mensaje_crear_reserva").css('display','block');
                    setTimeout(function() {
                        window.location.reload();
                    },5000);
                }
            });
        }
    });
});

function confirmar(id_reserva, precio_total){
    $("#reservas-confirmar-id").val(id_reserva);
    var pago = precio_total * 0.15;
    $("#reserva-confirmar-pago").val(pago);
    pago = pago - pago*0.10;
    $("#conf-pago").html(pago.toFixed(2))
    $("#card-reservas").css("display", "none");
    $("#modal-confirmar").css("display", "block");
}

$(function(){
    $("#medio_pago_confirmar").change(function(){
        var pago = parseFloat($("#reserva-confirmar-pago").val());
        if($("#medio_pago_confirmar option:selected").val() == "EFECTIVO"){
            pago = pago - pago*0.10;
        }else if($("#medio_pago_confirmar option:selected").val() == "TARJETA_CREDITO"){
            pago = pago + pago*0.06;
        }
        $("#conf-pago").html(pago.toFixed(2));
    });
});

$(function(){
    $("#frm-reservas-confirmar").validate({
        messages : {
            medio_pago : {
                required : "Por favor seleccione un medio de pago",
            }
        },
        errorElement: 'span',
        errorPlacement: function (error, element) {
            error.addClass('invalid-feedback');
            element.closest('.form-group').append(error);
        },
        highlight: function (element, errorClass, validClass) {
            $(element).addClass('is-invalid');
        },
        unhighlight: function (element, errorClass, validClass) {
            $(element).removeClass('is-invalid');
        },
        submitHandler: function (form){
            var data = $("#frm-reservas-confirmar").serialize();alert(data);
            $.post("confirmar-reserva", data, function (respuesta, estado, jqXHR){
                $("#modal-confirmar").css('display','none');
                $("#titulo-mje").text("Confirmar Reserva");
                if(respuesta == '0'){
                    $("#mje_reserva").text("Hubo un error al confirmar la reserva, por favor intente nuevamente");
                    $('#aceptar_reserva').unbind('click');
                    $("#aceptar_reserva").click(function () {
                        $("#mensaje_reserva").css('display','none');
                        $("#card-reservas").css('display','block');
                    });
                    $("#mensaje_reserva").css('display','block');
                }else if(respuesta == '1'){
                    $("#mje_reserva").text("La reserva se confirmo correctamente");
                    $('#aceptar_reserva').unbind('click');
                    $("#aceptar_reserva").click(function () {
                        window.location.reload();
                    });
                    $("#mensaje_reserva").css('display','block');
                    setTimeout(function() {
                        window.location.reload();
                    },5000);
                }
            });
        }
    });
});

$(function(){
    $('select#bootstrap-duallistbox-nonselected-list_servicios').change(function(){
        var html1 = $('.box1>.info-container>.info').html();
        if(html1.indexOf("<span style=\"font-weight: bold; font-size: 1.3em;\">No Seleccionados: </span>")<0)
            $('.box1>.info-container>.info').html("<span style=\"font-weight: bold; font-size: 1.3em;\">No Seleccionados: </span>" + html1);
        var html2 = $('.box2>.info-container>.info').html();
        if(html2.indexOf("<span style=\"font-weight: bold; font-size: 1.3em;\">Seleccionados: </span>")<0)
            $('.box2>.info-container>.info').html("<span style=\"font-weight: bold; font-size: 1.3em;\">Seleccionados: </span>" + html2);
    });
    $('select#bootstrap-duallistbox-selected-list_servicios').change(function(){
        var html2 = $('.box2>.info-container>.info').html();
        if(html2.indexOf("<span style=\"font-weight: bold; font-size: 1.3em;\">Seleccionados: </span>")<0)
            $('.box2>.info-container>.info').html("<span style=\"font-weight: bold; font-size: 1.3em;\">Seleccionados: </span>" + html2);
        var html1 = $('.box1>.info-container>.info').html();
        if(html1.indexOf("<span style=\"font-weight: bold; font-size: 1.3em;\">No Seleccionados: </span>")<0)
            $('.box1>.info-container>.info').html("<span style=\"font-weight: bold; font-size: 1.3em;\">No Seleccionados: </span>" + html1);
    });
    $('select#bootstrap-duallistbox-selected-list_servicios').click(function(){
        var html2 = $('.box2>.info-container>.info').html();
        if(html2.indexOf("<span style=\"font-weight: bold; font-size: 1.3em;\">Seleccionados: </span>")<0)
            $('.box2>.info-container>.info').html("<span style=\"font-weight: bold; font-size: 1.3em;\">Seleccionados: </span>" + html2);
        var html1 = $('.box1>.info-container>.info').html();
        if(html1.indexOf("<span style=\"font-weight: bold; font-size: 1.3em;\">No Seleccionados: </span>")<0)
            $('.box1>.info-container>.info').html("<span style=\"font-weight: bold; font-size: 1.3em;\">No Seleccionados: </span>" + html1);
    });
    $('select#bootstrap-duallistbox-nonselected-list_servicios').click(function(){
        var html1 = $('.box1>.info-container>.info').html();
        if(html1.indexOf("<span style=\"font-weight: bold; font-size: 1.3em;\">No Seleccionados: </span>")<0)
            $('.box1>.info-container>.info').html("<span style=\"font-weight: bold; font-size: 1.3em;\">No Seleccionados: </span>" + html1);
        var html2 = $('.box2>.info-container>.info').html();
        if(html2.indexOf("<span style=\"font-weight: bold; font-size: 1.3em;\">Seleccionados: </span>")<0)
            $('.box2>.info-container>.info').html("<span style=\"font-weight: bold; font-size: 1.3em;\">Seleccionados: </span>" + html2);
    });
    $('button.removeall').click(function(){
        var html1 = $('.box1>.info-container>.info').html();
        if(html1.indexOf("<span style=\"font-weight: bold; font-size: 1.3em;\">No Seleccionados: </span>")<0)
            $('.box1>.info-container>.info').html("<span style=\"font-weight: bold; font-size: 1.3em;\">No Seleccionados: </span>" + html1);
        var html2 = $('.box2>.info-container>.info').html();
        if(html2.indexOf("<span style=\"font-weight: bold; font-size: 1.3em;\">Seleccionados: </span>")<0)
            $('.box2>.info-container>.info').html("<span style=\"font-weight: bold; font-size: 1.3em;\">Seleccionados: </span>" + html2);
    });
    $('button.moveall').click(function(){
        var html1 = $('.box1>.info-container>.info').html();
        if(html1.indexOf("<span style=\"font-weight: bold; font-size: 1.3em;\">No Seleccionados: </span>")<0)
            $('.box1>.info-container>.info').html("<span style=\"font-weight: bold; font-size: 1.3em;\">No Seleccionados: </span>" + html1);
        var html2 = $('.box2>.info-container>.info').html();
        if(html2.indexOf("<span style=\"font-weight: bold; font-size: 1.3em;\">Seleccionados: </span>")<0)
            $('.box2>.info-container>.info').html("<span style=\"font-weight: bold; font-size: 1.3em;\">Seleccionados: </span>" + html2);
    });
    var html = $('.box1>.info-container>.info').html();
    $('.box1>.info-container>.info').html("<span style=\"font-weight: bold; font-size: 1.3em;\">No Seleccionados: </span>" + html);
    var html = $('.box2>.info-container>.info').html();
    $('.box2>.info-container>.info').html("<span style=\"font-weight: bold; font-size: 1.3em;\">Seleccionados: </span>" + html);
    
});


function finalizarPago(id, precio_total, adelanto){
    var pago = precio_total - adelanto;
    $("#reserva-finalizar-pago").val(pago);
    pago = pago - pago*0.10;
    $("#fin-pago").html(pago.toFixed(2));
    $("#reserva-finalizar-id").val(id);
    $("#card-reservas").css("display", "none");
    $("#modal-finalizar").css("display", "block");
}

$(function(){
    $("#medio_pago_finalizar").change(function(){
        var pago = parseFloat($("#reserva-finalizar-pago").val());
        if($("#medio_pago_finalizar option:selected").val() == "EFECTIVO"){
            pago = pago - pago*0.10;
        }else if($("#medio_pago_finalizar option:selected").val() == "TARJETA_CREDITO"){
            pago = pago + pago*0.06;
        }
        $("#fin-pago").html(pago.toFixed(2));
    });
});


$(function(){
    $("#frm-finalizar-pago").validate({
        messages : {
            medio_pago : {
                required : "Por favor seleccione un medio de pago",
            }
        },
        errorElement: 'span',
        errorPlacement: function (error, element) {
            error.addClass('invalid-feedback');
            element.closest('.form-group').append(error);
        },
        highlight: function (element, errorClass, validClass) {
            $(element).addClass('is-invalid');
        },
        unhighlight: function (element, errorClass, validClass) {
            $(element).removeClass('is-invalid');
        },
        submitHandler: function (form){
            var data = $("#frm-finalizar-pago").serialize();
            $.post("finalizar-pago", data, function (respuesta, estado, jqXHR){
                $("#modal-finalizar").css('display','none');
                $("#titulo-mje").text("Finalizar Reserva");
                if(respuesta == '0'){
                    $("#mje_reserva").text("Hubo un error al finalizar el pago, por favor intente nuevamente");
                    $('#aceptar_reserva').unbind('click');
                    $("#aceptar_reserva").click(function () {
                        $("#mensaje_reserva").css('display','none');
                        $("#card-reservas").css('display','block');
                    });
                    $("#mensaje_reserva").css('display','block');
                }else if(respuesta == '1'){
                    $("#mje_reserva").text("El pago se finalizo correctamente");
                    $('#aceptar_reserva').unbind('click');
                    $("#aceptar_reserva").click(function () {
                        window.location.reload();
                    });
                    $("#mensaje_reserva").css('display','block');
                    setTimeout(function() {
                        window.location.reload();
                    },5000);
                }
            });
        }
    });
});

function rechazarReserva(id){
    $("#reserva-rechazar-id").val(id);
    $("#card-reservas").css("display", "none");
    $("#modal-rechazar").css("display", "block");
}

$(function(){
    $("#frm-rechazar-reserva").validate({
        errorElement: 'span',
        errorPlacement: function (error, element) {
            error.addClass('invalid-feedback');
            element.closest('.form-group').append(error);
        },
        highlight: function (element, errorClass, validClass) {
            $(element).addClass('is-invalid');
        },
        unhighlight: function (element, errorClass, validClass) {
            $(element).removeClass('is-invalid');
        },
        submitHandler: function (form){
            var data = $("#frm-rechazar-reserva").serialize();
            $.post("rechazar-reserva", data, function (respuesta, estado, jqXHR){
                $("#modal-rechazar").css('display','none');
                $("#titulo-mje").text("Rechazar Reserva");
                if(respuesta == '0'){
                    $("#mje_reserva").text("Hubo un error al rechazar la reserva, por favor intente nuevamente");
                    $('#aceptar_reserva').unbind('click');
                    $("#aceptar_reserva").click(function () {
                        $("#mensaje_reserva").css('display','none');
                        $("#card-reservas").css('display','block');
                    });
                    $("#mensaje_reserva").css('display','block');
                }else if(respuesta == '1'){
                    $("#mje_reserva").text("La reserva se rechazo correctamente");
                    $('#aceptar_reserva').unbind('click');
                    $("#aceptar_reserva").click(function () {
                        window.location.reload();
                    });
                    $("#mensaje_reserva").css('display','block');
                    setTimeout(function() {
                        window.location.reload();
                    },5000);
                }
            });
        }
    });
});

function cancelarReserva(id){
    $("#reserva-cancelar-id").val(id);
    $("#card-reservas").css("display", "none");
    $("#modal-cancelar").css("display", "block");
}

$(function(){
    $("#frm-cancelar-reserva").validate({
        errorElement: 'span',
        errorPlacement: function (error, element) {
            error.addClass('invalid-feedback');
            element.closest('.form-group').append(error);
        },
        highlight: function (element, errorClass, validClass) {
            $(element).addClass('is-invalid');
        },
        unhighlight: function (element, errorClass, validClass) {
            $(element).removeClass('is-invalid');
        },
        submitHandler: function (form){
            var data = $("#frm-cancelar-reserva").serialize();
            $.post("cancelar-reserva", data, function (respuesta, estado, jqXHR){
                $("#modal-cancelar").css('display','none');
                $("#titulo-mje").text("Cancelar Reserva");
                if(respuesta == '0'){
                    $("#mje_reserva").text("Hubo un error al cancelar la reserva, por favor intente nuevamente");
                    $('#aceptar_reserva').unbind('click');
                    $("#aceptar_reserva").click(function () {
                        $("#mensaje_reserva").css('display','none');
                        $("#card-reservas").css('display','block');
                    });
                    $("#mensaje_reserva").css('display','block');
                }else if(respuesta == '1'){
                    $("#mje_reserva").text("La reserva se cancelo correctamente");
                    $('#aceptar_reserva').unbind('click');
                    $("#aceptar_reserva").click(function () {
                        window.location.reload();
                    });
                    $("#mensaje_reserva").css('display','block');
                    setTimeout(function() {
                        window.location.reload();
                    },5000);
                }
            });
        }
    });
});

function bajaReserva(id){
    $("#reserva-baja-id").val(id);
    $("#card-reservas").css("display", "none");
    $("#modal-baja").css("display", "block");
}

$(function(){
    $("#frm-baja-reserva").validate({
        errorElement: 'span',
        errorPlacement: function (error, element) {
            error.addClass('invalid-feedback');
            element.closest('.form-group').append(error);
        },
        highlight: function (element, errorClass, validClass) {
            $(element).addClass('is-invalid');
        },
        unhighlight: function (element, errorClass, validClass) {
            $(element).removeClass('is-invalid');
        },
        submitHandler: function (form){
            var data = $("#frm-baja-reserva").serialize();
            $.post("baja-reserva", data, function (respuesta, estado, jqXHR){
                $("#modal-baja").css('display','none');
                $("#titulo-mje").text("Baja Reserva");
                if(respuesta == '0'){
                    $("#mje_reserva").text("Hubo un error al dar de Baja la Reserva, por favor intente nuevamente");
                    $('#aceptar_reserva').unbind('click');
                    $("#aceptar_reserva").click(function () {
                        $("#mensaje_reserva").css('display','none');
                        $("#card-reservas").css('display','block');
                    });
                    $("#mensaje_reserva").css('display','block');
                }else if(respuesta == '1'){
                    $("#mje_reserva").text("La reserva se dio de baja correctamente");
                    $('#aceptar_reserva').unbind('click');
                    $("#aceptar_reserva").click(function () {
                        window.location.reload();
                    });
                    $("#mensaje_reserva").css('display','block');
                    setTimeout(function() {
                        window.location.reload();
                    },5000);
                }
            });
        }
    });
});

$(function () {
    $('#tabla-reservas').dataTable({
      "paging": true,
      "lengthChange": true,
      "searching": true,
      "ordering": true,
      "info": true,
      "autoWidth": true,
      "lengthMenu": [[3, 5, 10, 25, 50, -1], [3, 5, 10, 25, 50, "All"]]
    });
});

$(function () {
    $('#tabla-clientes').dataTable({
      "paging": true,
      "lengthChange": true,
      "searching": true,
      "ordering": true,
      "info": true,
      "autoWidth": true,
      "lengthMenu": [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]]
    });
});

$(function () {
    $('#tabla-servicios').dataTable({
      "paging": true,
      "lengthChange": true,
      "searching": true,
      "ordering": true,
      "info": true,
      "autoWidth": true,
      "lengthMenu": [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]]
    });
});

$(function () {
    $('#tabla-paquetes').dataTable({
      "paging": true,
      "lengthChange": true,
      "searching": true,
      "ordering": true,
      "info": true,
      "autoWidth": true,
      "lengthMenu": [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]]
    });
});

$(function () {
    $('#tabla-promociones').dataTable({
      "paging": true,
      "lengthChange": true,
      "searching": true,
      "ordering": true,
      "info": true,
      "autoWidth": true,
      "lengthMenu": [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]]
    });
});



