<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Error 😔</title>
</head>
<body style="font-family: Arial, serif">

    <h1>Ocurrio un error 😔</h1>
    <%String error = (String) request.getAttribute("error");
        if (error != null){%>
            <h2 style="color: darkred"><%=error%></h2>
        <%}else {%>
        <h2 style="color: greenyellow">Nada que ver aqui, Aun no hay errores 😁</h2>
    <%}%>

</body>
</html>
