<%@ page import="com.daza.api.servlet.controlagua.service.UsuarioService" %>
<%@ page import="com.daza.api.servlet.controlagua.service.UsuarioServiceImp" %>
<%@ page import="com.daza.api.servlet.controlagua.dto.Usuario" %>
<%@ page import="java.time.LocalDate" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="imagenes/logoDIA.png" type="image/x-icon">
    <title>Nuevo Control Agua | DIA</title>
    <link type="text/css" rel="stylesheet" href="estilos/style.css" >
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200"/>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/flowbite@2.5.2/dist/flowbite.min.css" rel="stylesheet" />
</head>
<body>

<div class="flex">
    <jsp:include page="aside.jsp" />

    <main class="p-4 sm:ml-64 w-full">
        <div class="p-4 border-2 border-gray-200 border-dashed rounded-lg dark:border-gray-700">
            <%
                UsuarioService service = new UsuarioServiceImp();
                LocalDate fechaActual = LocalDate.now();
            %>

            <div class="w-full">
                <!-- Título -->
                <div>
                    <h1 class="text-3xl font-bold text-center p-5">Agregar Nuevo Control</h1>
                </div>

                <!-- Formulario -->
                <form action="control?action=agregar" method="post" class="p-4 border rounded-lg shadow-lg space-y-4 bg-white dark:bg-gray-800">
                    <!-- Campo Usuario -->
                    <div>
                        <label for="usuario" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Usuario:</label>
                        <select name="idUsuario" id="usuario" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" required>
                            <% for (Usuario u : service.listarUsuarios()) { %>
                            <option value="<%= u.getId() %>"><%= u.getNombre() + " " + u.getApellido() %></option>
                            <% } %>
                        </select>
                    </div>

                    <!-- Campo Fecha -->
                    <div>
                        <label for="fecha" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Fecha:</label>
                        <input type="date" name="fecha" id="fecha" value="<%= fechaActual %>" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" required />
                    </div>

                    <!-- Campo Hora de Inicio -->
                    <div>
                        <label for="horaInicio" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Hora en que Inició 😁</label>
                        <input type="time" id="horaInicio" name="horaInicio" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" required />
                    </div>

                    <!-- Campo Hora de Finalización -->
                    <div>
                        <label for="horaFin" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Hora en la que Finalizó</label>
                        <input type="time" name="horaFin" id="horaFin" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" required />
                    </div>

                    <!-- Botón de envío -->
                    <div class="text-center">
                        <button type="submit" class="flex items-center justify-center gap-2 w-full px-5 py-2.5 text-sm font-medium text-center text-white bg-blue-600 rounded-full hover:bg-blue-700 focus:ring-4 focus:outline-none focus:ring-blue-300 dark:bg-blue-700 dark:hover:bg-blue-800 dark:focus:ring-blue-800">
                            Registrar <span class="material-symbols-outlined">library_books</span>
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </main>
</div>

</body>
</html>
