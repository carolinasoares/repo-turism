/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.53
 * Generated at: 2020-02-04 07:44:10 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

final java.lang.String _jspx_method = request.getMethod();
if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
return;
}

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

    HttpSession sesion = request.getSession(true);
    Object u = sesion.getAttribute("nombre_usuario") == null ? null : sesion.getAttribute("nombre_usuario");
    if(u != null){
        response.sendRedirect("home.jsp");
    }

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        \n");
      out.write("        <script src=\"bootstrap/js/jquery-3.3.1.slim.min.js\" type=\"text/javascript\"></script>\n");
      out.write("        <script src=\"bootstrap/js/popper.min.js\" type=\"text/javascript\"></script>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link href=\"bootstrap/css/bootstrap-grid.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link href=\"bootstrap/css/bootstrap-reboot.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link href=\"bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        \n");
      out.write("        <script src=\"bootstrap/js/bootstrap.bundle.min.js\" type=\"text/javascript\"></script>\n");
      out.write("        <script src=\"bootstrap/js/bootstrap.min.js\" type=\"text/javascript\"></script>\n");
      out.write("        \n");
      out.write("        <link href=\"css/estilos-login.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <script src=\"js/jquery-3.1.1.min.js\" type=\"text/javascript\"></script>\n");
      out.write("        <script src=\"js/jquery.validate.min.js\" type=\"text/javascript\"></script>\n");
      out.write("        <script src=\"js/additional-methods.min.js\" type=\"text/javascript\"></script>\n");
      out.write("        <script src=\"js/login_main.js\" type=\"text/javascript\"></script>\n");
      out.write("        \n");
      out.write("        <title>Index</title>\n");
      out.write("        \n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <header>\n");
      out.write("            \n");
      out.write("        </header>\n");
      out.write("        <main>\n");
      out.write("            <div class=\"container col-lg-3\" id=\"login_panel\">\n");
      out.write("                <h1>BIENVENIDO AL SISTEMA DEPOSITO</h1>\n");
      out.write("                <br><br>\n");
      out.write("                <form method=\"POST\" id=\"frm-login\" action=\"login\">\n");
      out.write("                    <div class=\"form-group\">\n");
      out.write("                        <p><strong>INICIE SESION</strong></p>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"form-group error\" style=\"display: none; height: 0px;\" id=\"error_login\">\n");
      out.write("                        <p>Credenciales incorrectas, por favor intente nuevamente.</p>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"form-group\">\n");
      out.write("                        <label for=\"nombre_usuario\">Nombre de Usuario:</label>\n");
      out.write("                        <input class=\"form-control\" type=\"text\" name=\"nombre_usuario\" id=\"nombre_usuario\" placeholder=\"Ingrese nombre de usaurio\" maxlength=\"12\" minlength=\"4\" style=\"border-width: 2px; border-style: solid; border-color: yellow;\" required/>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"form-group\">\n");
      out.write("                        <label for=\"clave_usuario\">Clave de Acceso:</label>\n");
      out.write("                        <input class=\"form-control\" type=\"password\" name=\"clave_usuario\" id=\"clave_usuario\" placeholder=\"Ingrese la clave de acceso\" maxlength=\"8\" minlength=\"4\" style=\"border-width: 2px; border-style: solid; border-color: yellow;\" required/>\n");
      out.write("                    </div>\n");
      out.write("                    <input class=\"btn btn-danger btn-block\" type=\"submit\" name=\"accion\" value=\"Ingresar\" title=\"Inicie Sesion\"/>\n");
      out.write("                </form>\n");
      out.write("                <br><br>\n");
      out.write("                <form action=\"registrar_usuario.jsp\">\n");
      out.write("                    <div class=\"form-group\">\n");
      out.write("                        <label>Si no esta registrado, registrese:</label>\n");
      out.write("                        <input class=\"btn btn-danger btn-block\" type=\"submit\" name=\"registrarse\" value=\"Registrar Usuario\" title=\"Ir a Registrar Usuario\"/>\n");
      out.write("                    </div>\n");
      out.write("                </form>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"container col-lg-3\" id=\"login_exitoso\" style=\"display: none; height: 0px;\">\n");
      out.write("                <h1>LOGIN EXITOSO</h1>\n");
      out.write("                <div style=\"height: 50px;\"></div>\n");
      out.write("                <h1>BIENVENIDO AL SISTEMA DEPOSITO</h1>\n");
      out.write("                <div style=\"height: 50px;\"></div>\n");
      out.write("                <p><strong>Haga click en ACEPTAR y sera redireccionado a la pantalla principal</strong></p>\n");
      out.write("                <button class=\"btn btn-danger btn-block\" onclick=\"window.location = 'home.jsp';\">\n");
      out.write("                    ACEPTAR\n");
      out.write("                </button>\n");
      out.write("            </div>\n");
      out.write("        </main>\n");
      out.write("        \n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}