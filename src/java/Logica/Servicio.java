/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Logica;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.*;

/**
 *
 * @author Caro
 */
@Entity
public class Servicio implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_servicio;
    @Basic
    private String servicio;
    @Basic
    private String destino;
    @Basic
    @Temporal (TemporalType.TIMESTAMP)
    private Date fromFecha;
    @Basic
    @Temporal (TemporalType.TIMESTAMP)
    private Date toFecha;
    @Basic
    private double precio;
    @Basic
    private boolean baja;

    public Servicio() {
    }

    public Servicio(int id_servicio, String servicio, String destino, String fromFecha, String toFecha, String fromHora, String toHora, double precio) {
        this.id_servicio = id_servicio;
        this.servicio = servicio;
        this.destino = destino;
        this.fromFecha = obtenerFecha(fromFecha, fromHora);
        this.toFecha = obtenerFecha(toFecha, toHora);
        this.precio = precio;
        this.baja = false;
    }
    
    public Servicio(String servicio, String destino, String fromFecha, String toFecha, String fromHora, String toHora, double precio) {
        this.servicio = servicio;
        this.destino = destino;
        this.fromFecha = obtenerFecha(fromFecha, fromHora);
        this.toFecha = obtenerFecha(toFecha, toHora);
        this.precio = precio;
        this.baja = false;
    }

    public int getId_servicio() {
        return id_servicio;
    }

    public String getServicio() {
        return servicio;
    }

    public String getDestino() {
        return destino;
    }

    public Date getFromFecha() {
        return fromFecha;
    }

    public Date getToFecha() {
        return toFecha;
    }

    public double getPrecio() {
        return precio;
    }

    public boolean isBaja() {
        return baja;
    }

    public void setBaja(boolean baja) {
        this.baja = baja;
    }
    
    public static int obtenerNuevoCodigo(List<Servicio> elementos){
        int codigo = 0;
        boolean ban = true;
        do{
            codigo++;
            for(Servicio unElemento : elementos){
                if(unElemento.getId_servicio() == codigo){
                    ban = true;
                    break;
                }else ban = false;
            }
        }while(ban);
        return codigo;
    }
    
    public void modificarServicio(String servicio, String destino, String fromFecha, String toFecha, String fromHora, String toHora, double precio){
        this.servicio = servicio;
        this.destino = destino;
        this.fromFecha = obtenerFecha(fromFecha, fromHora);
        this.toFecha = obtenerFecha(toFecha, toHora);
        this.precio = precio;
    }
    
    public static void modificarServicio(List<Servicio> servicios, Servicio miServicio){
        for(Servicio unServicio : servicios){
            if(unServicio.getId_servicio() == miServicio.getId_servicio()){
                servicios.set(servicios.indexOf(unServicio), miServicio);
                break;
            }
        }
    }
    
    public static Date obtenerFecha(String fecha, String hora){
        String miFecha = fecha + " " + hora;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        Date miFechaDate = new Date();
        try {
            miFechaDate = sdf.parse(miFecha);
            
        } catch (ParseException ex) {
            Logger.getLogger(Servicio.class.getName()).log(Level.SEVERE, null, ex);
        }
        return miFechaDate;
    }
    
    public static void buscarServicio(List<Servicio> servicios, List<Servicio> misServicios, String servicio, String destino){
        for(Servicio unServicio : servicios){
            if(!unServicio.baja && unServicio.getServicio().contains(servicio) && unServicio.getDestino().contains(destino))
                misServicios.add(unServicio);
        }
    }
    
    public static void buscarServicio_serv(List<Servicio> servicios, List<Servicio> misServicios, String servicio){
        for(Servicio unServicio : servicios){
            if(!unServicio.baja && !misServicios.contains(unServicio) && unServicio.getServicio().contains(servicio))
                misServicios.add(unServicio);
        }   
    }
    
    public static void buscarServicio_des(List<Servicio> servicios, List<Servicio> misServicios, String servicio, String destino){
        for(Servicio unServicio : servicios){
            if(!unServicio.baja && !misServicios.contains(unServicio) && unServicio.getDestino().contains(destino))
                misServicios.add(unServicio);
        }
    }
    
    public static List<Servicio> obtenerServicios(List<Servicio> servicios){
        List<Servicio> misServicios = new LinkedList();
        for(Servicio unServicio : servicios){
            if(!unServicio.isBaja()) misServicios.add(unServicio);
        }
        return misServicios;
    }
}
