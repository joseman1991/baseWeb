/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Datos;

import Conexion.ConexionOSQL;
import Entidades.Auditoria;
import Entidades.Reserva;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import oracle.jdbc.OracleTypes;

/**
 *
 * @author
 */
public class ConsultarReservas extends ActionSupport implements ModelDriven<Reserva> {

    private final ConexionOSQL dc_COnsumo_Con;
    private Connection dc_Consumo_conexion;
    private String dc_consumo_mensaje;
    private Reserva dc_Consumo_Reserva;
    private String estado;
    private String style;
    private final List<Reserva> dc_consumo_lista;
    private final List<Auditoria> dc_consumo_listaA;

    public ConsultarReservas() {
        dc_COnsumo_Con = new ConexionOSQL();
        dc_consumo_lista = new ArrayList<>();
        dc_consumo_listaA = new ArrayList<>();
        dc_Consumo_Reserva = new Reserva();
    }

    public String obteLista() {
        try {
            dc_COnsumo_Con.abrirConexion();
            dc_Consumo_conexion = dc_COnsumo_Con.dc_Consumo_Conexion;
            dc_consumo_lista.clear();
            CallableStatement dc_Consumo_procedure = dc_Consumo_conexion.prepareCall("{call ver_reservas(?,?)}");
            if (dc_Consumo_Reserva.getPlaca() == null) {
                dc_Consumo_Reserva.setPlaca("");
            }
            dc_Consumo_procedure.setString(1, dc_Consumo_Reserva.getPlaca());
            dc_Consumo_procedure.registerOutParameter(2, OracleTypes.CURSOR);
            dc_Consumo_procedure.executeUpdate();
            ResultSet dc_Consumo_datos = (ResultSet) dc_Consumo_procedure.getObject(2);

            while (dc_Consumo_datos.next()) {
                Reserva dc_consumo_r = new Reserva();
                dc_consumo_r.setIdreserva(dc_Consumo_datos.getInt(1));
                dc_consumo_r.setPlaca(dc_Consumo_datos.getString(2));
                dc_consumo_r.setCostro(dc_Consumo_datos.getString(3));
                dc_consumo_r.setNombres(dc_Consumo_datos.getString(4));
                dc_consumo_r.setSexo(dc_Consumo_datos.getString(5));
                dc_consumo_r.setFechainicio(dc_Consumo_datos.getString(6));
                dc_consumo_r.setFechafin(dc_Consumo_datos.getString(7));
                dc_consumo_lista.add(dc_consumo_r);
            }
            obtenerLIsta();
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
        return SUCCESS;
    }

    public String obternReserva() {
        try {
            dc_COnsumo_Con.abrirConexion();
            dc_Consumo_conexion = dc_COnsumo_Con.dc_Consumo_Conexion;
            PreparedStatement dc_Consumo_consulta = dc_Consumo_conexion.prepareStatement("select costo from reserva where idreserva=?");
            dc_Consumo_consulta.setInt(1, dc_Consumo_Reserva.getIdreserva());
            ResultSet dc_Consumo_datos = dc_Consumo_consulta.executeQuery();
            if (dc_Consumo_datos.next()) {
                dc_Consumo_Reserva.setCostro(dc_Consumo_datos.getString(1));
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
        return SUCCESS;
    }

    private void obtenerLIsta() {
        try {
            dc_COnsumo_Con.abrirConexion();
            dc_Consumo_conexion = dc_COnsumo_Con.dc_Consumo_Conexion;
            dc_consumo_listaA.clear();
            CallableStatement dc_Consumo_procedure = dc_Consumo_conexion.prepareCall("{call ver_auditoria(?)}");

            dc_Consumo_procedure.registerOutParameter(1, OracleTypes.CURSOR);
            dc_Consumo_procedure.executeUpdate();
            ResultSet dc_Consumo_datos = (ResultSet) dc_Consumo_procedure.getObject(1);

            while (dc_Consumo_datos.next()) {
                Auditoria dc_consumo_r = new Auditoria();
                dc_consumo_r.setUsuario(dc_Consumo_datos.getString(1));
                dc_consumo_r.setFecha(dc_Consumo_datos.getString(2));
                dc_consumo_r.setHora(dc_Consumo_datos.getString(3));
                dc_consumo_r.setV_nuevo(dc_Consumo_datos.getString(4));
                dc_consumo_r.setHora(dc_Consumo_datos.getString(5));
                dc_consumo_listaA.add(dc_consumo_r);
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
    public Reserva getModel() {
        return dc_Consumo_Reserva;
    }

    public void setDc_Consumo_Reserva(Reserva dc_Consumo_Reserva) {
        this.dc_Consumo_Reserva = dc_Consumo_Reserva;
    }

    public Reserva getDc_Consumo_Reserva() {
        return dc_Consumo_Reserva;
    }

    public List<Reserva> getDc_consumo_lista() {
        return dc_consumo_lista;
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

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getStyle() {
        return style;
    }

    public void setStyle(String style) {
        this.style = style;
    }

}
