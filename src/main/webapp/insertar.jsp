<%-- 
    Document   : register
    Created on : 4 abr. 2023, 19:55:50
    Author     : rlmz93
--%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <title>Editar empleado</title>
    </head>
    <body>
        <%
            String id = request.getParameter("id");
            String email = request.getParameter("email");
            String  pago = request.getParameter("pago");
            
        %>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <form action="insertar.jsp" method="post">
                        
                        <div class="form-group">
                            <label>Email</label>
                            <input type="text" class="form-control" value="<%= email%>"  name="email">
                        </div>
                        <div class="form-group">
                            <label>Pago</label>
                            <input type="text" class="form-control" value="<%= pago%>"  name="pago" placeholder="Telefono">
                        </div>
                        <a href="index.jsp" class="btn btn-danger">Cancelar <i class="fa fa-ban" aria-hidden="true"></i></a>
                        <button type="submit" name="enviar" class="btn btn-primary">Guardar <i class="fa fa-floppy-o" aria-hidden="true"></i></button>
                        <input type="hidden" name="id" value="<%= id%>" >
                    </form>

                </div>
            </div>
        </div>
        <%
            if (request.getParameter("enviar") != null) {
                try {
                    Connection con = null;
                    Statement st = null;
                    Class.forName("com.mysql.jdbc.Driver");
                    // recordar que en las conexiones se empieza por el driver:basededatos//"direccion de la base de datos" localhost/nombre de la base de datos
                    con = DriverManager.getConnection("jdbc:mysql://localhost/proyecto?user=rlmz93&password=213840950");
                    st = con.createStatement();
                    st.executeUpdate("update user set id='" + id + "',email='" + email + "',pago='" + pago + "' where id='"+id+"';");
                    request.getRequestDispatcher("datosUsuarios.jsp").forward(request, response);
                    // Requeste redireccionar la pagina a donde quiera 
                } catch (Exception e) {
                    out.print(e);
                }
            }
        %>
    </body>
</html>