package com.daza.api.servlet.controlagua.controllers;

import com.daza.api.servlet.controlagua.dto.Usuario;
import com.daza.api.servlet.controlagua.service.UsuarioService;
import com.daza.api.servlet.controlagua.service.UsuarioServiceImp;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Locale;

@WebServlet("/user")
public class UsuarioServlet extends HttpServlet {

    //TODO: Service instancia necesaria
    UsuarioService service = new UsuarioServiceImp();

    // Implementación del servlet para manejar las peticiones relacionadas con los usuarios

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action != null){
            switch (action) {
                case "listar":
                    listar(req, resp);
                    break;
                case "eliminar":
                    eliminar(req, resp);
                    break;
                case "editar":
                    mostrarFormulario(req, resp);
                    break;
                case "credenciales":
                    mostrarFormularioCredencial(req, resp);
                    break;
                default:
                    resp.sendError(HttpServletResponse.SC_NOT_FOUND);
                    break;
            }
        }
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action != null){
            switch (action) {
                case "editar":
                    editar(req, resp);
                    break;
                case "agregar":
                    agregar(req, resp);
                    break;
                case "crendenciales":
                    credenciales(req, resp);
                    break;
                default:
                    resp.sendError(HttpServletResponse.SC_NOT_FOUND);
                    break;
            }
        }
    }

    private void mostrarFormularioCredencial(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Usuario usuario = service.obtenerUsuarioPorId(id);
        req.setAttribute("usuario", usuario);
        req.getRequestDispatcher("personalizar.jsp").forward(req, resp);
    }

    protected void credenciales(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Usuario usuario = (Usuario) session.getAttribute("usuario"); // Obtenemos el usuario de la sesión

        if (usuario == null) {
            // Si no hay un usuario en la sesión, redirige a la página de login u otro lugar
            resp.sendRedirect("login.jsp");
            return;
        }

        // Obtener los datos desde el formulario
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        // Actualizar los datos del usuario en la base de datos
        usuario.setUsername(username);
        usuario.setPassword(password);
        service.actualizarUsernamePassword(usuario);

        // Actualizar la sesión con los nuevos datos del usuario
        session.setAttribute("usuario", usuario);

        // Redirigir después de la actualización
        resp.sendRedirect("user?action=listar");  // Cambia esto según tu lógica
    }

    private void mostrarFormulario(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Usuario usuario = service.obtenerUsuarioPorId(id);
        req.setAttribute("usuario", usuario);
        req.getRequestDispatcher("editar-usuario.jsp").forward(req, resp);
    }

    private void eliminar(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        service.eliminarUsuario(id);
        resp.sendRedirect("user?action=listar");
    }

    private static LocalDate ultimaEjecucion = null;

    private void listar(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UsuarioService usuarioService = new UsuarioServiceImp();
        List<Usuario> listaUsuarios = usuarioService.listarUsuarios(); // Asegúrate de usar el servicio correcto

        int admin = 0;
        int cliente = 0;

        for (Usuario usuario : listaUsuarios) {
            if (usuario.getRol().equals("Administrador")) {
                admin++;
            } else {
                cliente++;
            }
        }

        LocalDate fechaHoy = LocalDate.now();
        boolean esDomingo = fechaHoy.getDayOfWeek() == DayOfWeek.SUNDAY;

        // Verificar si es domingo y si ya se ha ejecutado esta semana
        if (esDomingo && (ultimaEjecucion == null || !ultimaEjecucion.isEqual(fechaHoy))) {
            // Ejecutar la actualización
            usuarioService.actualizarUsuariosMinutos(listaUsuarios);

            // Actualizar la última ejecución
            ultimaEjecucion = fechaHoy;
        }

        // Formatear la fecha (en español)
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("EEEE, MMMM - yyyy", new Locale("es", "ES"));
        String fechaFormateada = fechaHoy.format(formatter);

        // Colocar la fecha formateada en el request
        req.setAttribute("fechaFormateada", fechaFormateada);
        req.setAttribute("lista", listaUsuarios);
        req.setAttribute("admin", admin);
        req.setAttribute("cliente", cliente);
        req.getRequestDispatcher("/listar-usuarios.jsp").forward(req, resp);
    }


    private void agregar(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        String nombre = req.getParameter("nombre");
        String apellido = req.getParameter("apellido");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String rol = req.getParameter("rol");
        double horasAcumuladas = Double.parseDouble(req.getParameter("horasAcumuladas"));
        int minutosGratisSemana = Integer.parseInt(req.getParameter("minutosGratisSemana"));

        Usuario usuario = new Usuario(0, nombre, apellido, username, password, horasAcumuladas, minutosGratisSemana, rol);

        service.agregarUsuario(usuario);
        resp.sendRedirect("user?action=listar");

    }

    private void editar(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));
        String nombre = req.getParameter("nombre");
        String apellido = req.getParameter("apellido");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        double horasAcumuladas = Double.parseDouble(req.getParameter("horasAcumuladas"));
        int minutosGratisSemana = Integer.parseInt(req.getParameter("minutosGratisSemana"));
        String rol = req.getParameter("rol");

        service.editarUsuario(new Usuario(id, nombre, apellido, username, password, horasAcumuladas, minutosGratisSemana, rol));
        resp.sendRedirect("user?action=listar");
    }

}
