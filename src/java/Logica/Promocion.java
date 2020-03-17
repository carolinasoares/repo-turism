/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Logica;

import java.io.Serializable;
import java.util.LinkedList;
import java.util.List;
import javax.persistence.*;

/**
 *
 * @author Caro
 */
@Entity
public class Promocion implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_promocion;
    @Basic
    private String promocion;
    @Basic
    private double descuento;
    @Basic
    private boolean baja;

    public Promocion() {
    }

    public Promocion(int id_promocion, String promocion, double descuento) {
        this.id_promocion = id_promocion;
        this.promocion = promocion;
        this.descuento = descuento;
        this.baja = false;
    }
    
    public Promocion(String promocion, double descuento) {
        this.promocion = promocion;
        this.descuento = descuento;
        this.baja = false;
    }

    public int getId_promocion() {
        return id_promocion;
    }

    public String getPromocion() {
        return promocion;
    }

    public double getDescuento() {
        return descuento;
    }

    public boolean isBaja() {
        return baja;
    }

    public void setBaja(boolean baja) {
        this.baja = baja;
    }
    
    public static int obtenerNuevoCodigo(List<Promocion> elementos){
        int codigo = 0;
        boolean ban = true;
        do{
            codigo++;
            for(Promocion unElemento : elementos){
                if(unElemento.getId_promocion() == codigo){
                    ban = true;
                    break;
                }else ban = false;
            }
        }while(ban);
        return codigo;
    }
    
    public void modificarPromocion(String promocion, double descuento){
        this.promocion = promocion;
        this.descuento = descuento;
    }
    
    public static void modificarPromocion(List<Promocion> promociones, Promocion miPromocion){
        for(Promocion unaPromocion : promociones){
            if(unaPromocion.getId_promocion() == miPromocion.getId_promocion()){
                promociones.set(promociones.indexOf(unaPromocion), miPromocion);
                break;
            }
        }
    }
    
    public static List<Promocion> buscarPromocion(List<Promocion> promociones, String nombre){
        List<Promocion> misPromociones = new LinkedList();
        for(Promocion promocion : promociones){
            if(!promocion.isBaja() && promocion.getPromocion().contains(nombre)){
                if(!misPromociones.contains(promocion)){
                    misPromociones.add(promocion);
                }
            }
        }
        return misPromociones;
    }
    
    public static List<Promocion> obtenerPromociones(List<Promocion> promociones){
        List<Promocion> misPromociones = new LinkedList();
        for(Promocion promocion : promociones){
            if(!promocion.isBaja()) misPromociones.add(promocion);
        }
        return misPromociones;
    }
    
}
