<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Agregar un usuario</title>
</head>
<body>
    <h1>Agregar un Usuario</h1>
    <form action="user?action=agregar" method="post">
        <div>
            <label for="nombre">Nombre:</label>
            <input type="text" id="nombre" name="nombre" required>
        </div>
        <div>
            <label for="apellido">Apellido:</label>
            <input type="text" id="apellido" name="apellido" required>
        </div>
        <div>
            <label for="email">Username:</label>
            <input type="email" id="email" name="Username" required>
        </div>
        <div>
            <label for="password">Contraseña:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <div>
            <label for="hora">Horas Acumuladas:</label>
            <input type="number" id="hora" name="horasAcumuladas" required>
        </div>
        <div>
            <label for="minutosgratis">Minutos Semana:</label>
            <input type="number" id="minutosgratis" name="minutosGratisSemana" required>
        </div>
        <div>
            <label for="rol">Rol del usuario:</label>
            <select name="rol" id="rol" required>
                <option value="" selected>--Escoja una opción--</option>
                <option value="Administrador">Administrador</option>
                <option value="Usuario">Usuario</option>
            </select>
        </div>
        <div>
            <input type="submit" value="Agregar">
        </div>
    </form>
</body>
</html>
