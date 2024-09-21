package com.daza.api.servlet.controlagua.controllers;

import com.daza.api.servlet.controlagua.dao.UsuarioDAO;
import com.daza.api.servlet.controlagua.dto.Registro;
import com.daza.api.servlet.controlagua.dto.Usuario;
import com.daza.api.servlet.controlagua.service.RegistroService;
import com.daza.api.servlet.controlagua.service.RegistroServiceImp;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeParseException;
import java.util.List;

@WebServlet("/control")
public class ControlServlet extends HttpServlet {

    //TODO: Instancia del service para hacer uso de sus métodos
    RegistroService service = new RegistroServiceImp();
    UsuarioDAO usuarioDAO = new UsuarioDAO();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if (action != null){
            switch (action) {
                case "listar":
                    listarControl(req, resp);
                    break;
                case "editar":
                    mostrarFormulario(req, resp);
                    break;
                case "eliminar":
                    eliminarControl(req, resp);
                    break;
                default:
                    resp.sendRedirect("index.jsp");
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
                    editarControl(req, resp);
                    break;
                case "agregar":
                    agregarControl(req, resp);
                    break;
                default:
                    resp.sendRedirect("index.jsp");
                    break;
            }
        }
    }

    private void agregarControl(HttpServletRequest req, HttpServletResponse resp )throws IOException, ServletException {
        int idUsuario = Integer.parseInt(req.getParameter("idUsuario"));
        LocalDate fecha = LocalDate.parse(req.getParameter("fecha"));
        LocalTime horaInicio = LocalTime.parse(req.getParameter("horaInicio"));
        LocalTime horaFin = LocalTime.parse(req.getParameter("horaFin"));
        int minutosUtilizados = RegistroServiceImp.calcularMinutos(horaInicio, horaFin);

        Usuario usuario = usuarioDAO.findUsuarioById(idUsuario);
        Registro registro = new Registro(0, idUsuario, fecha, horaInicio, horaFin, minutosUtilizados);

        service.actualizarMinutosUsuario(usuario, registro);

        usuarioDAO.updateUsuario(usuario);
        service.agregarRegistro(registro);
        resp.sendRedirect("control?action=listar");
    }

    private void eliminarControl(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException{
        int id = Integer.parseInt(req.getParameter("id"));
        Registro registro = service.obtenerRegistroPorId(id);
        service.eliminarRegistroFecha(registro);
        resp.sendRedirect("control?action=listar");
    }

    private void mostrarFormulario(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        int id = Integer.parseInt(req.getParameter("id"));
        Registro registro = service.obtenerRegistroPorId(id);
        req.setAttribute("registro", registro);
        req.getRequestDispatcher("editar-control.jsp").forward(req, resp);
    }

    private void listarControl(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException{
        List<Registro> registros = service.obtenerRegistros();
        req.setAttribute("registros", registros);
        req.getRequestDispatcher("listar-control.jsp").forward(req, resp);
    }

    private void editarControl(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        try {
            RegistroService service = new RegistroServiceImp();
            int id = Integer.parseInt(req.getParameter("id"));
            int idUsuario = Integer.parseInt(req.getParameter("idUsuario"));
            LocalDate fecha = LocalDate.parse(req.getParameter("fecha"));
            LocalTime horaInicio = LocalTime.parse(req.getParameter("horaInicio"));
            LocalTime horaFin = LocalTime.parse(req.getParameter("horaFin"));

            // Calcula los minutos utilizados
            int minutosUtilizados = RegistroServiceImp.calcularMinutos(horaInicio, horaFin);

            // Obtiene el usuario y el registro actual
            Usuario usuario = usuarioDAO.findUsuarioById(idUsuario);
            Registro registro = service.obtenerRegistroPorId(id);

            // Edita el registro y actualiza los minutos del usuario
            service.editarRegistro(new Registro(id, idUsuario, fecha, horaInicio, horaFin, minutosUtilizados));
            service.actualizarMinutosUsuario(usuario, registro);

            // Redirige a la lista de controles
            resp.sendRedirect("control?action=listar");
        } catch (NumberFormatException | DateTimeParseException e) {
            // Maneja errores de formato
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Formato de datos inválido");
        } catch (Exception e) {
            // Maneja cualquier otro tipo de excepción
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al procesar la solicitud");
        }
    }

}
