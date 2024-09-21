<%@ page import="com.daza.api.servlet.controlagua.dto.Usuario" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <link rel="stylesheet" href="estilos/style.css" type="text/css">
    <link rel="shortcut icon" href="imagenes/logoDIA.png" type="image/x-icon">
</head>
<body>
<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    if(usuario != null){%>
<header>
    <nav class="navbar">
        <div class="navbar-brand">
            <a href="index.jsp">
            <img src="imagenes/logoDIA.png" alt="logoDIA">
            <span><strong>DIA</strong></span>
            </a>
        </div>
        <div class="menu-icon" id="menu-icon"><!-- Icono de menú tipo hamburguesa -->
        </div>
        <ul class="nav-list" id="nav-list">
            <li><a href="user?action=listar">Usuarios</a></li>
            <li><a href="control?action=listar">Control</a></li>
            <li><a href="#">Consultar</a></li>
            <li><a href="#">Controlar</a></li>
        </ul>

        <div class="usuario">
            <p>Hola, <strong><%=usuario.getNombre() + " " + usuario.getApellido()%></strong></p>
            <div class="cerraSesion">
                <a href="logout">Cerrar Sesión</a>
            </div>
        </div>
    </nav>
</header>
<%}else{%>
<header>
    <nav class="navbar">
        <div class="navbar-brand">
            <img src="imagenes/logoDIA.png" alt="logoDIA">
            <span><strong>DIA</strong></span>
        </div>
        <div class="menu-icon"><!-- Icono de menú tipo hamburguesa -->
        </div>
        <ul class="nav-list">
            <li><a href="#">Usuarios</a></li>
            <li><a href="#">Control</a></li>
            <li><a href="#">Consultar</a></li>
            <li><a href="#">Controlar</a></li>
        </ul>

        <div class="usuario">
            <div class="iniciarSesion">
                <a href="login.jsp">Iniciar Sesión</a>
            </div>
        </div>
    </nav>
</header>
<%}%>

<script src="js/script.js"></script>

</body>
</html>
