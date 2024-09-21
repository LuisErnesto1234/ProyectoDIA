package com.daza.api.servlet.controlagua.dto;

import java.time.LocalDate;
import java.time.LocalTime;

public class Registro {
    private int id;
    private int idUsuario;
    private LocalDate fecha;
    private LocalTime horaInicio;
    private LocalTime horaFin;
    private int minutosUtilizados;

    public Registro(int id, int idUsuario, LocalDate fecha, LocalTime horaInicio, LocalTime horaFin, int minutosUtilizados) {
        this.id = id;
        this.idUsuario = idUsuario;
        this.fecha = fecha;
        this.horaInicio = horaInicio;
        this.horaFin = horaFin;
        this.minutosUtilizados = minutosUtilizados;
    }

    public Registro() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public LocalDate getFecha() {
        return fecha;
    }

    public void setFecha(LocalDate fecha) {
        this.fecha = fecha;
    }

    public LocalTime getHoraInicio() {
        return horaInicio;
    }

    public void setHoraInicio(LocalTime horaInicio) {
        this.horaInicio = horaInicio;
    }

    public LocalTime getHoraFin() {
        return horaFin;
    }

    public void setHoraFin(LocalTime horaFin) {
        this.horaFin = horaFin;
    }

    public int getMinutosUtilizados() {
        return minutosUtilizados;
    }

    public void setMinutosUtilizados(int minutosUtilizados) {
        this.minutosUtilizados = minutosUtilizados;
    }

    @Override
    public String toString() {
        return "Registro{" +
                "id=" + id +
                ", idUsuario=" + idUsuario +
                ", fecha=" + fecha +
                ", horaInicio=" + horaInicio +
                ", horaFin=" + horaFin +
                ", minutosUtilizados=" + minutosUtilizados +
                '}';
    }
}
