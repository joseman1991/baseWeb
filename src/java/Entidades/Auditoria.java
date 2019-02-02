/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entidades;

/**
 *
 * @author JOSE
 */
public class Auditoria {

    private String usuario;
    private String fecha;
    private String hora;
    private String v_viejo;
    private String v_nuevo;

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getV_viejo() {
        return v_viejo;
    }

    public void setV_viejo(String v_viejo) {
        this.v_viejo = v_viejo;
    }

    public String getV_nuevo() {
        return v_nuevo;
    }

    public void setV_nuevo(String v_nuevo) {
        this.v_nuevo = v_nuevo;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }
    
    
    
    
}
