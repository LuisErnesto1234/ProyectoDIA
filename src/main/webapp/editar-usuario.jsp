<%@ page import="com.daza.api.servlet.controlagua.dto.Usuario" %>
<%@ page import="com.daza.api.servlet.controlagua.service.UsuarioService" %>
<%@ page import="com.daza.api.servlet.controlagua.service.UsuarioServiceImp" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edita un usuario</title>
</head>
<body>

    <%
        Usuario user = (Usuario) request.getAttribute("usuario");
        UsuarioService service = new UsuarioServiceImp();
    %>
    <h1>Edita un Usuario</h1>
    <form action="user?action=editar" method="post">
        <input type="hidden" name="id" value="<%= user.getId() %>">
        <div>
            <label for="nombre">Nombre:</label>
            <input type="text" id="nombre" name="nombre" value="<%= user.getNombre() %>" required>
            <label for="apellido">Apellido:</label>
            <input type="text" id="apellido" name="apellido" value="<%= user.getApellido() %>" required>
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" value="<%= user.getUsername() %>" required>
            <label for="password">Contraseña:</label>
            <input type="password" id="password" name="password" value="<%= user.getPassword() %>" required>
            <label for="horasAcumuladas">Horas Acumuladas:</label>
            <input type="number" id="horasAcumuladas" name="horasAcumuladas" step="0.01" value="<%= user.getHorasAcumuladas() %>">
            <label for="minutosGratis">Minutos Semana:</label>
            <input type="number" id="minutosGratis" name="minutosGratisSemana" value="<%= user.getMinutosGratisSemana() %>" required>
            <label for="rol">Rol</label>
            <select id="rol" name="rol">
               <%
                   String[] roles = {"Administrador", "Usuario"};
                   for (String role : roles){
                       if (role.equals(user.getRol())){%>
                        <option value="<%= role %>" selected><%= role %></option>
                <%}else{%>
                        <option value="<%= role %>"><%= role %></option>
                <%}}%>


            </select>
        </div>
        <button type="submit">Guardar</button>
    </form>
    <a href="user?action=listar">Regresar</a>
</body>
</html>
