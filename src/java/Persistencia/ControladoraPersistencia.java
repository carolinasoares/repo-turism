/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Persistencia;

import Logica.Cliente;
import Logica.Paquete;
import Logica.Promocion;
import Logica.Reserva;
import Logica.Servicio;
import Logica.Usuario;
import Persistencia.exceptions.NonexistentEntityException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Caro
 */
public class ControladoraPersistencia {
    private ClienteJpaController clienteJpa;
    private PaqueteJpaController paqueteJpa;
    private PromocionJpaController promocionJpa;
    private ReservaJpaController reservaJpa;
    private ServicioJpaController servicioJpa;
    private UsuarioJpaController usuarioJpa;

    public ControladoraPersistencia() {
        
    }
    
    ///////////////////////CLIENTE/////////////////////////////////
    public boolean crearCliente(Cliente cliente){
        this.clienteJpa = new ClienteJpaController();
        try {
            this.clienteJpa.create(cliente);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            if(this.clienteJpa.findCliente(cliente.getId_cliente()) != null) return true;
            else return false;
        }
    }
    
    public boolean modificarCliente(Cliente cliente){
        this.clienteJpa = new ClienteJpaController();
        try {
            this.clienteJpa.edit(cliente);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            Cliente unCliente = this.clienteJpa.findCliente(cliente.getId_cliente());
            if (unCliente!=null && unCliente.getDni().equals(cliente.getDni()) && unCliente.getNombre().equals(cliente.getNombre())
                && unCliente.getApellido().equals(cliente.getApellido()) && unCliente.getDireccion().equals(cliente.getDireccion())
                && unCliente.getFechaNac().equals(cliente.getFechaNac()) && unCliente.getEdad() == cliente.getEdad()
                && unCliente.getTelefono().equals(cliente.getTelefono()) && unCliente.getEmail().equals(cliente.getEmail())
                && unCliente.isBaja() == cliente.isBaja())
                return true;
            else return false;
        }
    }
    
    public Cliente obtenerCliente(int id){
        this.clienteJpa = new ClienteJpaController();
        return this.clienteJpa.findCliente(id);
    }
    
    public List<Cliente> obtenerClientes(){
        this.clienteJpa = new ClienteJpaController();
        return this.clienteJpa.findClienteEntities();
    }
    
    public boolean eliminarCliente(int id){
        this.clienteJpa = new ClienteJpaController();
        try {
            this.clienteJpa.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            if(this.clienteJpa.findCliente(id) == null) return true;
            else return false;
        }
        
    }
    
    ///////////////////////USUARIO/////////////////////////////////
    public boolean crearUsuario(Usuario usuario){
        this.usuarioJpa = new UsuarioJpaController();
        try {
            this.usuarioJpa.create(usuario);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            
        }
        if(this.usuarioJpa.findUsuario(usuario.getId()) != null) return true;
        else return false;
    }
    
    public boolean modificarUsuario(Usuario usuario){
        this.usuarioJpa = new UsuarioJpaController();
        try {
            this.usuarioJpa.edit(usuario);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            Usuario unUsuario = this.usuarioJpa.findUsuario(usuario.getId());
            if(unUsuario != null && unUsuario.getUsuario().equals(usuario.getUsuario()) && unUsuario.getClave().equals(usuario.getClave()))
                return true;
            else return false;
        }
    }
    
    public Usuario obtenerUsuario(int id){
        this.usuarioJpa = new UsuarioJpaController();
        return this.usuarioJpa.findUsuario(id);
    }
    
    public List<Usuario> obtenerUsaurios(){
        this.usuarioJpa = new UsuarioJpaController();
        return this.usuarioJpa.findUsuarioEntities();
    }
    
    public boolean eliminarUsuario(int id){
        this.usuarioJpa = new UsuarioJpaController();
        try {
            this.usuarioJpa.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            if(this.usuarioJpa.findUsuario(id) == null) return true;
            else return false;
        }
    }
    
    ///////////////////////PROMOCION/////////////////////////////////
    public boolean crearPromocion(Promocion promocion){
        this.promocionJpa = new PromocionJpaController();
        try {
            this.promocionJpa.create(promocion);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            if(this.promocionJpa.findPromocion(promocion.getId_promocion()) != null) return true;
            else return false;
        }
    }
    
    public boolean modificarPromocion(Promocion promocion){
        this.promocionJpa = new PromocionJpaController();
        try {
            this.promocionJpa.edit(promocion);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            Promocion unaPromocion = this.promocionJpa.findPromocion(promocion.getId_promocion());
            if(unaPromocion != null && unaPromocion.getPromocion().equals(promocion.getPromocion()) && unaPromocion.getDescuento() == promocion.getDescuento())
                return true;
            else return false;
        }
    }
    
    public Promocion obtenerPromocion(int id){
        this.promocionJpa = new PromocionJpaController();
        return this.promocionJpa.findPromocion(id);
    }
    
    public List<Promocion> obtenerPromociones(){
        this.promocionJpa = new PromocionJpaController();
        return this.promocionJpa.findPromocionEntities();
    }
    
    public boolean eliminarPromocion(int id){
        this.promocionJpa = new PromocionJpaController();
        try {
            this.promocionJpa.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            if(this.promocionJpa.findPromocion(id) == null) return true;
            else return false;
        }
    }
    
    ///////////////////////SERVICIO/////////////////////////////////
    public boolean crearServicio(Servicio servicio){
        this.servicioJpa = new ServicioJpaController();
        try {
            this.servicioJpa.create(servicio);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            if(this.servicioJpa.findServicio(servicio.getId_servicio()) != null) return true;
            else return false;
        }
    }
    
    public boolean modificarServicio(Servicio servicio){
        this.servicioJpa = new ServicioJpaController();
        try {
            this.servicioJpa.edit(servicio);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            Servicio unServicio = this.servicioJpa.findServicio(servicio.getId_servicio());
            if(unServicio != null && unServicio.getDestino().equals(servicio.getDestino()) && unServicio.getFromFecha().equals(servicio.getFromFecha())
              && unServicio.getPrecio() == servicio.getPrecio() && unServicio.getServicio().equals(servicio.getServicio()) 
              && unServicio.getToFecha().equals(servicio.getToFecha()))
                return true;
            else return false;
        }
    }
    
    public Servicio obtenerServicio(int id){
        this.servicioJpa = new ServicioJpaController();
        return this.servicioJpa.findServicio(id);
    }
    
    public List<Servicio> obtenerServicios(){
        this.servicioJpa = new ServicioJpaController();
        return this.servicioJpa.findServicioEntities();
    }
    
    public boolean eliminarServicio(int id){
        this.servicioJpa = new ServicioJpaController();
        try {
            this.servicioJpa.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if(this.servicioJpa.findServicio(id) == null) return true;
            else return false;
        }
    }
    
    ///////////////////////PAQUETE/////////////////////////////////
    public boolean crearPaquete(Paquete paquete){
        this.paqueteJpa = new PaqueteJpaController();
        try {
            this.paqueteJpa.create(paquete);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if(this.paqueteJpa.findPaquete(paquete.getId_paquete()) != null) return true;
            else return false;
        }
    }
    
    public boolean modificarPaquete(Paquete paquete){
        this.paqueteJpa = new PaqueteJpaController();
        try {
            this.paqueteJpa.edit(paquete);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            Paquete unPaquete = this.paqueteJpa.findPaquete(paquete.getId_paquete());
            if(unPaquete != null && unPaquete.getDescripcion().equals(paquete.getDescripcion()) && unPaquete.getNombre().equals(paquete.getNombre()))
                return true;
            else return false;
        }
    }
    
    public Paquete obtenerPaquete(int id){
        this.paqueteJpa = new PaqueteJpaController();
        return this.paqueteJpa.findPaquete(id);
    }
    
    public List<Paquete> obtenerPaquetes(){
        this.paqueteJpa = new PaqueteJpaController();
        return this.paqueteJpa.findPaqueteEntities();
    }
    
    public boolean eliminarPaquete(int id){
        this.paqueteJpa = new PaqueteJpaController();
        try {
            this.paqueteJpa.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if(this.paqueteJpa.findPaquete(id) == null) return true;
            else return false;
        }
    }
    
    ///////////////////////RESERVA/////////////////////////////////
    public boolean crearReserva(Reserva reserva){
        this.reservaJpa =  new ReservaJpaController();
        try {
            this.reservaJpa.create(reserva);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if(this.reservaJpa.findReserva(reserva.getId_reserva()) != null) return true;
            else return false;
        }
    }
    
    public boolean modificarReserva(Reserva reserva){
        this.reservaJpa =  new ReservaJpaController();
        try {
            this.reservaJpa.edit(reserva);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            Reserva unaReserva = this.reservaJpa.findReserva(reserva.getId_reserva());
            if(unaReserva != null && unaReserva.getEstado().equals(reserva.getEstado())
               && unaReserva.getFecha_reserva() == reserva.getFecha_reserva() && unaReserva.getTipo().equals(reserva.getTipo()))
                return true;
            else return false;
        }
    }
    
    public Reserva obtenerReserva(int id){
        this.reservaJpa =  new ReservaJpaController();
        return this.reservaJpa.findReserva(id);
    }
    
    public List<Reserva> obtenerReservas(){
        this.reservaJpa =  new ReservaJpaController();
        return this.reservaJpa.findReservaEntities();
    }
    
    public boolean eliminarReserva(int id){
        this.reservaJpa =  new ReservaJpaController();
        try {
            this.reservaJpa.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if(this.reservaJpa.findReserva(id) == null) return true;
            else return false;
        }
    }
}
