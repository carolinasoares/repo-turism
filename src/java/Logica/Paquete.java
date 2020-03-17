/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Logica;

import java.io.Serializable;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import javax.persistence.*;

/**
 *
 * @author Caro
 */
@Entity
public class Paquete implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_paquete;
    @Basic
    private String nombre;
    @Basic
    private String descripcion;
    @Basic
    private double precio;
    @Basic
    @Temporal (TemporalType.TIMESTAMP)
    private Date fromFecha;
    @Basic
    @Temporal (TemporalType.TIMESTAMP)
    private Date toFecha;
    @Basic
    private boolean baja;
    @OneToOne
    private Promocion promocion;
    @OneToMany
    private List<Servicio> servicios;

    public Paquete() {
    }

    public Paquete(String nombre, String descripcion, Promocion promocion, List<Servicio> servicios) {
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.promocion = promocion;
        this.servicios = servicios;
    }

    public Paquete(String nombre, String descripcion, List<Servicio> servicios) {
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.servicios = servicios;
    }

    public Paquete(int id_paquete, String nombre, String descripcion, Promocion promocion) {
        this.id_paquete = id_paquete;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.promocion = promocion;
        this.precio = 0;
        this.baja = false;
    }
    
    public Paquete(String nombre, String descripcion, Promocion promocion) {
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.promocion = promocion;
        this.precio = 0;
        this.baja = false;
    }

    public Paquete(int id_paquete, String nombre, String descripcion) {
        this.id_paquete = id_paquete;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.precio = 0;
        this.promocion = null;
        this.baja = false;
    }
    
    public Paquete(String nombre, String descripcion) {
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.precio = 0;
        this.promocion = null;
        this.baja = false;
    }

    public int getId_paquete() {
        return id_paquete;
    }

    public String getNombre() {
        return nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public Promocion getPromocion() {
        return promocion;
    }

    public void setPromocion(Promocion promocion) {
        this.promocion = promocion;
    }
    
    public List<Servicio> getServicios() {
        return servicios;
    }

    public double getPrecio() {
        return precio;
    }

    public Date getFromFecha() {
        return fromFecha;
    }

    public Date getToFecha() {
        return toFecha;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public boolean isBaja() {
        return baja;
    }

    public void setBaja(boolean baja) {
        this.baja = baja;
    }
    
    public static int obtenerNuevoCodigo(List<Paquete> elementos){
        int codigo = 1;
        if(elementos.isEmpty()) return codigo;
        else{
            codigo = 0;
            boolean ban = true;
            do{
                codigo++;
                for(Paquete unElemento : elementos){
                    if(unElemento.getId_paquete() == codigo){
                        ban = true;
                        break;
                    }else ban = false;
                }
            }while(ban);
            return codigo;
        }
        
    }
    
    public void modificarPaquete(String nombre, String descripcion, Promocion promocion, List<Servicio> servicios){
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.promocion = promocion;
        this.servicios = servicios;
    }
    
    public void modificarPaquete(String nombre, String descripcion, List<Servicio> servicios){
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.servicios = servicios;
    }
    
    public void modificarPaquete(String nombre, String descripcion, Promocion promocion){
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.promocion = promocion;
    }
    
    public void modificarPaquete(String nombre, String descripcion){
        this.nombre = nombre;
        this.descripcion = descripcion;
    }
    
    public static void modificarPauqte(List<Paquete> paquetes, Paquete miPaquete){
        for(Paquete unPaquete : paquetes){
            if(unPaquete.getId_paquete() == miPaquete.getId_paquete()){
                paquetes.set(paquetes.indexOf(unPaquete), miPaquete);
                break;
            }
        }
    }
    
    public void quitarServicio(Servicio servicio){
        for(Servicio unServicio : this.servicios){
            if(unServicio.getId_servicio() == servicio.getId_servicio()){
                this.servicios.remove(unServicio);
                break;
            }
        }
    }
    
    public void calcularPrecio(){
        double precio = 0;
        for(Servicio unServicio : this.servicios){
            precio += unServicio.getPrecio();
        }
        if(this.promocion != null){
            double aux = precio - this.promocion.getDescuento();
            if(aux > 0) precio = aux;
        }
        this.precio = precio;
    }
    
    public void calcularFechaInicio(){
        Date fechaInicio = null;
        for(Servicio servicio : this.servicios){
            if(fechaInicio == null) fechaInicio = servicio.getFromFecha();
            else if(fechaInicio.compareTo(servicio.getFromFecha()) >= 0) fechaInicio = servicio.getFromFecha();
        }
        this.fromFecha = fechaInicio;
    }
    
    public void calcularFechaFinalizacion(){
        Date fechaFin = null;
        for(Servicio servicio : this.servicios){
            if(fechaFin == null) fechaFin = servicio.getToFecha();
            if(fechaFin.compareTo(servicio.getToFecha()) <= 0) fechaFin = servicio.getToFecha();
        }
        this.toFecha = fechaFin;
    }
    
    public static List<Paquete> buscarPaquete(List<Paquete> paquetes, String nombre, String descripcion){
        List<Paquete> misPaquetes = new LinkedList();
        for(Paquete paquete : paquetes){
            if(!paquete.isBaja() && paquete.getNombre().contains(nombre) && paquete.getDescripcion().contains(nombre))
                misPaquetes.add(paquete);
        }
        return misPaquetes;
    }
    
    public static List<Paquete> buscarPaquete_nom(List<Paquete> paquetes, String nombre){
        List<Paquete> misPaquetes = new LinkedList();
        for(Paquete paquete : paquetes){
            if(!paquete.isBaja() && paquete.getNombre().contains(nombre))
                misPaquetes.add(paquete);
        }
        return misPaquetes;
    }
    
    public static List<Paquete> buscarPaquete_des(List<Paquete> paquetes, String descripcion){
        List<Paquete> misPaquetes = new LinkedList();
        for(Paquete paquete : paquetes){
            if(!paquete.isBaja() && paquete.getDescripcion().contains(descripcion))
                misPaquetes.add(paquete);
        }
        return misPaquetes;
    }
    
    public static List<Paquete> obtenerPaquetes(List<Paquete> paquetes){
        List<Paquete> misPaquetes = new LinkedList();
        for(Paquete paquete : paquetes){
            if(!paquete.isBaja()) misPaquetes.add(paquete);
        }
        return misPaquetes;
    }
}
