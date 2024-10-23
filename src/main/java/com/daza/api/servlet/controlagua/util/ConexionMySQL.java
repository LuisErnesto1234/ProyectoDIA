package com.daza.api.servlet.controlagua.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionMySQL {
    // Constantes de uso para la conexión a la base de datos
    private static final String URL = "jdbc:mysql://localhost:3306/db_divino_nino?allowOldPassword=true";
    private static final String USER = "root";
    private static final String PASSWORD = "Virtual2023@";

    // Método para conectar a la base de datos
    public static Connection getConexion() {
        Connection cn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            cn = DriverManager.getConnection(URL, USER, PASSWORD);
            return cn;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return cn;
    }
}
