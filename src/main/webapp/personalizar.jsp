<%@ page import="com.daza.api.servlet.controlagua.dto.Usuario" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Credenciales: <%=usuario.getNombre() + " " + usuario.getApellido()%>
    </title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">
    <script src="https://cdn.jsdelivr.net/npm/flowbite@2.5.2/dist/flowbite.min.js"></script>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>

<div class="flex">
    <jsp:include page="aside.jsp"/>

    <main class="p-4 sm:ml-64 w-full">
        <div class="p-4 border-2 border-gray-200 border-dashed rounded-lg dark:border-gray-700">

            <div class="lg:flex w-full lg:w-full h-16 bg-gradient-to-r from-indigo-500 via-purple-500 to-pink-500 relative rounded-t-lg">
                <div class="absolute inset-0 bg-black opacity-30 z-0"></div>
            </div>

            <div class="p-6 space-y-6">
                <h1 class="text-4xl font-bold text-center text-gray-800 dark:text-white">Personalizar</h1>

                <form method="post" action="user?action=crendenciales" class="space-y-6">
                    <div class="flex flex-col lg:flex-row gap-6">
                        <div class="lg:w-1/2 flex flex-col items-center space-y-4">
                            <input type="hidden" name="id" value="<%=usuario.getId()%>">
                            <div class="w-32 h-32">
                                <img src="imagenes/perfil.png" alt="imagen_perfil" class="w-full h-full rounded-full border-4 border-indigo-600 dark:border-gray-700 object-cover">
                            </div>

                            <div class="w-full">
                                <label for="nombre" class="block text-sm font-medium text-gray-700 dark:text-gray-300">Nombres: </label>
                                <input id="nombre" disabled type="text" value="<%=usuario.getNombre()%>"
                                       class="mt-1 block w-full rounded-lg border border-gray-300 dark:border-gray-600 focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm dark:bg-gray-700 dark:text-white p-2.5">
                            </div>

                            <div class="w-full">
                                <label for="apellido" class="block text-sm font-medium text-gray-700 dark:text-gray-300">Apellidos: </label>
                                <input id="apellido" disabled type="text" value="<%=usuario.getApellido()%>"
                                       class="mt-1 block w-full rounded-lg border border-gray-300 dark:border-gray-600 focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm dark:bg-gray-700 dark:text-white p-2.5">
                            </div>
                        </div>

                        <div class="lg:w-1/2 space-y-4">
                            <h2 class="text-lg font-semibold text-gray-800 dark:text-gray-200">Datos Adicionales:</h2>

                            <div>
                                <label for="horas" class="block text-sm font-medium text-gray-700 dark:text-gray-300">Horas Acumuladas: </label>
                                <input id="horas" disabled type="text" value="20.0"
                                       class="mt-1 block w-full rounded-lg border border-gray-300 dark:border-gray-600 focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm dark:bg-gray-700 dark:text-white p-2.5">
                            </div>

                            <div>
                                <label for="minutos" class="block text-sm font-medium text-gray-700 dark:text-gray-300">Minutos Semana: </label>
                                <input id="minutos" disabled type="text" value="60"
                                       class="mt-1 block w-full rounded-lg border border-gray-300 dark:border-gray-600 focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm dark:bg-gray-700 dark:text-white p-2.5">
                            </div>

                            <div>
                                <label for="username" class="block text-sm font-medium text-gray-700 dark:text-gray-300">Username: </label>
                                <input id="username" name="username" type="text" value="<%=usuario.getUsername()%>"
                                       class="mt-1 block w-full rounded-lg border border-gray-300 dark:border-gray-600 focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm dark:bg-gray-700 dark:text-white p-2.5">
                            </div>

                            <div>
                                <label for="password" class="block text-sm font-medium text-gray-700 dark:text-gray-300">Contraseña: </label>
                                <input id="password" name="password" type="password" value="<%=usuario.getPassword()%>"
                                       class="mt-1 block w-full rounded-lg border border-gray-300 dark:border-gray-600 focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm dark:bg-gray-700 dark:text-white p-2.5">
                            </div>
                        </div>
                    </div>

                    <div class="flex justify-center">
                        <input type="submit" value="Actualizar"
                               class="py-2 px-6 font-semibold text-white bg-indigo-600 hover:bg-indigo-700 rounded-lg shadow-md focus:outline-none focus:ring-2 focus:ring-indigo-500 dark:bg-indigo-700 dark:hover:bg-indigo-800 dark:focus:ring-indigo-800">
                    </div>
                </form>
            </div>
        </div>
    </main>
</div>
</body>
</html>
