<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*, Utils.Encriptar" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Iniciar Sesión</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
      integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
      crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
  </head>
  <body>
    <header>
      <h1>Iniciar Sesión</h1>
      <nav>
        <ul>
          <li><a href="index.jsp">Home</a></li>
          <li><a href="register.jsp">Registro</a></li>
          <li><a href="logout.jsp"><% if (session.getAttribute("email") != null) { out.print("Salir"); } %></a></li>
          <li><a><% if (session.getAttribute("email") != null) { out.print(session.getAttribute("email")); } %></a></li>
        </ul>
      </nav>
    </header>
    <main>
      <h2>Login</h2>
      <form method="post" action="login.jsp">
        <label>Email:</label>
        <input type="email" name="email" required>
        <label>Password:</label>
        <input type="password" name="password" required>
        <button type="submit" name="login">Login</button>
        <label> </label>
      </form>
      <% 
        if (request.getParameter("login") != null) {
          String email = request.getParameter("email");
          String password = request.getParameter("password");
          Encriptar enc = new Encriptar();
          try {
            // Prepared stament XXX sql injection
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/proyecto?user=rlmz93&password=213840950");
            PreparedStatement ps = con.prepareStatement("SELECT * FROM user WHERE email=? AND password1=? AND pago='SI'");
            ps.setString(1, email);
            ps.setString(2, enc.getMD5(password));
            ResultSet rs = ps.executeQuery();

           if (rs.next()) {
           // rolex para referirnos...
    String rol = rs.getString("rolex");
    if (rol.equals("dictador")) {
        response.sendRedirect("datosUsuarios.jsp");
    } else {
        response.sendRedirect("premiumPost.jsp");
    }
    session.setAttribute("logueado", "1");
    session.setAttribute("email", rs.getString("email"));
    session.setAttribute("id", rs.getString("id"));
} else {
    out.print("<div class=\"alert alert-dark\" role=\"alert\">Usuario no válido</div>");
}

          } catch (SQLException | ClassNotFoundException e) {
            out.print("<div class=\"alert alert-danger\" role=\"alert\">Error: " + e.getMessage() + "</div>");
          }
        }
      %>
    </main>
    <footer>
      <p>&copy; 2023 My Blog</p
