package com.daza.api.servlet.controlagua.controllers;

import com.daza.api.servlet.controlagua.dao.UsuarioDAO;
import com.daza.api.servlet.controlagua.dto.Usuario;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    UsuarioDAO dao = new UsuarioDAO();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        // Validar credenciales con base de datos
        if (username != null && password != null){
            Usuario usuario = dao.findUsuarioByUsernamePassword(username, password);
            if (usuario != null){
                req.getSession().setAttribute("usuario", usuario);
                resp.sendRedirect("index.jsp");
            }else {
                req.setAttribute("error", "Usuario o contraseña incorrectos.");
                req.getRequestDispatcher("login.jsp").forward(req, resp);
            }
        }else {
            req.setAttribute("error", "Debe ingresar un nombre de usuario y una contraseña.");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }
}
