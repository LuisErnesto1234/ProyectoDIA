package com.daza.api.servlet.controlagua.controllers;

import com.daza.api.servlet.controlagua.dto.Usuario;
import com.daza.api.servlet.controlagua.service.UsuarioService;
import com.daza.api.servlet.controlagua.service.UsuarioServiceImp;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.List;

@WebServlet("/user")
public class UsuarioServlet extends HttpServlet {

    //TODO: Service instancia necesaria
    UsuarioService service = new UsuarioServiceImp();
    private static boolean yaEjecuto = false; // Asegúrate de que sea estática para que persista a nivel de clase

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
                default:
                    resp.sendError(HttpServletResponse.SC_NOT_FOUND);
                    break;
            }
        }
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

        LocalDate fechaHoy = LocalDate.now();
        boolean esDomingo = fechaHoy.getDayOfWeek() == DayOfWeek.SUNDAY;

        // Verificar si es domingo y si ya se ha ejecutado esta semana
        if (esDomingo && (ultimaEjecucion == null || !ultimaEjecucion.isEqual(fechaHoy))) {
            // Ejecutar la actualización
            usuarioService.actualizarUsuariosMinutos(listaUsuarios);

            // Actualizar la última ejecución
            ultimaEjecucion = fechaHoy;
        }

        req.setAttribute("lista", listaUsuarios);
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
