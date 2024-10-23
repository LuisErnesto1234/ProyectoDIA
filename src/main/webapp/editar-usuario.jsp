<%@ page import="com.daza.api.servlet.controlagua.dto.Usuario" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edita un usuario</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">
    <script src="https://cdn.jsdelivr.net/npm/flowbite@2.5.2/dist/flowbite.min.js"></script>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>

    <%
        Usuario user = (Usuario) request.getAttribute("usuario");
    %>

    <div class="flex">
        <jsp:include page="aside.jsp"/>

        <main class="p-4 sm:ml-64 w-full">
            <div class="p-4 border-2 border-gray-200 border-dashed rounded-lg dark:border-gray-700">

                <h1 class="text-2xl font-bold mb-4">Edita un Usuario</h1>
                <form action="user?action=editar" method="post" class="space-y-4">
                    <input type="hidden" name="id" value="<%= user.getId() %>">
                    <div>
                        <label for="nombre" class="block text-sm font-medium text-gray-700">Nombre:</label>
                        <input type="text" id="nombre" name="nombre" value="<%= user.getNombre() %>" required
                               class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm">
                    </div>
                    <div>
                        <label for="apellido" class="block text-sm font-medium text-gray-700">Apellido:</label>
                        <input type="text" id="apellido" name="apellido" value="<%= user.getApellido() %>" required
                               class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm">
                    </div>
                    <div>
                        <label for="username" class="block text-sm font-medium text-gray-700">Username:</label>
                        <input type="text" id="username" name="username" value="<%= user.getUsername() %>" required
                               class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm">
                    </div>
                    <div>
                        <label for="password" class="block text-sm font-medium text-gray-700">Contraseña:</label>
                        <input type="password" id="password" name="password" value="<%= user.getPassword() %>" required
                               class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm">
                    </div>
                    <div>
                        <label for="horasAcumuladas" class="block text-sm font-medium text-gray-700">Horas
                            Acumuladas:</label>
                        <input type="number" id="horasAcumuladas" name="horasAcumuladas" step="0.01"
                               value="<%= user.getHorasAcumuladas() %>"
                               class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm">
                    </div>
                    <div>
                        <label for="minutosGratis" class="block text-sm font-medium text-gray-700">Minutos
                            Semana:</label>
                        <input type="number" id="minutosGratis" name="minutosGratisSemana"
                               value="<%= user.getMinutosGratisSemana() %>" required
                               class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm">
                    </div>
                    <div>
                        <label for="rol" class="block text-sm font-medium text-gray-700">Rol:</label>
                        <select id="rol" name="rol"
                                class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm">
                            <%
                                String[] roles = {"Administrador", "Usuario"};
                                for (String role : roles) {
                                    if (role.equals(user.getRol())) {%>
                            <option value="<%= role %>" selected><%= role %>
                            </option>
                            <%} else {%>
                            <option value="<%= role %>"><%= role %>
                            </option>
                            <%
                                    }
                                }
                            %>
                        </select>
                    </div>
                    <div>
                        <button type="submit"
                                class="inline-flex justify-center py-2 px-4 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                            Guardar
                        </button>
                    </div>
                </form>
            </div>
        </main>
    </div>

</body>
</html>
