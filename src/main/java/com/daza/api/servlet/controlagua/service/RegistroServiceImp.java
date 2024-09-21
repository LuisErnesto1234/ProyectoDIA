package com.daza.api.servlet.controlagua.service;

import com.daza.api.servlet.controlagua.dao.ControlDAO;
import com.daza.api.servlet.controlagua.dto.Registro;
import com.daza.api.servlet.controlagua.dto.Usuario;

import java.time.Duration;
import java.time.LocalTime;
import java.util.List;

public class RegistroServiceImp implements RegistroService{

    ControlDAO dao = new ControlDAO();

    @Override
    public List<Registro> obtenerRegistros() {
        return dao.getRegistros();
    }

    @Override
    public List<Registro> obtenerRegistrosPorIdUsuario(int id) {
        return dao.getRegistrosByIdUsuario(id);
    }

    @Override
    public void agregarRegistro(Registro registro) {
        dao.insertRegistro(registro);
    }

    @Override
    public void editarRegistro(Registro registro) {
        dao.updateRegistro(registro);
    }

    @Override
    public void eliminarRegistroFecha(Registro registro) {
        dao.deleteRegistro(registro);
    }

    @Override
    public Registro obtenerRegistroPorId(int id) {
        return dao.getRegistroById(id);
    }

    public static int calcularMinutos(LocalTime horaInicio, LocalTime horaFin) {
        // Verifica que horaFin no sea antes que horaInicio, si es necesario
        if (horaFin.isBefore(horaInicio)) {
            throw new IllegalArgumentException("Hora de fin no puede ser antes de la hora de inicio");
        }

        // Calcula la duración entre horaInicio y horaFin
        Duration duracion = Duration.between(horaInicio, horaFin);

        // Obtiene la duración en minutos
        return (int) duracion.toMinutes();
    }

    @Override
    public void actualizarMinutosUsuario(Usuario usuario, Registro registro) {
        UsuarioService usuarioService = new UsuarioServiceImp();
        int minutosUtilizados = registro.getMinutosUtilizados();

        //TODO: el tiempo que junto supero a sus minutos gratis de semana
        if (minutosUtilizados >= usuario.getMinutosGratisSemana()){
            int excesoMinutos = minutosUtilizados - usuario.getMinutosGratisSemana();
            int minutosAcumulados = (int) usuario.getHorasAcumuladas() * 60;
            int restaMinutosAcumulados = minutosAcumulados - excesoMinutos;
            double horasAcumuladasActualizadas = restaMinutosAcumulados / 60.0;
            usuario.setHorasAcumuladas(horasAcumuladasActualizadas);
            usuario.setMinutosGratisSemana(0);
            usuarioService.editarUsuario(usuario);
        } else if (minutosUtilizados < usuario.getMinutosGratisSemana()) {
            //TODO: el tiempo que junto no supero a sus minutos gratis por ello se el descuenta de
            //TODO: de sus minutos gratis
            int minutosGratisUsados = usuario.getMinutosGratisSemana() - minutosUtilizados;
            usuario.setMinutosGratisSemana(minutosGratisUsados);
            usuarioService.editarUsuario(usuario);
        }
    }
}
