<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial">
    <link rel="shortcut icon" href="imagenes/logoDIA.png" type="image/x-icon">
    <title>Agregar un usuario | DIA</title>
    <link rel="stylesheet" href="estilos/style.css">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200"/>
    <script src="https://cdn.jsdelivr.net/npm/flowbite@2.5.2/dist/flowbite.min.js"></script>
</head>
<body>

<div class="flex">
    <!-- Sidebar -->
    <jsp:include page="aside.jsp" />

    <!-- Contenido -->
    <main class="p-4 sm:ml-64 w-full">
        <div class="p-4 border-2 border-gray-200 border-dashed rounded-lg dark:border-gray-700">

            <div class="container mt-5">
                <h1 class="text-3xl font-bold text-center mb-4">Agregar un Usuario</h1>

                <form action="user?action=agregar" method="post" class="p-6 border rounded-lg shadow-lg space-y-4 bg-white dark:bg-gray-800">
                    <!-- Campo Nombre -->
                    <div>
                        <label for="nombre" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Nombre:</label>
                        <input type="text" id="nombre" name="nombre" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" required />
                    </div>

                    <!-- Campo Apellido -->
                    <div>
                        <label for="apellido" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Apellido:</label>
                        <input type="text" id="apellido" name="apellido" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" required />
                    </div>

                    <!-- Campo Username -->
                    <div>
                        <label for="email" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Username:</label>
                        <input type="text" id="email" name="username" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" required />
                    </div>

                    <!-- Campo Contraseña -->
                    <div>
                        <label for="password" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Contraseña:</label>
                        <input type="password" id="password" name="password" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" required />
                    </div>

                    <!-- Campo Horas Acumuladas -->
                    <div>
                        <label for="hora" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Horas Acumuladas:</label>
                        <input type="number" id="hora" name="horasAcumuladas" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" required />
                    </div>

                    <!-- Campo Minutos Semana -->
                    <div>
                        <label for="minutosgratis" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Minutos Semana:</label>
                        <input type="number" id="minutosgratis" name="minutosGratisSemana" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" required />
                    </div>

                    <!-- Campo Rol -->
                    <div>
                        <label for="rol" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Rol del usuario:</label>
                        <select id="rol" name="rol" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" required>
                            <option value="" selected>--Escoja una opción--</option>
                            <option value="Administrador">Administrador</option>
                            <option value="Usuario">Usuario</option>
                        </select>
                    </div>

                    <!-- Botón de envío -->
                    <div class="text-center">
                        <button type="submit" class="flex items-center justify-center gap-2 w-full px-5 py-2.5 text-sm font-medium text-white bg-blue-600 rounded-full hover:bg-blue-700 focus:ring-4 focus:outline-none focus:ring-blue-300 dark:bg-blue-700 dark:hover:bg-blue-800 dark:focus:ring-blue-800">
                            Agregar <span class="material-symbols-outlined">person</span>
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </main>
</div>

<script src="https://cdn.jsdelivr.net/npm/flowbite@2.5.2/dist/flowbite.min.js"></script>

</body>
</html>
