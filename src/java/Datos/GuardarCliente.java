/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Datos;

import Conexion.ConexionOSQL;
import Entidades.Cliente;
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
public class GuardarCliente extends ActionSupport implements ModelDriven<Cliente> {

    private Cliente dc_Consumo_Cliente;
    private final ConexionOSQL dc_COnsumo_Con;
    private Connection dc_Consumo_conexion;
    private String dc_consumo_mensaje;
    private String estado;
    private String style;
    private final List<Cliente> dc_consumo_lista;

    public GuardarCliente() {
        dc_COnsumo_Con = new ConexionOSQL();
        dc_Consumo_Cliente = new Cliente();
        dc_consumo_lista = new ArrayList<>();
    }

    public String guardar() {
        try {
            dc_COnsumo_Con.abrirConexion();
            dc_Consumo_conexion = dc_COnsumo_Con.dc_Consumo_Conexion;

            CallableStatement dc_Consumo_procedure = dc_Consumo_conexion.prepareCall("{call crear_cliente(?,?,?,?,?)}");
            dc_Consumo_procedure.setString(1, dc_Consumo_Cliente.getNombres());
            dc_Consumo_procedure.setString(2, dc_Consumo_Cliente.getCiudad());
            dc_Consumo_procedure.setInt(3, dc_Consumo_Cliente.getEdad());
            dc_Consumo_procedure.setString(4, dc_Consumo_Cliente.getSexo());
            dc_Consumo_procedure.setString(5, dc_Consumo_Cliente.getEmail());
            dc_Consumo_procedure.executeUpdate();
            dc_consumo_mensaje = "Datos de cliente insertados";
            style = "alert-success";
            estado = "Éxito";
            return SUCCESS;
        } catch (SQLException e) {
            dc_consumo_mensaje = e.getMessage();
            style = "alert-danfer";
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
            PreparedStatement dc_Consumo_COnsulta = dc_Consumo_conexion.prepareStatement("select * from cliente");
            ResultSet dc_Consumo_datos=dc_Consumo_COnsulta.executeQuery();
            
            while (dc_Consumo_datos.next()) {                
                Cliente dc_consumo_c= new Cliente();  
                dc_consumo_c.setIdCliente(dc_Consumo_datos.getInt(1));
                dc_consumo_c.setNombres(dc_Consumo_datos.getString(2));
                dc_consumo_c.setCiudad(dc_Consumo_datos.getString(3));
                dc_consumo_c.setEdad(dc_Consumo_datos.getInt(4));
                dc_consumo_c.setSexo(dc_Consumo_datos.getString(5));
                dc_consumo_c.setEmail(dc_Consumo_datos.getString(6));
                dc_consumo_lista.add(dc_consumo_c);
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
    public Cliente getModel() {
        return dc_Consumo_Cliente;
    }

    public List<Cliente> getDc_consumo_lista() {
        return dc_consumo_lista;
    }

    public Cliente getDc_Consumo_Cliente() {
        return dc_Consumo_Cliente;
    }

    public void setDc_Consumo_Cliente(Cliente dc_Consumo_Cliente) {
        this.dc_Consumo_Cliente = dc_Consumo_Cliente;
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
