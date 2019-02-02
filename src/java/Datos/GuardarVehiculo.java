/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Datos;

import Conexion.ConexionOSQL;
import Entidades.Cliente;
import Entidades.Vehiculo;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author JOSE
 */
public class GuardarVehiculo extends ActionSupport implements ModelDriven<Vehiculo> {

    private Vehiculo dc_Consumo_Vehiculo;
    private final ConexionOSQL dc_COnsumo_Con;
    private Connection dc_Consumo_conexion;
    private String dc_consumo_mensaje;
    private String estado;
    private String style;
    private final List<Vehiculo> dc_consumo_lista;

    public GuardarVehiculo() {
        dc_COnsumo_Con = new ConexionOSQL();
        dc_Consumo_Vehiculo = new Vehiculo();
        dc_consumo_lista = new ArrayList<>();
    }

    public String guardar() {
        try {
            dc_COnsumo_Con.abrirConexion();
            dc_Consumo_conexion = dc_COnsumo_Con.dc_Consumo_Conexion;

            CallableStatement dc_Consumo_procedure = dc_Consumo_conexion.prepareCall("{call crear_vehiculo(?,?,?,?)}");
            dc_Consumo_procedure.setString(1, dc_Consumo_Vehiculo.getPlaca());
            dc_Consumo_procedure.setInt(2, dc_Consumo_Vehiculo.getCilindraje());
            dc_Consumo_procedure.setFloat(3, dc_Consumo_Vehiculo.getPrecio());
            dc_Consumo_procedure.setString(4, dc_Consumo_Vehiculo.getColor());
            dc_Consumo_procedure.executeUpdate();
            dc_consumo_mensaje = "Datos de vehículo insertados";
            style = "alert-success";
            estado = "Éxito";
            return SUCCESS;
        } catch (SQLException e) {
            dc_consumo_mensaje = e.getMessage();
            style = "alert-danger";
            estado = "Error";
            return ERROR;
        } finally {
            try {
                if (dc_Consumo_conexion != null) {
                    dc_Consumo_conexion.close();
                }
            } catch (SQLException e) {
                dc_consumo_mensaje = e.getMessage();
            }
        }
    }

    public void obteLista() {
        try {
            dc_COnsumo_Con.abrirConexion();
            dc_Consumo_conexion = dc_COnsumo_Con.dc_Consumo_Conexion;
            dc_consumo_lista.clear();
            PreparedStatement dc_Consumo_COnsulta = dc_Consumo_conexion.prepareStatement("select * from vehiculo order by idvehiculo desc");
            ResultSet dc_Consumo_datos=dc_Consumo_COnsulta.executeQuery();
            
            while (dc_Consumo_datos.next()) {                
                Vehiculo dc_consumo_v= new Vehiculo();  
                dc_consumo_v.setIdVehiculo(dc_Consumo_datos.getInt(1));
                dc_consumo_v.setPlaca(dc_Consumo_datos.getString(2));
                dc_consumo_v.setCilindraje(dc_Consumo_datos.getInt(3));
                dc_consumo_v.setPrecio(dc_Consumo_datos.getFloat(4));
                dc_consumo_v.setColor(dc_Consumo_datos.getString(5));
                dc_consumo_lista.add(dc_consumo_v);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            try {
                if (dc_Consumo_conexion != null) {
                    dc_Consumo_conexion.close();
                }
            } catch (SQLException e) {
                dc_consumo_mensaje = e.getMessage();
            }
        }
    }

    @Override
    public Vehiculo getModel() {
        return dc_Consumo_Vehiculo;
    }

    public List<Vehiculo> getDc_consumo_lista() {
        return dc_consumo_lista;
    }

    public Vehiculo getDc_Consumo_Vehiculo() {
        return dc_Consumo_Vehiculo;
    }

    public void setDc_Consumo_Vehiculo(Vehiculo dc_Consumo_Vehiculo) {
        this.dc_Consumo_Vehiculo = dc_Consumo_Vehiculo;
    }

    public String getDc_consumo_mensaje() {
        return dc_consumo_mensaje;
    }

    public void setDc_consumo_mensaje(String dc_consumo_mensaje) {
        this.dc_consumo_mensaje = dc_consumo_mensaje;
    }

    public String getEstado() {
        return estado;
    }

    public String getStyle() {
        return style;
    }

}
