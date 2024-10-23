<%@ page import="java.util.List" %>
<%@ page import="com.daza.api.servlet.controlagua.dto.Usuario" %>
<%@ page import="java.time.LocalDate" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Listado de usuarios | DIA</title>
    <link rel="stylesheet" href="estilos/style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Julius+Sans+One&family=Playwrite+DE+Grund:wght@100..400&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">
    <script src="https://cdn.jsdelivr.net/npm/flowbite@2.5.2/dist/flowbite.min.js"></script>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<%
    // Obtener la lista de usuarios
    List<Usuario> listaUsuarios = (List<Usuario>) request.getAttribute("lista");
    LocalDate fechaActual = LocalDate.now();
    int admin = (int) request.getAttribute("admin");
    int cliente = (int) request.getAttribute("cliente");

    // Verificar si la lista de usuarios está vacía
    if (listaUsuarios == null || listaUsuarios.isEmpty()) {%>
<h1>No hay usuarios registrados.</h1>
<%  } else { %>

<div class="flex">
    <!-- Sidebar -->
    <jsp:include page="aside.jsp"/>

    <!-- Contenido -->
    <main class="p-4 sm:ml-64 w-full">

        <div class="p-4 border-2 border-gray-200 border-dashed rounded-lg dark:border-gray-700">
            <div>
                <h1 class="text-3xl font-bold text-center p-5">Listado de Usuarios</h1>
            </div>

            <div>
                <div class="flex justify-center items-center gap-4">
                    <div class="w-1/5 bg-gradient-to-r from-slate-900 to-slate-700 text-base text-white text-center h-28 rounded-lg flex justify-center items-center">
                        <h2 class="text-center">Total de Usuarios: <strong><%=listaUsuarios.size()%></strong></h2>
                    </div>
                    <div class="w-1/5 bg-gradient-to-r from-red-500 to-orange-500 text-base text-white text-center h-28 rounded-lg flex justify-center items-center">
                        <h2 class="text-center">Usuarios Administradores: <strong><%=admin%></strong></h2>
                    </div>
                    <div class="w-1/5 bg-gradient-to-tr from-emerald-500 to-violet-700 text-base text-white text-cente h-28 rounded-lg flex justify-center items-center">
                        <h2 class="text-center">Usuarios Normales: <strong><%=cliente%></strong></h2>
                    </div>
                    <div class="w-1/5 bg-gradient-to-r from-rose-600 to-blue-600 text-base text-white text-cente h-28 rounded-lg flex justify-center items-center">
                        <h2 class="text-center">Fecha Actual: <br><strong>
                            <%= request.getAttribute("fechaFormateada") != null ? request.getAttribute("fechaFormateada") : "Fecha no disponible" %>
                        </strong></h2>
                    </div>
                </div>
            </div>
        <div>
            <div class="contains" style="padding: 1em 0 1em 0;">
            <div class="flex justify-end w-11/12">
                <a href="agregar-usuario.jsp"
                   class="flex bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 transition-colors rounded">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="size-6">
                        <path d="M5.25 6.375a4.125 4.125 0 1 1 8.25 0 4.125 4.125 0 0 1-8.25 0ZM2.25 19.125a7.125 7.125 0 0 1 14.25 0v.003l-.001.119a.75.75 0 0 1-.363.63 13.067 13.067 0 0 1-6.761 1.873c-2.472 0-4.786-.684-6.76-1.873a.75.75 0 0 1-.364-.63l-.001-.122ZM18.75 7.5a.75.75 0 0 0-1.5 0v2.25H15a.75.75 0 0 0 0 1.5h2.25v2.25a.75.75 0 0 0 1.5 0v-2.25H21a.75.75 0 0 0 0-1.5h-2.25V7.5Z" />
                    </svg>
                    <h5>Crear Usuario</h5>
                </a>
            </div>
            </div>
        </div>


        <div class="contains">
            <div class="w-11/12">
                <div class="rounded-lg">
                    <table class="table-auto w-full">
                        <thead class="bg-gradient-to-r from-fuchsia-500 to-cyan-500 text-white">
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Nombres</th>
                            <th scope="col">Apellidos</th>
                            <th scope="col">Minutos Semana</th>
                            <th scope="col">Acumulado Horas</th>
                            <th scope="col">Acumulado Minutos</th>
                            <th scope="col">Rol</th>
                            <th scope="col">Acciones</th>
                        </tr>
                        </thead>
                        <tbody>
                        <% for (Usuario usuario : listaUsuarios) { %>
                        <tr class="odd:bg-white even:bg-gray-200 even">
                            <td class="px-6 py-4"><%= usuario.getId() %>
                            </td>
                            <td class="px-6 py-4"><%= usuario.getNombre() %>
                            </td>
                            <td class="px-6 py-4"><%= usuario.getApellido() %>
                            </td>
                            <td class="px-6 py-4"><%= usuario.getMinutosGratisSemana() %>
                            </td>
                            <td class="px-6 py-4"><%= String.format("%.2f", usuario.getHorasAcumuladas()) %>
                            </td>
                            <td class="px-6 py-4"><%= (int) (usuario.getHorasAcumuladas() * 60) %>
                            </td>
                            <td class="px-6 py-4"><%= usuario.getRol() %>
                            </td>
                            <td>
                                <div class="bot">
                                    <a href="user?action=editar&id=<%= usuario.getId() %>" class="editar"
                                       title="Editar"><span class="material-symbols-outlined">edit</span></a>
                                    <a href="user?action=eliminar&id=<%= usuario.getId() %>" class="eliminar"
                                       title="Eliminar"
                                       onclick="return confirm('¿Estás seguro de que deseas eliminar a <%=usuario.getNombre() + " " +usuario.getApellido()%>?');"><span
                                            class="material-symbols-outlined">delete</span></a>
                                </div>
                            </td>
                        </tr>
                        <% } %>
                        </tbody>
                    </table>
                </div>
            </div>

            <h1><%=fechaActual%></h1>

<% } %>
            </div>

        </div>
    </main>
</div>

<script src="https://cdn.jsdelivr.net/npm/flowbite@2.5.2/dist/flowbite.min.js"></script>

</body>
</html>
