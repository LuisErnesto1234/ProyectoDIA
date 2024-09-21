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
</head>
<body>
<%
    List<Registro> registros = (List<Registro>) request.getAttribute("registros");
    UsuarioService usuarioService = new UsuarioServiceImp();
    if (registros.isEmpty()){%>
        <h2>No hay registros para mostrar</h2>
    <%} else {%>
    <table border="1" cellpadding="2" cellspacing="2">
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Fecha</th>
            <th>Hora Inicio</th>
            <th>Hora Finalizo</th>
            <th>Minutos Utilizados</th>
            <th>Acciones</th>
        </tr>
        <% for (Registro registro : registros) { %>
            <tr>
                <td><%= registro.getId() %></td>
                <%  for (Usuario u : usuarioService.listarUsuarios()){
                    if (u.getId() == registro.getIdUsuario()){%>
                    <td><%=u.getNombre()%></td>
                <%
                        }
                }%>
                <td><%= registro.getFecha() %></td>
                <td><%= registro.getHoraInicio() %></td>
                <td><%= registro.getHoraFin() %></td>
                <td><%= registro.getMinutosUtilizados() %></td>
                <td><a href="control?action=editar&id=<%=registro.getId()%>">Editar</a>
                    <a href="control?action=eliminar&id=<%=registro.getId()%>">Eliminar</a>
                </td>
            </tr>
        <% } %>
    </table>
<%} %>

<a href="index.jsp">Volver</a>

</body>
</html>
