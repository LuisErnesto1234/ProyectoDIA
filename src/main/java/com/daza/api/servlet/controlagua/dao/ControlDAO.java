package com.daza.api.servlet.controlagua.dao;

import com.daza.api.servlet.controlagua.dto.Registro;
import com.daza.api.servlet.controlagua.service.RegistroServiceImp;
import com.daza.api.servlet.controlagua.util.ConexionMySQL;

import java.sql.*;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

public class ControlDAO {
    // TODO: Implementar métodos para interactuar con la base de datos
    private static final String SQL_INSERT = "INSERT INTO registro_agua (id_usuario, fecha, hora_inicio, hora_fin, minutos_utilizados) VALUES (?,?,?,?,?);";
    private static final String SQL_SELECT_BY_USUARIO = "SELECT * FROM registro_agua WHERE id_usuario = ? ORDER BY fecha DESC;";
    private static final String SQL_SELECT = "SELECT * FROM registro_agua";
    private static final String SQL_SELECT_BY_ID = "SELECT * FROM registro_agua WHERE id_registro =?;";
    private static final String SQL_UPDATE = "UPDATE registro_agua SET id_usuario=?, fecha=?, hora_inicio=?, hora_fin=?, minutos_utilizados=? WHERE id_registro=?;";
    private static final String SQL_DELETE_FECHA = "DELETE FROM registro_agua WHERE id_registro = ? AND fecha =?;";

    //TODO: Metodos para CRUD
    public List<Registro> getRegistros(){
        List<Registro> registros = new ArrayList<>();
        try(Connection cn = ConexionMySQL.getConexion();
            PreparedStatement ps = cn.prepareStatement(SQL_SELECT);
            ResultSet rs = ps.executeQuery()){

            while (rs.next()){

                int idRegistro = rs.getInt("id_registro");
                int idUsuario = rs.getInt("id_usuario");
                LocalDate fecha = rs.getDate("fecha").toLocalDate();
                LocalTime horaInicio = rs.getTime("hora_inicio").toLocalTime();
                LocalTime horaFin = rs.getTime("hora_fin").toLocalTime();
                int minutosUtilizados = rs.getInt("minutos_utilizados");

                Registro registro = new Registro(idRegistro, idUsuario, fecha, horaInicio, horaFin, minutosUtilizados);
                registros.add(registro);
            }

        }catch (SQLException e){
            e.printStackTrace();
        }
            return registros;
    }

    public List<Registro> getRegistrosByIdUsuario(int id){
        List<Registro> registros = new ArrayList<>();
        try(Connection cn = ConexionMySQL.getConexion();
            PreparedStatement ps = cn.prepareStatement(SQL_SELECT_BY_USUARIO)){
            ps.setInt(1, id);
            try(ResultSet rs = ps.executeQuery()){

            while (rs.next()){

                int idRegistro = rs.getInt("id_registro");
                int idUsuario = rs.getInt("id_usuario");
                LocalDate fecha = rs.getDate("fecha").toLocalDate();
                LocalTime horaInicio = rs.getTime("hora_inicio").toLocalTime();
                LocalTime horaFin = rs.getTime("hora_fin").toLocalTime();
                int minutosUtilizados = rs.getInt("minutos_utilizados");

                Registro registro = new Registro(idRegistro, idUsuario, fecha, horaInicio, horaFin, minutosUtilizados);
                registros.add(registro);
            }

        }catch (SQLException | NumberFormatException e){
            e.printStackTrace();
        }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return registros;
    }

    public void insertRegistro(Registro registro){
        try (Connection cn = ConexionMySQL.getConexion();
             PreparedStatement ps = cn.prepareStatement(SQL_INSERT)) {

            ps.setInt(1, registro.getIdUsuario());

            // Convertir LocalDate a java.sql.Date
            ps.setDate(2, java.sql.Date.valueOf(registro.getFecha()));

            // Convertir LocalTime a java.sql.Time directamente en el PreparedStatement
            ps.setTime(3, Time.valueOf(registro.getHoraInicio()));
            ps.setTime(4, Time.valueOf(registro.getHoraFin()));

            // Calcular minutos utilizados
            ps.setInt(5, RegistroServiceImp.calcularMinutos(registro.getHoraInicio(), registro.getHoraFin()));

            ps.executeUpdate();
        }catch (SQLException e){
            System.out.println("Error: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public void updateRegistro(Registro registro){
        try (Connection cn = ConexionMySQL.getConexion();
        PreparedStatement ps = cn.prepareStatement(SQL_UPDATE)){

            ps.setInt(1, registro.getIdUsuario());

            //Trabajar con fechas
            ps.setDate(2, java.sql.Date.valueOf(registro.getFecha()));

            //Trabajar con horas
            ps.setTime(3, java.sql.Time.valueOf(registro.getHoraInicio()));
            ps.setTime(4, java.sql.Time.valueOf(registro.getHoraFin()));
            int minutos = RegistroServiceImp.calcularMinutos(registro.getHoraInicio(), registro.getHoraFin());
            ps.setInt(5, minutos);
            ps.setInt(6, registro.getId());
            ps.executeUpdate();

        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    public Registro getRegistroById(int id){
        try(Connection cn = ConexionMySQL.getConexion();
        PreparedStatement ps = cn.prepareStatement(SQL_SELECT_BY_ID)){
            ps.setInt(1, id);
            try(ResultSet rs = ps.executeQuery()){

                if (rs.next()){

                    int idRegistro = rs.getInt("id_registro");
                    int idUsuario = rs.getInt("id_usuario");
                    //Trabajar con fechas
                    LocalDate fecha = rs.getDate("fecha").toLocalDate();
                    //Trabajar con horas
                    LocalTime horaInicio = rs.getTime("hora_inicio").toLocalTime();
                    LocalTime horaFin = rs.getTime("hora_fin").toLocalTime();
                    int minutosUtilizados = rs.getInt("minutos_utilizados");

                    return new Registro(idRegistro, idUsuario, fecha, horaInicio, horaFin, minutosUtilizados);
                }

            }catch (SQLException | NumberFormatException e){
                e.printStackTrace();
            }

        }catch (SQLException e){
            e.printStackTrace();
        }

        return null;
    }

    public void deleteRegistro(Registro registro){
        try (Connection cn = ConexionMySQL.getConexion();
        PreparedStatement ps = cn.prepareStatement(SQL_DELETE_FECHA)){

            ps.setInt(1, registro.getId());
            ps.setDate(2, java.sql.Date.valueOf(registro.getFecha()));
            ps.executeUpdate();

        }catch (SQLException e){
            System.out.println("Error: " + e.getMessage());
            e.printStackTrace();
        }
    }

}
