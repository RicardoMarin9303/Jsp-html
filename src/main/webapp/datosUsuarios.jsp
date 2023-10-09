<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

  <head>
    <title>Administrador de B.D</title>
    <link rel="stylesheet" type="text/css" href="style.css">
  </head>
  <body>
    <header>
      <h1>BIENVENIDO</h1>
      <nav>
        <ul>
          <li><a href="logout.jsp">Salir</a></li>
          </ul>
      </nav>
    </header>
  <body>
    <%
              HttpSession sesion = request.getSession();
              if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")) {
                  response.sendRedirect("login.jsp");
              }
            
    %>
    <%
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
    %>
    <!-- Construimos el cuerpo de nuestra base de datos, vinvulada, aqui damos espacios con
    container columnas, etc -->
    <div class="container mt-5">
      <div class="row">
        <div class="col-sm">
          <table class="table table-striped">
            <thead>
              <tr>
                <!-- Realizar todas las columnas correspondientes a la base de datos, en este caso 4 -->
                <th scope="col">ID</th>
                <th scope="col">Nombre</th>
                <th scope="col">Email</th>
                <th scope="col">Password</th>
                <th scope="col">Pago?</th>
                <th scope="col">Acciones</th>
                <th scope="col">Acceso?</th>
              </tr>
            </thead>
            <tbody>
              <%
                               try {
                                   Class.forName("com.mysql.jdbc.Driver");
                                   con = DriverManager.getConnection("jdbc:mysql://localhost/proyecto?user=rlmz93&password=213840950");
                                   st = con.createStatement();
                                   rs = st.executeQuery("SELECT * FROM `user`;");
                                   while (rs.next()) {
              %>
              <tr>
                <th scope="row"><%= rs.getString(1)%></th>
                <td><%= rs.getString(2)%></td>
                <td><%= rs.getString(3)%></td>
                <td><%= rs.getString(4)%></td>
                <td> <div class="form-check form-switch">
                    <input class="form-check-input" type="checkbox">
                    <label class="form-check-label" for="flexSwitchCheckDefault"> </label>
                  </div> </td>
                  <td> <a href="insertar.jsp?id=<%= rs.getString(1)%>&email=<%= rs.getString(3)%>&pago=<%= rs.getString(5)%>" class="ml-1"><i class="fa fa-address-book" aria-hidden="true"></i></a>
                    <%
                    //  
                    
                    %>
                  <a href="borrar.jsp?id=<%= rs.getString(1)%>" class="ml-1"><i class="fa fa-trash" aria-hidden="true"></i></a>
                  </td>
                  <td><%= rs.getString(5)%></td>
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
        </div>
      </div>
    </div>
    <footer>
      <p>&copy; 2023 My Blog</p>
    </footer>
  </body>
</html>