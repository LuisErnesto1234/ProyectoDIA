package com.daza.api.servlet.controlagua.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;


@WebServlet("/logout")
// Esta clase implementa el servlet de logout que desloguea al usuario y redirecciona a la página principal.
public class LogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession sesion = req.getSession(false);

        if (sesion != null){
            sesion.invalidate(); // Destruye la sesión
        }

        resp.sendRedirect(req.getContextPath() + "/login.jsp");
    }
}
