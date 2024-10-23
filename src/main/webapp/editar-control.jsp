<%@ page import="com.daza.api.servlet.controlagua.dto.Registro" %>
<%@ page import="java.util.List" %>
<%@ page import="com.daza.api.servlet.controlagua.service.UsuarioService" %>
<%@ page import="com.daza.api.servlet.controlagua.service.UsuarioServiceImp" %>
<%@ page import="com.daza.api.servlet.controlagua.dto.Usuario" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<html>
<head>
    <title>Edita un registro</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">
    <script src="https://cdn.jsdelivr.net/npm/flowbite@2.5.2/dist/flowbite.min.js"></script>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
    <%
        Registro registro = (Registro) request.getAttribute("registro");
        UsuarioService usuarioService = new UsuarioServiceImp();
        List<Usuario> usuarios = usuarioService.listarUsuarios();
    %>

    <div class="flex">

        <jsp:include page="aside.jsp"/>

        <main class="p-4 sm:ml-64 w-full">
            <div class="p-4 border-2 border-gray-200 border-dashed rounded-lg dark:border-gray-700">

                <form action="control?action=editar" method="post" class="space-y-4">
                    <input type="hidden" name="id" value="<%=registro.getId()%>">
                    <div>
                        <label for="usuario" class="block text-sm font-medium text-gray-700">Usuario:</label>
                        <select name="idUsuario" title="Usuario" id="usuario"
                                class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm">
                            <%
                                for (Usuario u : usuarios) {
                                    if (u.getId() == registro.getIdUsuario()) {
                            %>
                            <option value="<%=u.getId()%>"><%=u.getNombre()%>
                            </option>
                            <%} else {%>
                            <option value="<%=u.getId()%>"><%=u.getNombre()%>
                            </option>
                            <%
                                    }
                                }
                            %>
                        </select>
                    </div>
                    <div>
                        <label for="fecha" class="block text-sm font-medium text-gray-700">Fecha:</label>
                        <input type="date" name="fecha" id="fecha" value="<%=registro.getFecha()%>"
                               class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm">
                    </div>
                    <div>
                        <label for="horaInicio" class="block text-sm font-medium text-gray-700">Hora que Inicio:</label>
                        <input type="time" name="horaInicio" id="horaInicio" value="<%=registro.getHoraInicio()%>"
                               class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm">
                    </div>
                    <div>
                        <label for="horaFin" class="block text-sm font-medium text-gray-700">Hora que finalizo:</label>
                        <input type="time" name="horaFin" id="horaFin" value="<%=registro.getHoraFin()%>"
                               class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm">
                    </div>
                    <div>
                        <label for="minutos" class="block text-sm font-medium text-gray-700">Minutos que
                            utilizo:</label>
                        <input type="text" id="minutos" disabled value="<%=registro.getMinutosUtilizados()%>"
                               class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm">
                    </div>
                    <div>
                        <button type="submit"
                                class="inline-flex justify-center py-2 px-4 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                            Actualizar
                        </button>
                    </div>
                </form>
            </div>
        </main>
    </div>

</body>
</html>
