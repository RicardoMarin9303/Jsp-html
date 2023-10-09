<%-- 
    Document   : index
    Created on : 4 abr. 2023, 19:53:28
    Author     : rlmz93
--%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<!DOCTYPE html>
<html>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" type="text/css" href="style.css">
  <head>
    <title>Clinica "La Clinica"</title>
  </head>
  <body>
    <%
              HttpSession sesion = request.getSession();
              if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")) {
                  //response.sendRedirect("login.jsp");
              }
            
    %>
    <header>
      <h1>Gestor de Medios de Tienda On-line</h1>
      <nav>
        <ul>
          <li><a href="index.jsp">Home</a></li>
          <li><a href="premiumPost.jsp">Premium Post</a></li>
          <li><a href="login.jsp">Login</a></li>
          <li><a href="register.jsp">Register</a></li>
          <li><a href="logout.jsp"><%if (sesion.getAttribute("email") != null) { out.print("Salir"); }%></a></li>
          <li><a><%if (sesion.getAttribute("email") != null) { out.print(sesion.getAttribute("email")); }%></a></li>
          <li><a href="login.jsp"><%if (sesion.getAttribute("email") == null) { out.print("Accede a nuestro contenido premium iniciando sesión!"); }%></a></li>
          <li><a href="buscar.jsp">Buscar</a></li>
        </ul>
      </nav>
    </header>
    <main>
      <h1>Articulos</h1>
      <div class="card" style="margin-bottom: 20px;">
        <div class="card-body">
          <h5 class="card-title">Silla de ruedas</h5>
          <p class="card-text">Una silla de ruedas es una silla que permite el desplazamiento de personas con problemas de locomoción. En origen contaba al menos con una rueda, pero su diseño ha ido evolucionando y presenta múltiples variedades. Si quieres ver más contenido relacionado con sillas de ruedas, precios, descuentos, envíos gratuitos, ingresa a nuestro contenido premium.</p>
          <a href="premiumPost.jsp" class="btn btn-primary">Ir al contenido premium para mas información</a>
        </div>
      </div>

      <div class="card" style="margin-bottom: 20px;">
        <div class="card-body">
          <h5 class="card-title">Camas ortopedicas</h5>
          <p class="card-text">Las camas ortopédicas son colchones y camas especialmente diseñadas para ofrecer un soporte mejorado a los músculos y articulaciones de tu can, aliviando así posibles dolores asociados con la edad que este pueda padecer. Tenemos camas a un precio excelente, con descuentos, promociones y envios gratis, ve a nuestro contenido premium y veras mas informacion.</p>
          <a href="premiumPost.jsp" class="btn btn-primary">Ir al contenido premium para mas información</a>
        </div>
      </div>

      <div class="card" style="margin-bottom: 20px;">
        <div class="card-body">
          <h5 class="card-title">Cabestrillo</h5>
          <p class="card-text">Un cabestrillo es un dispositivo para limitar el movimiento del hombro o el codo mientras se sana luego de una fractura o luxación. ? Se puede crear un cabestrillo a partir de un vendaje triangular.</p>
        <a href="https://medlineplus.gov/spanish/ency/article/000017.htm" class="btn btn-primary">Conoce nuestros partners y lo que ofrecen para ti, contenido gratuito!!!</a>
        </div>
      </div>
      <h1>Informate con nuestros doctores.</h1>
      <div class="card" style="margin-bottom: 20px;">
        <div class="card-body">
          <h5 class="card-title">Te has torcido la muñeca?</h5>
          <p class="card-text">Descansa la muñeca: Evita usar la muñeca tanto como sea posible durante las primeras 24-48 horas después de la lesión. Intenta mantenerla elevada para reducir la hinchazón.</p>
          <p class="card-text">Aplica hielo: Aplica una bolsa de hielo o un paquete de gel frío envuelto en una toalla sobre la muñeca durante 15-20 minutos cada hora durante las primeras 24-48 horas. Esto ayudará a reducir la inflamación y el dolor.</p>
          <p class="card-text">Compresión: Aplica una venda elástica para comprimir la muñeca. La venda debe estar ajustada pero no tan apretada que corte la circulación. Elevación: Eleva la muñeca por encima del nivel del corazón para reducir la hinchazón.</p>
          <p class="card-text">Medicación: Toma analgésicos de venta libre, como ibuprofeno o acetaminofén, para reducir el dolor y la inflamación. Rehabilitación: Después de unos días, comienza a realizar ejercicios de fortalecimiento y movilidad para evitar la rigidez en la muñeca y acelerar la recuperación. Si el dolor o la hinchazón persisten, consulta a un médico.</p>
          <a href="premiumPost.jsp" class="btn btn-primary">Ir al contenido premium para mas información</a>
        </div>
      </div>
            <div class="card" style="margin-bottom: 20px;">
        <div class="card-body">
          <h5 class="card-title">Comfort en Camas ortopedicas.</h5>
          <p class="card-text">Aún hay quien piensa en algo de hospital o residencia geriátrica cuando oye hablar de camas articuladas. Lo cierto es que son ideales aportando beneficios para todo tipo de persona que quiera mejorar su descanso. Pero incluso para descansar en pareja, tenemos diferentes configuraciones con las camas articuladas matrimonio.</p>
          <a href="premiumPost.jsp" class="btn btn-primary">Ir al contenido premium para mas información</a>
        </div>
      </div>
      <h1>Nuestro doctores te lo explican.</h1>
      <div class="card" style="margin-bottom: 20px;">
        <div class="card-body">
          <h5 class="card-title">Bacterias multiresistentes.</h5>
          <p class="card-text">Helicobacter pylori, Staphylococcus aureus, Streptococcus pneumoniae, Escherichia coli, Klebsiella pneumoniae y Salmonella spp son algunos de los microorganismos que en los últimos tiempos han demostrado mayores niveles de resistencia a diversas generaciones de antibióticos y que ponen en riesgo la salud de la población. Una lista que, desafortunadamente, crece cada vez más y que hace que hoy la resistencia antimicrobiana sea un problema de salud pública, calificado en 2020 por la Organización Mundial de la Salud (OMS) dentro de la lista de ?problemas sanitarios urgentes de dimensión mundial?. Si quieres saber mas del tema, pincha en nuestro enlace asociado.</p>
          <a href="https://www.paho.org/es/noticias/4-3-2021-patogenos-multirresistentes-que-son-prioritarios-para-oms" class="btn btn-primary">Conoce nuestros partners y lo que ofrecen para ti, contenido gratuito!!!</a>
        </div>
      </div>
    </main>
    <footer>
      <p>&copy; 2023 My Blog</p>
    </footer>
  </body>
</html>
