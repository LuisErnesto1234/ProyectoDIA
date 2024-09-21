<%@ page import="com.daza.api.servlet.controlagua.dto.Usuario" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <title>DIA | Aplicación Integrada Daza</title>
    <link rel="stylesheet" href="estilos/style.css">
</head>
<body>
    <jsp:include page="header.jsp" />

   <%Usuario usuario = (Usuario) session.getAttribute("usuario");
   if (usuario != null){%>
   <div class="mensaje">
       <p>Bienvenido <strong><%=usuario.getNombre()%></strong> que deseas hacer hoy:</p>
   </div>

   <div class="contenido">
       <div class="bloque">
           <div class="imagen">
               <img src="imagenes/usuarios.svg" alt="Icono de usuarios">
           </div>
           <div class="texto">
               <h2>Usuarios</h2>
               <p>Visualiza a todos los usuarios registrados</p>
           </div>
           <div class="boton">
               <a href="user?action=listar">INGRESAR</a>
           </div>
       </div>
       <div class="bloque">
           <div class="imagen">
               <img src="imagenes/control.svg" alt="Icono de control">
           </div>
           <div class="texto">
               <h2>Control</h2>
               <p>Visualiza los minutos y horas de todos los usuarios</p>
           </div>
           <div class="boton">
               <a href="control?action=listar">INGRESAR</a>
           </div>
       </div>
       <div class="bloque">
           <div class="imagen">
               <img src="imagenes/consulta.svg" alt="Icono de consulta">
           </div>
           <div class="texto">
               <h2>Consulta</h2>
               <p>Consulta a la base de datos un registro en particular</p>
           </div>
           <div class="boton">
               <a href="#">INGRESAR</a>
           </div>
       </div>
       <%if (usuario.getRol().equals("Administrador")){%>
       <div class="bloque">
           <div class="imagen">
               <img src="imagenes/controlar.svg" alt="Icono de controlar">
           </div>
           <div class="texto">
               <h2>Controlar</h2>
               <p>Controla el uso de agua de cada usuario</p>
           </div>
           <div class="boton">
               <a href="agregar-control.jsp">INGRESAR</a>
           </div>
       </div>
       <%}%>
   </div>
   <%}else {%>
   <div class="mensaje">
       <p>Deberías pensar seriamente en, <a href="login.jsp"> Iniciar sesión</a></p>
   </div>
   <%}%>
</body>
</html>