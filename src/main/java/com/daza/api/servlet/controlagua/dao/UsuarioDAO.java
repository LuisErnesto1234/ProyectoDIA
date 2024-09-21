package com.daza.api.servlet.controlagua.dao;

import com.daza.api.servlet.controlagua.dto.Usuario;
import com.daza.api.servlet.controlagua.util.ConexionMySQL;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDAO {
    /*TODO: DEFINIMOS CONSTANTES DE USO:*/
    private static final String SQL_SELECT = "SELECT * FROM tb_usuarios";
    private static final String SQL_INSERT = "INSERT INTO tb_usuarios (nombre, apellidos, username, pass, horas_acumuladas, minutos_gratis_semana, rol) VALUES (?,?,?,?,?,?,?)";
    private static final String SQL_DELETE = "DELETE FROM tb_usuarios WHERE id_usuario=?";
    private static final String SQL_UPDATE = "UPDATE tb_usuarios SET nombre=?, apellidos=?, username=?, pass=?, horas_acumuladas=?, minutos_gratis_semana=?, rol=? WHERE id_usuario=?";
    private static final String SQL_FIND_BY_ID = "SELECT * FROM tb_usuarios WHERE id_usuario = ?";
    private static final String SQL_OBTENER_POR_NOMBRE = "SELECT * FROM tb_usuarios WHERE username = ? AND pass = ?";

    /*TODO: IMPLEMENTAMOS EL MÉTODO PARA RETORNAR UN LISTADO DE USUARIOS:*/
    public List<Usuario> getUsuarios() {
        List<Usuario> usuarios = new ArrayList<>();

        try (Connection cn = ConexionMySQL.getConexion()) {
            assert cn != null;
            try (PreparedStatement ps = cn.prepareStatement(SQL_SELECT);
                 ResultSet rs = ps.executeQuery()) {
                    while (rs.next()){
                        Usuario user = new Usuario(
                                rs.getInt("id_usuario"),
                                rs.getString("nombre"),
                                rs.getString("apellidos"),
                                rs.getString("username"),
                                rs.getString("pass"),
                                rs.getDouble("horas_acumuladas"),
                                rs.getInt("minutos_gratis_semana"),
                                rs.getString("rol")
                        );

                                usuarios.add(user);
                    }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return usuarios;
    }

    public void insertUsuarios(Usuario user){
        try (Connection cn = ConexionMySQL.getConexion();
        PreparedStatement ps = cn.prepareStatement(SQL_INSERT)){

            ps.setString(1, user.getNombre());
            ps.setString(2, user.getApellido());
            ps.setString(3, user.getUsername());
            ps.setString(4, user.getPassword());
            ps.setDouble(5, user.getHorasAcumuladas());
            ps.setInt(6, user.getMinutosGratisSemana());
            ps.setString(7, user.getRol());
            ps.executeUpdate();

    }catch (SQLException e) {
        e.printStackTrace();
    }
}

    public void deleteUsuario(int id){
        try (Connection cn = ConexionMySQL.getConexion();
             PreparedStatement ps = cn.prepareStatement(SQL_DELETE)){

            ps.setInt(1, id);
            ps.executeUpdate();

        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    public void updateUsuario(Usuario user){
        try(Connection cn = ConexionMySQL.getConexion();
        PreparedStatement ps = cn.prepareStatement(SQL_UPDATE)){
            ps.setString(1, user.getNombre());
            ps.setString(2, user.getApellido());
            ps.setString(3, user.getUsername());
            ps.setString(4, user.getPassword());
            ps.setDouble(5, user.getHorasAcumuladas());
            ps.setInt(6, user.getMinutosGratisSemana());
            ps.setString(7, user.getRol());
            ps.setInt(8, user.getId());
            ps.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    public Usuario findUsuarioById(int id){
        try(Connection cn = ConexionMySQL.getConexion();
        PreparedStatement ps = cn.prepareStatement(SQL_FIND_BY_ID)){
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()){
                if (rs.next()){
                    return new Usuario(rs.getInt("id_usuario"),
                            rs.getString("nombre"),
                            rs.getString("apellidos"),
                            rs.getString("username"),
                            rs.getString("pass"),
                            rs.getDouble("horas_acumuladas"),
                            rs.getInt("minutos_gratis_semana"),
                            rs.getString("rol"));
                }
            }catch (Exception e){
                e.printStackTrace();
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return null;
    }

    public Usuario findUsuarioByUsernamePassword(String username, String password){
        try(Connection cn = ConexionMySQL.getConexion();
        PreparedStatement ps = cn.prepareStatement(SQL_OBTENER_POR_NOMBRE)){
            ps.setString(1, username);
            ps.setString(2, password);
            try (ResultSet rs = ps.executeQuery()){
                if (rs.next()){
                    return new Usuario(rs.getInt("id_usuario"),
                            rs.getString("nombre"),
                            rs.getString("apellidos"),
                            rs.getString("username"),
                            rs.getString("pass"),
                            rs.getDouble("horas_acumuladas"),
                            rs.getInt("minutos_gratis_semana"),
                            rs.getString("rol"));
                }
            }catch (Exception e){
                e.printStackTrace();
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return null;
    }

}
