package com.daza.api.servlet.controlagua.service;

import com.daza.api.servlet.controlagua.dto.Registro;
import com.daza.api.servlet.controlagua.dto.Usuario;
import java.time.LocalTime;
import java.util.List;

public interface RegistroService {
    List<Registro> obtenerRegistros();
    List<Registro> obtenerRegistrosPorIdUsuario(int id);
    void agregarRegistro(Registro registro);
    void editarRegistro(Registro registro);
    void eliminarRegistroFecha(Registro registro);
    Registro obtenerRegistroPorId(int id);
    void actualizarMinutosUsuario(Usuario usuario, Registro registro);
}
