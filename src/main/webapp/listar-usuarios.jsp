<%@ page import="java.util.List" %>
<%@ page import="com.daza.api.servlet.controlagua.dto.Usuario" %>
<%@ page import="java.time.LocalDate" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Listado de usuarios</title>
    <link rel="stylesheet" href="estilos/style.css">
</head>
<body>
<jsp:include page="header.jsp" />
<h1>Listado de Usuarios</h1>
<%
    // Obtener la lista de usuarios
    List<Usuario> listaUsuarios = (List<Usuario>) request.getAttribute("lista");
    LocalDate fechaActual = LocalDate.now();

    // Verificar si la lista de usuarios está vacía
    if (listaUsuarios == null || listaUsuarios.isEmpty()) { %>
<h1>No hay usuarios registrados.</h1>
<%  } else { %>

<table class="table">
    <thead class="bg-primary">
    <tr class="bg-primary">
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
    <%
        // Recorrer la lista de usuarios y mostrar los datos
        for (Usuario usuario : listaUsuarios) {
    %>
    <tr>
        <td scope="row"><%= usuario.getId() %></td>
        <td><%= usuario.getNombre() %></td>
        <td><%= usuario.getApellido() %></td>
        <td><%= usuario.getMinutosGratisSemana() %></td>
        <td><%= String.format("%.2f", usuario.getHorasAcumuladas()) %></td>
        <td><%= (int) (usuario.getHorasAcumuladas() * 60) %></td>
        <td><%= usuario.getRol() %></td>
        <td>
            <a href="user?action=editar&id=<%= usuario.getId() %>">Editar</a>
            <a href="user?action=eliminar&id=<%= usuario.getId() %>">Eliminar</a>
        </td>
    </tr>
    <% } %>
    </tbody>
</table>


<h1><%=fechaActual%></h1>

<% } %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
