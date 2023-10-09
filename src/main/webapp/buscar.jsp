<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <title>Buscador de medios online!</title>
  </head>
  <body>
    <%
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    %>
    <div class="container">
      <nav class="navbar navbar-light bg-light">
        <a class="navbar-brand"> </a>
      </nav>
      <div class="row mt-2">
        <div class="col-sm">
          <form action="buscar.jsp" method="get">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th scope="col">
                    <a href="index.jsp"><i class="fa fa-home" aria-hidden="true"></i></a>
                  </th>
                  <th scope="col" class="text-center"></th>
                  <th scope="col" class="text-center">
                    <input type="text" name="articulo" class="form-control" placeholder="Buscar por articulos o contenido multimedia"/>
                  </th>
                  <th scope="col" class="text-center">
                    <input type="submit" value="Buscar" name="buscar" class="form-control btn btn-primary" />
                  </th>
                  <th></th>

                </tr>
                <tr>
                  <th scope="col">ID</th>
                  <th scope="col">Articulo</th>
                  <th scope="col">Link</th>
                  <th scope="col">Acciones</th>
                </tr>
              </thead>
              <tbody>
                <%
  try {
      Class.forName("com.mysql.jdbc.Driver");
      con = DriverManager.getConnection("jdbc:mysql://localhost/proyecto?articulos=rlmz93&password=213840950");
      st = con.createStatement();
            String query = "SELECT * FROM articulos WHERE articulo LIKE ?";
            PreparedStatement ps = con.prepareStatement(query);
            String articulo=request.getParameter("articulo");
            ps.setString(1, "%" + articulo + "%");
            rs = ps.executeQuery();
                  while (rs.next()) {
                %>
                <tr>
                  <th scope="row"><%= rs.getString(1)%></th>
                  <td><%= rs.getString(2)%></td>
                  <td><a href="<%= rs.getString(3)%>"><%= rs.getString(3)%></a></td>
                  <!-- <td><%= rs.getString(3)%></td> -->
                  <td>
                    <a href="buscar.jsp" class="ml-1"><i class="fa fa-trash" aria-hidden="true"></i></a>
                  </td>
                </tr>

                <%
                        }
                    } 
                    catch (Exception e) {
                        out.print("error mysql "+e);
                    }
                %>
              </tbody>
            </table>
          </form>
        </div>
      </div>
    </div>
  </body>
</html>