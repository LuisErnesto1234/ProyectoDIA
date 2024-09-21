package com.daza.api.servlet.controlagua.service;

import com.daza.api.servlet.controlagua.dto.Registro;
import com.daza.api.servlet.controlagua.dto.Usuario;

import java.util.List;

public interface UsuarioService {
    List<Usuario> listarUsuarios();
    Usuario obtenerUsuarioPorId(int id);
    void agregarUsuario(Usuario usuario);
    void editarUsuario(Usuario usuario);
    void eliminarUsuario(int id);
    void acumularMinutosUsuarios(Usuario usuario);
    void actualizarUsuariosMinutos(List<Usuario> lista);
}
