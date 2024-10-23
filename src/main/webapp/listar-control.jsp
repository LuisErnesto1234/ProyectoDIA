<%@ page import="com.daza.api.servlet.controlagua.dto.Registro" %>
<%@ page import="java.util.List" %>
<%@ page import="com.daza.api.servlet.controlagua.service.UsuarioService" %>
<%@ page import="com.daza.api.servlet.controlagua.service.UsuarioServiceImp" %>
<%@ page import="com.daza.api.servlet.controlagua.dto.Usuario" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Listado de Registros</title>
    <link href="estilos/style.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">
    <script src="https://cdn.jsdelivr.net/npm/flowbite@2.5.2/dist/flowbite.min.js"></script>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>

<%
    List<Registro> registros = (List<Registro>) request.getAttribute("registros");
    UsuarioService usuarioService = new UsuarioServiceImp();
    if (registros.isEmpty()) {%>
<h2>No hay registros para mostrar</h2>
<%} else {%>

<!--Contenido-->

<div class="flex">
    <jsp:include page="aside.jsp"/>

    <main class="p-4 sm:ml-64 w-full">
        <div class="p-4 border-2 border-gray-200 border-dashed rounded-lg dark:border-gray-700">
        <div>
            <h1 class="text-3xl font-bold text-center p-5">Listado de Control de Agua</h1>
        </div>

            <div>
                <div class="flex justify-center items-center gap-4" style="padding: 1em 0 1em 0;">
                    <div class="w-1/5 bg-gradient-to-r from-slate-900 to-slate-700 text-base text-white text-center h-28 rounded-lg flex justify-center items-center">
                        <h2 class="text-center">Total de registros actuales: <strong><%=registros.size()%></strong></h2>
                    </div>
                    <div class="w-1/5 bg-gradient-to-r from-red-500 to-orange-500 text-base text-white text-center h-28 rounded-lg flex justify-center items-center">
                        <h2 class="text-center">Hora: <strong>10:22 p.m.</strong></h2>
                    </div>
                    <div class="w-1/5 bg-gradient-to-r from-rose-600 to-blue-600 text-base text-white text-cente h-28 rounded-lg flex justify-center items-center">
                        <h2 class="text-center">Fecha Actual: <br><strong>
                            <%= request.getAttribute("fechaFormateada") != null ? request.getAttribute("fechaFormateada") : "Fecha no disponible" %>
                        </strong></h2>
                    </div>
                </div>
            </div>


        <div class="contains">
            <div class="w-11/12">
                <div class="rounded-lg">
                    <div class="overflow-y-auto" style="height: 25rem">
                        <table class="table-auto w-full">
                            <thead class="bg-gradient-to-r from-fuchsia-500 to-cyan-500 text-white sticky top-0 z-10">
                            <tr>
                                <th scope="col" class="px-4 py-2">ID</th>
                                <th scope="col" class="px-4 py-2">Nombre</th>
                                <th scope="col" class="px-4 py-2">Fecha</th>
                                <th scope="col" class="px-4 py-2">Hora Inicio</th>
                                <th scope="col" class="px-4 py-2">Hora Finalizo</th>
                                <th scope="col" class="px-4 py-2">Minutos Utilizados</th>
                                <th scope="col" class="px-4 py-2">Acciones</th>
                            </tr>
                            </thead>
                            <tbody class="w-full">
                            <% for (Registro registro : registros) { %>
                            <tr class="odd:bg-white even:bg-gray-200">
                                <td class="px-6 py-4"><%= registro.getId() %></td>
                                <%  for (Usuario u : usuarioService.listarUsuarios()){
                                    if (u.getId() == registro.getIdUsuario()){%>
                                <td class="px-6 py-4"><%= u.getNombre() %></td>
                                <% }
                                } %>
                                <td class="px-6 py-4"><%= registro.getFecha() %></td>
                                <td class="px-6 py-4"><%= registro.getHoraInicio() %></td>
                                <td class="px-6 py-4"><%= registro.getHoraFin() %></td>
                                <td class="px-6 py-4"><%= registro.getMinutosUtilizados() %></td>
                                <td class="px-6 py-4">
                                    <div class="bot">
                                        <a href="control?action=editar&id=<%= registro.getId() %>" class="editar" title="Editar">
                                            <span class="material-symbols-outlined">edit</span>
                                        </a>
                                        <a href="control?action=eliminar&id=<%= registro.getId() %>" class="eliminar" title="Eliminar"
                                           onclick="return confirm('¿Estás seguro de que deseas eliminar este registro?');">
                                            <span class="material-symbols-outlined">delete</span>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                            <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <%} %>
        </div>

        </div>
    </main>
</div>

<script src="https://cdn.jsdelivr.net/npm/flowbite@2.5.2/dist/flowbite.min.js"></script>

</body>
</html>
