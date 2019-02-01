package Conexion;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ConexionOSQL {

    public Connection dc_Consumo_Conexion;
   

    public void abrirConexion() throws SQLException {
        String url;
        String usuario = ("admin_vehiculos");
        String clave = ("adminvehiculos");
        String BaseDeDatos = ("XE");
        String puerto = ("1521");
        String servidor = ("localhost");
        try {
            Class.forName("oracle.jdbc.OracleDriver");
            url = "jdbc:oracle:thin:@" + servidor + ":" + puerto + ":" + BaseDeDatos;
            dc_Consumo_Conexion = DriverManager.getConnection(url, usuario, clave);
        } catch (ClassNotFoundException ex) {
            System.out.println(ex.getMessage());
        }
    }

    
 

   

   
   

}
