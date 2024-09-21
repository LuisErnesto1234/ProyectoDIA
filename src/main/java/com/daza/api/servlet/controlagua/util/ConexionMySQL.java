package com.daza.api.servlet.controlagua.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

public class ConexionMySQL {
    //TODO: Constantes de uso para la conexion a la bade de datos
    private static final String URL = "jdbc:mysql://localhost:3306/db_divino_nino";
    private static final String USER = "root";
    private static final String PASSWORD = "mysql";

    //TODO: Metodos para conectar a la base de datos

    public static Connection getConexion(){
        Connection cn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            cn = DriverManager.getConnection(URL, USER, PASSWORD);
            return cn;
        }catch (SQLException | ClassNotFoundException e){
            e.printStackTrace();
        }

        return cn;
    }

    //TODO pruebas


}
