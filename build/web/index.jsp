<%-- 
    Document   : index
    Created on : 06/02/2020, 19:25:41
    Author     : Caro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    HttpSession sesion = request.getSession(true);
    Object u = sesion.getAttribute("nombre_usuario") == null ? null : sesion.getAttribute("nombre_usuario");
    if(u != null){
        response.sendRedirect("home.jsp");
    }else{
        response.sendRedirect("login.jsp");
    }
%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
