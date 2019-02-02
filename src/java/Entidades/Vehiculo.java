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
public class Vehiculo {

    private int IdVehiculo;
    private String Placa;
    private int Cilindraje;
    private float Precio;
    private String Color;

    public int getIdVehiculo() {
        return IdVehiculo;
    }

    public void setIdVehiculo(int IdVehiculo) {
        this.IdVehiculo = IdVehiculo;
    }

    public String getPlaca() {
        return Placa;
    }

    public void setPlaca(String Placa) {
        this.Placa = Placa;
    }

    public int getCilindraje() {
        return Cilindraje;
    }

    public void setCilindraje(int Cilindraje) {
        this.Cilindraje = Cilindraje;
    }

    public float getPrecio() {
        return Precio;
    }

    public void setPrecio(float Precio) {
        this.Precio = Precio;
    }

    public String getColor() {
        return Color;
    }

    public void setColor(String Color) {
        this.Color = Color;
    }
    
    
    
    
}
