<%@ page import="com.daza.api.servlet.controlagua.service.UsuarioService" %>
<%@ page import="com.daza.api.servlet.controlagua.service.UsuarioServiceImp" %>
<%@ page import="com.daza.api.servlet.controlagua.dto.Usuario" %>
<%@ page import="java.time.LocalDate" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Nuevo Control</title>
</head>
<body>
    <%
        UsuarioService service = new UsuarioServiceImp();
        LocalDate fechaActual = LocalDate.now();
    %>
    <h1>Nuevo control de agua</h1>
    <form action="control?action=agregar" method="post">
        <label for="usuario">Usuario:</label>
        <select name="idUsuario" id="usuario" required>
            <% for (Usuario u : service.listarUsuarios()){%>
                <option value="<%=u.getId()%>"><%=u.getNombre() + u.getApellido()%></option>
            <%}%>
        </select>
        <label for="fecha">Fecha: </label>
        <input type="date" name="fecha" id="fecha" value="<%=fechaActual%>" required>
        <label for="horaInicio">Hora en que Inicio 😁</label>
        <input type="time" id="horaInicio" name="horaInicio" required>
        <label for="horaFin">Hora en la que Finalizo</label>
        <input type="time" name="horaFin" id="horaFin" required>
        <input type="submit" value="Registrar">
    </form>
</body>
</html>
