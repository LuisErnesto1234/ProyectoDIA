<%@ page import="com.daza.api.servlet.controlagua.dto.Usuario" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DIA | Aplicación Integrada Daza</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">
    <script src="https://cdn.jsdelivr.net/npm/flowbite@2.5.2/dist/flowbite.min.js"></script>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>

<div class="flex">

    <jsp:include page="aside.jsp"/>

    <main class="p-4 sm:ml-64 w-full">
        <div class="p-4 border-2 border-gray-200 border-dashed rounded-lg dark:border-gray-700">
            <%
                Usuario usuario = (Usuario) session.getAttribute("usuario");
                if (usuario != null) {
            %>
<div class="mensaje p-4 mb-4 text-sm text-green-700 bg-green-100 rounded-lg dark:bg-green-200 dark:text-green-800" role="alert">
    <p>Bienvenido <strong><%=usuario.getNombre() + " " + usuario.getApellido()%></strong>, ¿qué deseas hacer hoy?</p>
</div>

<div class="contenido grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
    <div class="bloque p-6 bg-white border border-gray-200 rounded-lg shadow dark:bg-gray-800 dark:border-gray-700">
        <div class="imagen mb-4">
            <img src="imagenes/usuarios.svg" alt="Icono de usuarios" class="w-12 h-12 mx-auto">
        </div>
        <div class="texto text-center">
            <h2 class="text-xl font-bold mb-2">Usuarios</h2>
            <p class="text-gray-700 dark:text-gray-400">Visualiza a todos los usuarios registrados</p>
        </div>
        <div class="boton mt-4 text-center">
            <a href="user?action=listar" class="inline-block px-4 py-2 text-white bg-blue-600 rounded hover:bg-blue-700">INGRESAR</a>
        </div>
    </div>
    <div class="bloque p-6 bg-white border border-gray-200 rounded-lg shadow dark:bg-gray-800 dark:border-gray-700">
        <div class="imagen mb-4">
            <img src="imagenes/control.svg" alt="Icono de control" class="w-12 h-12 mx-auto">
        </div>
        <div class="texto text-center">
            <h2 class="text-xl font-bold mb-2">Control</h2>
            <p class="text-gray-700 dark:text-gray-400">Visualiza los minutos y horas de todos los usuarios</p>
        </div>
        <div class="boton mt-4 text-center">
            <a href="control?action=listar" class="inline-block px-4 py-2 text-white bg-blue-600 rounded hover:bg-blue-700">INGRESAR</a>
        </div>
    </div>
    <div class="bloque p-6 bg-white border border-gray-200 rounded-lg shadow dark:bg-gray-800 dark:border-gray-700">
        <div class="imagen mb-4">
            <img src="imagenes/consulta.svg" alt="Icono de consulta" class="w-12 h-12 mx-auto">
        </div>
        <div class="texto text-center">
            <h2 class="text-xl font-bold mb-2">Consulta</h2>
            <p class="text-gray-700 dark:text-gray-400">Consulta a la base de datos un registro en particular</p>
        </div>
        <div class="boton mt-4 text-center">
            <a href="#" class="inline-block px-4 py-2 text-white bg-blue-600 rounded hover:bg-blue-700">INGRESAR</a>
        </div>
    </div>
    <%if (usuario.getRol().equals("Administrador")) {%>
    <div class="bloque p-6 bg-white border border-gray-200 rounded-lg shadow dark:bg-gray-800 dark:border-gray-700">
        <div class="imagen mb-4">
            <img src="imagenes/controlar.svg" alt="Icono de controlar" class="w-12 h-12 mx-auto">
        </div>
        <div class="texto text-center">
            <h2 class="text-xl font-bold mb-2">Controlar</h2>
            <p class="text-gray-700 dark:text-gray-400">Controla el uso de agua de cada usuario</p>
        </div>
        <div class="boton mt-4 text-center">
            <a href="agregar-control.jsp" class="inline-block px-4 py-2 text-white bg-blue-600 rounded hover:bg-blue-700">INGRESAR</a>
        </div>
    </div>
    <%}%>
</div>
<%} else {%>
<div class="mensaje p-4 mb-4 text-sm text-red-700 bg-red-100 rounded-lg dark:bg-red-200 dark:text-red-800" role="alert">
    <p>Deberías pensar seriamente en, <a href="login.jsp" class="font-medium text-blue-600 dark:text-blue-500 hover:underline">Iniciar sesión</a></p>
</div>
<%}%>
        </div>
    </main>
</div>

<script src="https://cdn.jsdelivr.net/npm/flowbite@2.5.2/dist/flowbite.min.js"></script>

</body>
</html>