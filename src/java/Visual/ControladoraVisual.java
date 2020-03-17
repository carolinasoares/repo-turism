/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Visual;

import Logica.Cliente;
import Logica.ControladoraLogica;
import Logica.Paquete;
import Logica.Promocion;
import Logica.Reserva;
import Logica.Servicio;
import Logica.Usuario;
import java.security.NoSuchAlgorithmException;
import java.util.List;

/**
 *
 * @author Caro
 */
public class ControladoraVisual {
    private final ControladoraLogica logica = new ControladoraLogica();

    public ControladoraVisual() {
    }
    
    public void cargarUsuraios(){
        this.logica.cargarUsuarios();
    }
    
    public int crearUsuario(String nombre, String clave) throws NoSuchAlgorithmException{
        return this.logica.crearUsuario(nombre, clave);
    }
    
    public Usuario modificarUsuario(String usuario, String clave, String usuario_nuevo) throws NoSuchAlgorithmException{
        return this.logica.modificarUsuario(usuario, clave, usuario_nuevo);
    }
    
    public boolean autenticar(String usuario, String clave) throws NoSuchAlgorithmException{
        return this.logica.autenticar(usuario, clave);
    }
    
    public Usuario cambiarClave(String usuario, String clave, String clave_nueva) throws NoSuchAlgorithmException{
        return this.logica.cambiarClave(usuario, clave, clave_nueva);
    }
    
    public void cargarClientes(){
        this.logica.cargarClientes();
    }
    
    public int crearCliente(String dni, String nombre, String apellido, String fecha_nac, String edad, String nacionalidad, String telefono, String email, String direccion){
        return this.logica.crearCliente(dni, nombre, apellido, fecha_nac, Integer.valueOf(edad), nacionalidad, direccion, telefono, email);
    }
    
    public List<Cliente> obtenerClientes(){
        return this.logica.obtenerClientes();
    }
    
    public Cliente obtenerCliente(String id){
        return this.logica.obtenerCliente(Integer.valueOf(id));
    }
    
    public boolean modificarCliente(String id, String dni, String nombre, String apellido, String fecha_nac, String edad, String nacionalidad, String telefono, String email, String direccion){
        return this.logica.modificarCliente(Integer.valueOf(id), dni, nombre, apellido, fecha_nac, Integer.valueOf(edad), nacionalidad, direccion, telefono, email);
    }
    
    public boolean bajaCliente(String id){
        return this.logica.bajaCliente(Integer.valueOf(id));
    }
    
    public boolean crearServicio(String servicio, String destino, String precio, String fromFecha, String toFecha, String fromHora, String toHora){
        return this.logica.crearServicio(servicio, destino, fromFecha, toFecha, fromHora, toHora, Double.valueOf(precio));
    }
    
    public void cargarServicios(){
        this.logica.cargarServicios();
    }
    
    public List<Servicio> obtenerServicios(){
        return this.logica.obtenerServicios();
    }
    
    public Servicio obtenerServicio(String id){
        return this.logica.obtenerServicio(Integer.valueOf(id));
    }
    
    public boolean modificrServicio(String id, String servicio, String destino, String precio, String fromFecha, String fromHora, String toFecha, String toHora){
        return this.logica.modificarServicio(Integer.valueOf(id), servicio, destino, fromFecha, toFecha, fromHora, toHora, Double.valueOf(precio));
    }
    
    public boolean bajaServicio(String id){
        return this.logica.bajaServicio(Integer.valueOf(id));
    }
    
    public void cargarPromociones(){
        this.logica.cargarPromociones();
    }
    
    public Promocion obtenerPromocion(String id){
        return this.logica.obtenerPromocion(Integer.valueOf(id));
    }
    
    public List<Promocion> obtenerPromociones(){
        return this.logica.obtenerPromociones();
    }
    
    public boolean crearPromocion(String nombre, String descuento){
        return this.logica.crearPromocion(nombre, Double.valueOf(descuento));
    }
    
    public boolean modificarPromocion(String id, String nombre, String decsuento){
        return this.logica.modificarPromocion(Integer.valueOf(id), nombre, Double.valueOf(decsuento));
    }
    
    public boolean bajaPromocion(String id){
        return this.logica.bajaPromocion(Integer.valueOf(id));
    }
    
    public void cargarPaquetes(){
        this.logica.cargarPaquetes();
    }
    
    public boolean crearPaquete(String nombre, String descripcion, String promocion, String[] servicios){
        return this.logica.crearPaquete(nombre, descripcion, Integer.valueOf(promocion), servicios);
    }
    
    public List<Paquete> obtenerPaquetes(){
        return this.logica.obtenerPaquetes();
    }
    
    public Paquete obtenerPaquete(String id){
        return this.logica.obtenerPaquete(Integer.valueOf(id));
    }
    
    public List<Servicio> getServicios(){
        return this.logica.getServicios();
    }
    
    public List<Promocion> getPromociones(){
        return this.logica.getPromociones();
    }
    
    public boolean modificarPaquete(String id, String nombre, String descripcion, String promocion, String[] servicios){
        return this.logica.modificarPaquete(Integer.valueOf(id), nombre, descripcion, Integer.valueOf(promocion), servicios);
    }
    
    public boolean bajaPaquete(String id){
        return this.logica.bajaPaquete(Integer.valueOf(id));
    }
    
    public void cargarReservas(){
        this.logica.cargarReservas();
    }
    
    public boolean crearReservaPaquete(String cliente, String tipo, String paquete){
        return this.logica.crearReservaPaquete(Integer.valueOf(cliente), tipo, Integer.valueOf(paquete));
    }
    
    public boolean crearReservaServicio(String cliente, String tipo, String servicio){
        return this.logica.crearReservaServicio(Integer.valueOf(cliente), tipo, Integer.valueOf(servicio));
    }
    
    public List<Reserva> obtenerReservas(){
        return this.logica.obtenerReservas();
    }
    
    public Reserva obtenerReserva(String id){
        return this.logica.obtenerReserva(Integer.valueOf(id));
    }
    
    public boolean confirmarReserva(String id, String medio_pago){
        return this.logica.confirmarReserva(Integer.valueOf(id), medio_pago);
    }
    
    public boolean finalizarPagoReserva(String id, String medio_pago){
        return this.logica.finalizarPagoReserva(Integer.valueOf(id), medio_pago);
    }
    
    public boolean rechazarReserva(String id){
        return this.logica.rechazarReserva(Integer.valueOf(id));
    }
    
    public boolean cancelarReserva(String id){
        return this.logica.cancelarReserva(Integer.valueOf(id));
    }
    
    public boolean bajaReserva(String id){
        return this.logica.bajaReserva(Integer.valueOf(id));
    }
    
}
