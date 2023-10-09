
<!DOCTYPE html>
<html>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <link rel="stylesheet" type="text/css" href="style.css">
  <head>
    <title>Clinica "La Clinica"</title>
  </head>
  <body>
    <%
              HttpSession sesion = request.getSession();
              if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")) {
                  response.sendRedirect("login.jsp");
              }
            
    %>
    <header>
      <h1>Contenido Premium</h1>
      <nav>
        <ul>
          <li><a href="index.jsp">Home</a></li>
          <li><a href="logout.jsp"><%if (sesion.getAttribute("email") != null) { out.print("Salir"); }%></a></li>
          <li><a><%if (sesion.getAttribute("email") != null) { out.print(sesion.getAttribute("email")); }%></a></li>
          <li><a href="buscar.jsp">Buscar</a></li>

        </ul>
      </nav>
    </header>
    <main>
      <h1>Articulos</h1>
      <div class="card" style="margin-bottom: 20px;">
        <div class="card-body">
          <h5 class="card-title">Silla de ruedas de acero autopropulsable Breezy Premium</h5>
          <p class="card-text">plegable, resistente, robusta y con diseño ergonómico para resistir el paso del tiempo. Amplio equipamiento de serie entre los que destacan su tapicería de nylon, su estructura de acero, los reposabrazos o la palanca de freno que hacen de la Breezy Premiun una silla de ruedas confortable y resistente.</p>
          <p class="card-text">Además, sus múltiples opciones de configuración te permitirán una adaptación perfecta a tus necesidades. Rueda trasera autopropulsable de 600mm. de diámetro.</p>
          <a href="https://www.ortoweb.com/silla-de-ruedas-de-acero-autopropulsable-breezy-premium" class="btn btn-primary">Mas informacion aqui.</a>
        </div>
      </div>
      <div class="card" style="margin-bottom: 20px;">
        <div class="card-body">
          <h5 class="card-title">Cama articulada eléctrica Vita</h5>
          <p class="card-text">de cuatro planos y medida 90x190cm. Vita es una cama articulada para uso domiciliario con una excelente relación calidad precio</p>
          <p class="card-text"></p>
          <a href="https://www.ortoweb.com/camas-articuladas-electrica-vita" class="btn btn-primary">Mas informacion aqui!</a>
        </div>
      </div>
      <div class="card" style="margin-bottom: 20px;">
        <div class="card-body">
          <h5 class="card-title">Muñequera elástica para dedo pulgar transpirable TN-262</h5>
          <p class="card-text">Permite sujetar y estabilizar en casos de lesiones deportivas y laborales, tendinitis e irritaciones de la articulación trapecio metacarpiana.</p>
          <p class="card-text">Muñequera envolvente con dedal de trapecio metacarpiano para el pulgar confeccionado en velour y lycra con banda elástica ajustable mediante microgancho para la muñeca.</p>
          <a href="https://www.ortoweb.com/munequera-elastica-para-dedo-pulgar-transpirable-tn-262" class="btn btn-primary">Mas informacion aqui!</a>
        </div>
      </div>
    </main>
    <footer>
      <p>&copy; 2023 My Blog</p>
    </footer>
  </body>
</html>