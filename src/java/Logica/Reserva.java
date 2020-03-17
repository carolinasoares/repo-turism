/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Logica;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import javax.persistence.*;

/**
 *
 * @author Caro
 */
@Entity
public class Reserva implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_reserva;
    @Basic
    private String tipo;//
    @Basic
    private String estado;//
    @Basic
    private String medio_pago_adelanto;//
    @Basic
    private double adelanto;//
    @Basic
    private String medio_pago;//
    @Basic
    private double pago_reserva;// 
    @Basic
    private double precioTotal;
    @Basic
    @Temporal (TemporalType.DATE)
    private Date fecha_reserva;//
    @Basic
    @Temporal (TemporalType.DATE)
    private Date fecha_caducidad;//
    @Basic
    private boolean baja;//
    @OneToOne
    private Cliente cliente;//
    @OneToOne
    private Paquete paquete;//
    @OneToOne
    private Servicio servicio;//

    public Reserva() {
    }

    public Reserva(String tipo, Cliente cliente, Paquete paquete) {
        this.tipo = tipo;
        this.cliente = cliente;
        this.paquete = paquete;
        this.servicio = null;
        this.estado = "PENDIENTE";
        this.precioTotal = paquete.getPrecio();
        this.fecha_reserva = new Date();
        this.fecha_caducidad = calcularFechaCaducidad();
        this.baja = false;
    }

    public Reserva(String tipo, Cliente cliente, Servicio servicio) {
        this.tipo = tipo;
        this.cliente = cliente;
        this.servicio = servicio;
        this.estado = "PENDIENTE";
        this.precioTotal = servicio.getPrecio();
        this.fecha_reserva = new Date();
        this.fecha_caducidad = calcularFechaCaducidad();
        this.baja = false;
    }

    public Reserva(int id_reserva, String tipo, String estado, Cliente cliente, Paquete paquete) {
        this.id_reserva = id_reserva;
        this.tipo = tipo;
        this.estado = estado;
        this.cliente = cliente;
        this.paquete = paquete;
        this.precioTotal = paquete.getPrecio();
        this.fecha_reserva = new Date();
        this.fecha_caducidad = calcularFechaCaducidad();
        this.baja = false;
    }
    
    public Reserva(String tipo, String estado, Cliente cliente, Paquete paquete) {
        this.tipo = tipo;
        this.estado = estado;
        this.cliente = cliente;
        this.paquete = paquete;
        this.precioTotal = paquete.getPrecio();
        this.fecha_reserva = new Date();
        this.fecha_caducidad = calcularFechaCaducidad();
        this.baja = false;
    }

    public Reserva(int id_reserva, String tipo, String estado, Cliente cliente, Servicio servicio) {
        this.id_reserva = id_reserva;
        this.tipo = tipo;
        this.estado = estado;
        this.cliente = cliente;
        this.servicio = servicio;
        this.precioTotal = servicio.getPrecio();
        this.fecha_reserva = new Date();
        this.fecha_caducidad = calcularFechaCaducidad();
        this.baja = false;
    }
    
    public Reserva(String tipo, String estado, Cliente cliente, Servicio servicio) {
        this.tipo = tipo;
        this.estado = estado;
        this.cliente = cliente;
        this.servicio = servicio;
        this.precioTotal = servicio.getPrecio();
        this.fecha_reserva = new Date();
        this.fecha_caducidad = calcularFechaCaducidad();
        this.baja = false;
    }

    public int getId_reserva() {
        return id_reserva;
    }

    public String getTipo() {
        return tipo;
    }

    public String getEstado() {
        return estado;
    }

    public Date getFecha_reserva() {
        return fecha_reserva;
    }

    public Date getFecha_caducidad() {
        return fecha_caducidad;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public Paquete getPaquete() {
        return paquete;
    }

    public Servicio getServicio() {
        return servicio;
    }

    public String getMedio_pago_adelanto() {
        return medio_pago_adelanto;
    }

    public double getAdelanto() {
        return adelanto;
    }

    public String getMedio_pago() {
        return medio_pago;
    }

    public double getPago_reserva() {
        return pago_reserva;
    }

    public double getPrecioTotal() {
        return precioTotal;
    }
    
    

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public void setMedio_pago_adelanto(String medio_pago_adelanto) {
        this.medio_pago_adelanto = medio_pago_adelanto;
    }

    public void setMedio_pago(String medio_pago) {
        this.medio_pago = medio_pago;
    }

    public boolean isBaja() {
        return baja;
    }

    public void setBaja(boolean baja) {
        this.baja = baja;
    }

    public void setPrecioTotal(double precioTotal) {
        this.precioTotal = precioTotal;
    }
    
    
    
    public static int obtenerNuevoCodigo(List<Reserva> elementos){
        int codigo = 0;
        boolean ban = true;
        do{
            codigo++;
            for(Reserva unElemento : elementos){
                if(unElemento.getId_reserva() == codigo){
                    ban = true;
                    break;
                }else ban = false;
            }
        }while(ban);
        return codigo;
    }
    
    public static Date calcularFechaCaducidad(){
        Calendar miFecha = Calendar.getInstance();
        miFecha.add(Calendar.DATE, 7);
        return miFecha.getTime();
    }
    
    public void modificarReserva(String tipo, String estado, Cliente cliente, Paquete paquete){
        this.tipo = tipo;
        this.estado = estado;
        this.cliente = cliente;
        this.paquete = paquete;
    }
    
    public void modificarReserva(String tipo, String estado, Cliente cliente, Servicio servicio){
        this.tipo = tipo;
        this.estado = estado;
        this.cliente = cliente;
        this.servicio = servicio;
    }
    
    public static void modificarReserva(List<Reserva> reservas, Reserva miReserva){
        for(Reserva unaReserva : reservas){
            if(unaReserva.getId_reserva() == miReserva.getId_reserva()){
                reservas.set(reservas.indexOf(unaReserva), miReserva);
            }
        }
    }
    
    public void calcularAdelanto(){
        double valor = 0.15 * this.precioTotal;
        if(this.medio_pago.equals("EFECTIVO")){
            double descuento = 0.10 * valor;
            double aux = valor - (0.10 * valor);
            if(aux > 0) valor = aux;
            this.precioTotal -= descuento;
        }else if(this.medio_pago_adelanto.equals("TARJETA_CREDITO")){
            double recargo = 0.06 * valor;
            valor += recargo;
            this.precioTotal += recargo;
        }
        this.adelanto = valor;
    }
    
    public void calcularPagoReserva(){
        double valor = this.precioTotal - this.adelanto;
        if(this.medio_pago.equals("EFECTIVO")){
            double descuento = 0.10 * valor;
            double aux = valor - (0.10 * valor);
            if(aux > 0) valor = aux;
            this.precioTotal -= descuento;
        }else if(this.medio_pago.equals("TARJETA_CREDITO")){
            double recargo = 0.06 * valor;
            valor += recargo;
            this.precioTotal += recargo;
        }
        this.pago_reserva = valor;
    }
    
    public void calcularCancelarReserva(){
        if(this.pago_reserva > 0)
            this.precioTotal = this.precioTotal*0.15;
        else this.precioTotal = this.adelanto;
        this.pago_reserva = 0;
        this.adelanto = 0;
    }
    
    public static List<Reserva> obtenerReservas(List<Reserva> reservas){
        List<Reserva> misReservas = new LinkedList();
        for(Reserva reserva : reservas){
            if(!reserva.isBaja()) misReservas.add(reserva);
        }
        return misReservas;
    }
    
    public static List<Reserva> buscarReserva(List<Reserva> reservas, String fecha_reserva, String fecha){
        Date miFecha = obtenerFecha(fecha);
        Date miFecha_reserva = obtenerFecha(fecha_reserva);
        List<Reserva> misReservas = new LinkedList();
        for(Reserva reserva : reservas){
            if(!reserva.isBaja() && compararFechas(miFecha_reserva, reserva.getFecha_reserva())){
                if((reserva.getPaquete()!=null && compararFechas(miFecha, reserva.getPaquete().getFromFecha()))
                   || (reserva.getServicio()!=null && compararFechas(miFecha, reserva.getServicio().getFromFecha())))
                    misReservas.add(reserva);
            }
        }
        return misReservas;
    }
    
    public static List<Reserva> buscarReserva_fecha_rec(List<Reserva> reservas, String fecha_reserva){
        Date miFecha_reserva = obtenerFecha(fecha_reserva);
        List<Reserva> misReservas = new LinkedList();
        for(Reserva reserva : reservas){
            if(!reserva.isBaja() && compararFechas(miFecha_reserva, reserva.getFecha_reserva())){
                misReservas.add(reserva);
            }
        }
        return misReservas;
    }
    
    public static List<Reserva> buscarReserva_fecha(List<Reserva> reservas, String fecha){
        Date miFecha = obtenerFecha(fecha);
        List<Reserva> misReservas = new LinkedList();
        for(Reserva reserva : reservas){
            if(!reserva.isBaja()){
                if((reserva.getPaquete()!=null && compararFechas(miFecha, reserva.getPaquete().getFromFecha()))
                   || (reserva.getServicio()!=null && compararFechas(miFecha, reserva.getServicio().getFromFecha())))
                    misReservas.add(reserva);
            }
        }
        return misReservas;
    }
    
    public static Date obtenerFecha(String fecha){
        int y = Integer.parseInt(fecha.substring(0, 4));
        int m = Integer.parseInt(fecha.substring(5, 7));
        int d = Integer.parseInt(fecha.substring(8, 10));
        Calendar miFecha = Calendar.getInstance();
        miFecha.set(Calendar.YEAR, y);
        miFecha.set(Calendar.MONTH, m);
        miFecha.set(Calendar.DATE, d);
        return miFecha.getTime();
    }
    
    public static boolean compararFechas(Date fecha1, Date fecha2){
        Calendar miFecha1 = Calendar.getInstance();
        Calendar miFecha2 = Calendar.getInstance();
        miFecha1.setTime(fecha1);
        miFecha2.setTime(fecha2);
        if(miFecha1.get(Calendar.YEAR) == miFecha2.get(Calendar.YEAR)
           && miFecha1.get(Calendar.MONTH) == miFecha2.get(Calendar.MONTH)
           && miFecha1.get(Calendar.DATE) == miFecha2.get(Calendar.DATE))
            return true;
        else return false;
    }
    
}
