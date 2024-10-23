package com.daza.api.servlet.controlagua.controllers;

import com.daza.api.servlet.controlagua.dao.UsuarioDAO;
import com.daza.api.servlet.controlagua.dto.Usuario;
import com.daza.api.servlet.controlagua.service.UsuarioService;
import com.daza.api.servlet.controlagua.service.UsuarioServiceImp;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/buscar")
public class BuscadorServlet extends HttpServlet {

    private UsuarioDAO usuarioDAO = new UsuarioDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener el parámetro de búsqueda
        String query = request.getParameter("query");

        // Obtener lista de usuarios filtrados
        List<Usuario> usuarios = usuarioDAO.findUserByName(query);

        // Convertir la lista en JSON usando Gson
        Gson gson = new Gson();
        String jsonResponse = gson.toJson(usuarios);

        // Configurar respuesta JSON
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Enviar la respuesta JSON
        PrintWriter out = response.getWriter();
        out.print(jsonResponse);
        out.flush();
    }
}
