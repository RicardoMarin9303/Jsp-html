<%-- 
    Document   : register
    Created on : 4 abr. 2023, 19:55:50
    Author     : rlmz93
--%>
<%@page import="Utils.Encriptar" %>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" type="text/css" href="style.css">
  <head>
    <title>Registro</title>
  </head>
  <body>
    <% 
     Connection con=null;
     Statement st=null;
     Encriptar enc=new Encriptar();
                    %>
    <header>
      <h1>Registro</h1>
      <nav>
        <ul>
          <li><a href="index.jsp">Home</a></li>
        </ul>
      </nav>
    </header>
    <main>
  <h2>Registro</h2>
  <form action="register.jsp" method="post">
    <label>Nombre:</label>
    <input type="text" name="nombre" required>

    <label>Apellido:</label>
    <input type="text" name="apellido">

    <label>Email:</label>
    <input type="email" name="email" required>

    <label>Password:</label>
    <input type="password" name="password1" required pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{1,12}$" title="La contraseña debe tener al menos 1 letra, 1 número, 1 símbolo y una longitud máxima de 12 caracteres.">

    <label>Repita su password:</label>
    <input type="password" name="password2" required>

    <label>Ingrese aqui los datos de su deposito/transferencia:</label>
    <input type="text" name="datos">

    <button type="submit" name="registrar">Registrar</button>
  </form>
  <% 
        if (request.getParameter("registrar") != null) {
            String nombre = request.getParameter("nombre");
            String email = request.getParameter("email");
            String password1 = request.getParameter("password1");
            String password2 = request.getParameter("password2");

            if(password1.equals(password2)){
              try {
                  Class.forName("com.mysql.jdbc.Driver");
                  con=DriverManager.getConnection("jdbc:mysql://localhost/proyecto?user=rlmz93&password=213840950");
                  st=con.createStatement();
                  PreparedStatement ps = con.prepareStatement("INSERT INTO user (nombre,email,password1) VALUES (?, ?, ?)");
                          ps.setString(1, nombre);
                          ps.setString(2, email);
                          ps.setString(3, enc.getMD5(password1));
                          ps.executeUpdate(); 
                  
                  request.getRequestDispatcher("index.jsp").forward(request, response);
              } catch (Exception e) {
                  out.print(e);
              }
            }
            else{
              out.println("<p style='color:red'>Las contraseñas no coinciden</p>");
            }
        }
    %>
</main>
    <footer>
      <p>&copy; 2023 My Blog</p>
    </footer>
  </body>
</html>
