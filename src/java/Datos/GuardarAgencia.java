/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Datos;

import Conexion.ConexionOSQL;
import Entidades.Agencia;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

 
public class GuardarAgencia extends ActionSupport implements ModelDriven<Agencia> {

    private Agencia dc_Consumo_Agencia;
    private final ConexionOSQL dc_COnsumo_Con;
    private Connection dc_Consumo_conexion;
    private String dc_consumo_mensaje;
    private String estado;
    private String style;
    private final List<Agencia> dc_consumo_lista;

    public GuardarAgencia() {
        dc_COnsumo_Con = new ConexionOSQL();
        dc_Consumo_Agencia = new Agencia();
        dc_consumo_lista = new ArrayList<>();
    }

    public String guardar() {
        try {
            dc_COnsumo_Con.abrirConexion();
            dc_Consumo_conexion = dc_COnsumo_Con.dc_Consumo_Conexion;

            CallableStatement dc_Consumo_procedure = dc_Consumo_conexion.prepareCall("{call crear_agencia(?,?,?)}");
            dc_Consumo_procedure.setString(1, dc_Consumo_Agencia.getNombre());
            dc_Consumo_procedure.setString(2, dc_Consumo_Agencia.getRegion());
            dc_Consumo_procedure.setString(3, dc_Consumo_Agencia.getCiudad());
            dc_Consumo_procedure.executeUpdate();
            dc_consumo_mensaje = "Datos de agencia insertados";
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
            PreparedStatement dc_Consumo_COnsulta = dc_Consumo_conexion.prepareStatement("select * from Agencia order by idAgencia desc");
            ResultSet dc_Consumo_datos=dc_Consumo_COnsulta.executeQuery();
            
            while (dc_Consumo_datos.next()) {                
                Agencia dc_consumo_c= new Agencia();  
                dc_consumo_c.setIdAgencia(dc_Consumo_datos.getInt(1));
                dc_consumo_c.setNombre(dc_Consumo_datos.getString(2));
                dc_consumo_c.setRegion(dc_Consumo_datos.getString(3));
                dc_consumo_c.setCiudad(dc_Consumo_datos.getString(4));
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
    public Agencia getModel() {
        return dc_Consumo_Agencia;
    }

    public List<Agencia> getDc_consumo_lista() {
        return dc_consumo_lista;
    }

    public Agencia getDc_Consumo_Agencia() {
        return dc_Consumo_Agencia;
    }

    public void setDc_Consumo_Agencia(Agencia dc_Consumo_Agencia) {
        this.dc_Consumo_Agencia = dc_Consumo_Agencia;
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
