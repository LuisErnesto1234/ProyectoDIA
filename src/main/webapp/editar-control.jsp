<%@ page import="com.daza.api.servlet.controlagua.dto.Registro" %>
<%@ page import="java.util.List" %>
<%@ page import="com.daza.api.servlet.controlagua.service.UsuarioService" %>
<%@ page import="com.daza.api.servlet.controlagua.service.UsuarioServiceImp" %>
<%@ page import="com.daza.api.servlet.controlagua.dto.Usuario" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<html>
<head>
    <title>Edita un registro</title>
</head>
<body>
    <%
        Registro registro = (Registro) request.getAttribute("registro");
        UsuarioService usuarioService = new UsuarioServiceImp();
        List<Usuario> usuarios = usuarioService.listarUsuarios();
    %>

    <form action="control?action=editar" method="post">
        <input type="hidden" name="id" value="<%=registro.getId()%>">
        <label for="usuario">Usuario: </label>
        <select name="idUsuario" title="Usuario" id="usuario">
        <%for (Usuario u : usuarios){
            if (u.getId() == registro.getIdUsuario()){%>
                 <option value="<%=u.getId()%>"><%=u.getNombre()%></option>
            <%}else{%>
           <option value="<%=u.getId()%>"><%=u.getNombre()%></option>
        <%}}%>
        </select>
        <label for="fecha"></label>
        <input type="date" name="fecha" id="fecha" value="<%=registro.getFecha()%>">
        <label for="horaInicio">Hora que Inicio</label>
        <input type="time" name="horaInicio" id="horaInicio" value="<%=registro.getHoraInicio()%>">
        <label for="horaFin">Hora que finalizo</label>
        <input type="time" name="horaFin" id="horaFin" value="<%=registro.getHoraFin()%>">
        <label for="minutos">Minutos que utilizo</label>
        <input type="text" id="minutos" disabled value="<%=registro.getMinutosUtilizados()%>">
        <input type="submit" value="Actualizar">
    </form>
</body>
</html>
