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
public class Agencia {

    private int IdAgencia;
    private String Nombre;
    private String Region;
    private String Ciudad;

    public int getIdAgencia() {
        return IdAgencia;
    }

    public void setIdAgencia(int IdAgencia) {
        this.IdAgencia = IdAgencia;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getRegion() {
        return Region;
    }

    public void setRegion(String Region) {
        this.Region = Region;
    }

    public String getCiudad() {
        return Ciudad;
    }

    public void setCiudad(String Ciudad) {
        this.Ciudad = Ciudad;
    }

}
