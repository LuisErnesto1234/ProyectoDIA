package com.daza.api.servlet.controlagua.service;

import com.daza.api.servlet.controlagua.dao.UsuarioDAO;
import com.daza.api.servlet.controlagua.dto.Usuario;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.List;

public class UsuarioServiceImp implements UsuarioService{
    UsuarioDAO dao = new UsuarioDAO();
    @Override
    public List<Usuario> listarUsuarios() {
        return dao.getUsuarios();
    }

    @Override
    public Usuario obtenerUsuarioPorId(int id) {
        return dao.findUsuarioById(id);
    }

    @Override
    public void agregarUsuario(Usuario usuario) {
        dao.insertUsuarios(usuario);
    }

    @Override
    public void editarUsuario(Usuario usuario) {
        dao.updateUsuario(usuario);
    }

    @Override
    public void eliminarUsuario(int id) {
        dao.deleteUsuario(id);
    }

    @Override
    public void acumularMinutosUsuarios(Usuario usuario) {
        LocalDate fechaHoy = LocalDate.now();
        int minutosSemana = usuario.getMinutosGratisSemana();
        //TODO Convierto las horas acumuladas a minutos multiplicando por 60
        int minutosAcumulados = (int) usuario.getHorasAcumuladas() * 60;
        int auxiliar;
        double auxiliarDecimal;

        if (fechaHoy.getDayOfWeek() == DayOfWeek.SUNDAY && minutosSemana > 0){
            auxiliar = minutosAcumulados + minutosSemana;
            //TODO convierto la suma de minutos acumulados y minutos de semana restantes a horas
            //todo dividiendo entre 60
            auxiliarDecimal = (double) auxiliar / 60;
            usuario.setHorasAcumuladas(auxiliarDecimal);
            usuario.setMinutosGratisSemana(60);
            dao.updateUsuario(usuario);
        } else if (fechaHoy.getDayOfWeek() == DayOfWeek.SUNDAY && minutosSemana == 0) {
            usuario.setMinutosGratisSemana(60);
            dao.updateUsuario(usuario);
        }
    }

    @Override
    public void actualizarUsuariosMinutos(List<Usuario> lista) {
        for (Usuario usuario : lista){
            acumularMinutosUsuarios(usuario);
        }
    }
}
