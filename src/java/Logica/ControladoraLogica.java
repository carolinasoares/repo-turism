/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Logica;

import Persistencia.ControladoraPersistencia;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author Caro
 */
public class ControladoraLogica {
    private List<Cliente> clientes = new LinkedList();
    private List<Paquete> paquetes = new LinkedList();
    private List<Promocion> promociones = new LinkedList();
    private List<Reserva> reservas = new LinkedList();
    private List<Servicio> servicios = new LinkedList();
    private List<Usuario> usuarios = new LinkedList();
    private final ControladoraPersistencia persistencia = new ControladoraPersistencia();

    public ControladoraLogica(){
        
    }
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    public List<Cliente> getClientes() {
        return clientes;
    }

    public List<Paquete> getPaquetes() {
        return paquetes;
    }

    public List<Promocion> getPromociones() {
        return promociones;
    }

    public List<Reserva> getReservas() {
        return reservas;
    }

    public List<Servicio> getServicios() {
        return servicios;
    }

    public List<Usuario> getUsuarios() {
        return usuarios;
    }

    public ControladoraPersistencia getPersistencia() {
        return persistencia;
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    public void cargarClientes(){
        this.clientes = this.persistencia.obtenerClientes();
    }
    
    public void cargarPaquetes(){
        this.paquetes = this.persistencia.obtenerPaquetes();
    }
    
    public void cargarPromociones(){
        this.promociones = this.persistencia.obtenerPromociones();
    }
    
    public void cargarReservas(){
        this.reservas = this.persistencia.obtenerReservas();
    }
    
    public void cargarServicios(){
        this.servicios = this.persistencia.obtenerServicios();
    }
    
    public void cargarUsuarios(){
        this.usuarios = this.persistencia.obtenerUsaurios();
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    public int crearUsuario(String usuario, String clave) throws NoSuchAlgorithmException{
        if(this.comprobarUsuario(usuario)){
            return 1;
        }else{
            Usuario unUsuario = new Usuario(Usuario.obtenerNuevoCodigo(this.usuarios), usuario , Usuario.sha1(clave));
            if(this.persistencia.crearUsuario(unUsuario)){
                this.usuarios.add(unUsuario);
                return 2;
            }else return 0;
        }
        
    }
    
    public Usuario modificarUsuario(String usuario, String clave, String nuevo_usuario) throws NoSuchAlgorithmException{
        Usuario unUsuario = Usuario.buscarUsuario(this.usuarios, usuario, clave);
        if(unUsuario!=null){
            if(this.comprobarUsuario(nuevo_usuario)){
                unUsuario.setUsuario("usu_existente");
                return unUsuario;
            }else{
                unUsuario.setUsuario(nuevo_usuario);
                if(this.persistencia.modificarUsuario(unUsuario)) return unUsuario;
                else return null;
            }
        }else return null;
    }
    
    public Usuario cambiarClave(String usuario, String clave, String clave_nueva) throws NoSuchAlgorithmException{
        Usuario unUsuario = Usuario.buscarUsuario(this.usuarios, usuario, clave);
        if(unUsuario!=null){
            unUsuario.setClave(Usuario.sha1(clave_nueva));
            if(this.persistencia.modificarUsuario(unUsuario)) return unUsuario;
            else return null;
        }else return null;
    }

    public Usuario obtenerUsuario(int id){
        return this.persistencia.obtenerUsuario(id);
    }
    
    public boolean eliminarUsuario(int id){
        if(this.persistencia.eliminarUsuario(id)){
            Usuario.eliminarUsuario(this.usuarios, id);
            return true;
        }else return false;
    }
    
    public boolean autenticar(String usuario, String clave) throws NoSuchAlgorithmException{
        return Usuario.autenticar(this.usuarios, usuario, Usuario.sha1(clave));
    }
    
    public boolean comprobarUsuario(String usuario){
        return Usuario.comprobarUsuario(this.usuarios, usuario);
    }
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    public int crearCliente_id(String dni, String nombre, String apellido, String fechaNac, int edad, String nacionalidad, String direccion, String telefono, String email){
        if(this.comprobarCliente(dni)) return 1;
        else{
            Cliente cliente = new Cliente(Cliente.obtenerNuevoCodigo(this.clientes), dni, nombre, apellido, fechaNac, edad, nacionalidad, direccion, telefono, email);
        if(this.persistencia.crearCliente(cliente)){
            return 2;
        }else return 0;
        }
        
    }
    
    public int crearCliente(String dni, String nombre, String apellido, String fechaNac, int edad, String nacionalidad, String direccion, String telefono, String email){
        if(this.comprobarCliente(dni)) return 1;
        else{
            Cliente cliente = new Cliente(dni, nombre, apellido, fechaNac, edad, nacionalidad, direccion, telefono, email);
            if(this.persistencia.crearCliente(cliente)){
                return 2;
            }else return 0;
        }
    }
    
    public boolean modificarCliente(int id, String dni, String nombre, String apellido, String fechaNac, int edad, String nacionalidad, String direccion, String telefono, String email){
        Cliente unCliente = this.persistencia.obtenerCliente(id);
        unCliente.modificarCliente(dni, nombre, apellido, fechaNac, edad, nacionalidad, direccion, telefono, email);
        if(this.persistencia.modificarCliente(unCliente)){
            Cliente.modificarCliente(this.clientes, unCliente);
            return true;
        }else return false;
    }
    
    public boolean agregarReservaCliente(int id, int id_reserva){
        Cliente cliente = this.persistencia.obtenerCliente(id);
        Reserva reserva = this.persistencia.obtenerReserva(id);
        cliente.getReservas().add(reserva);
        if(this.persistencia.modificarCliente(cliente)){
            Cliente.modificarCliente(this.clientes, cliente);
            return true;
        }else return false;
    }
    
    public boolean agregarReservaCliente(Cliente cliente, Reserva reserva){
        cliente.getReservas().add(reserva);
        if(this.persistencia.modificarCliente(cliente)){
            Cliente.modificarCliente(this.clientes, cliente);
            return true;
        }else return false;
    }
    
    public boolean bajaCliente(int id){
        Cliente unCliente = this.persistencia.obtenerCliente(id);
        unCliente.setBaja(true);
        if(this.persistencia.modificarCliente(unCliente)){
            Cliente.modificarCliente(this.clientes, unCliente);
            return true;
        }else return false;
    }
    
    public boolean comprobarCliente(String dni){
        return Cliente.comprobarCliente(this.clientes, dni);
    }
    
    public List<Cliente> buscarCliente(String dni, String apellido, String nombre){
        List<Cliente> misClientes = new LinkedList();
        if(dni !=null) Cliente.buscarDni(this.clientes, misClientes, dni);
        if(apellido!=null && nombre !=null) Cliente.buscarApellidoNom(this.clientes, misClientes, apellido, nombre);
        else if(apellido !=null) Cliente.buscarApellido(this.clientes, misClientes, apellido);
        else if(nombre != null) Cliente.buscarNombre(this.clientes, misClientes, nombre);
        return misClientes;
    }
    
    public Cliente obtenerCliente(int id){
        return this.persistencia.obtenerCliente(id);
    }
    
    public List<Cliente> obtenerClientes(){
        return Cliente.obtenerClientes(this.clientes);
    }
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    public Promocion crearPromocion_id(String nombre, double descuento){
        Promocion unaPromocion = new Promocion(Promocion.obtenerNuevoCodigo(this.promociones), nombre, descuento);
        if(this.persistencia.crearPromocion(unaPromocion)){
            this.promociones.add(unaPromocion);
            return unaPromocion;
        }else return null;
    }
    
    public boolean crearPromocion(String nombre, double descuento){
        Promocion unaPromocion = new Promocion(nombre, descuento);
        if(this.persistencia.crearPromocion(unaPromocion)){
            this.promociones.add(unaPromocion);
            return true;
        }else return false;
    }
    
    public boolean modificarPromocion(int id, String promocion, double descuento){
        Promocion miPromocion = this.persistencia.obtenerPromocion(id);
        miPromocion.modificarPromocion(promocion, descuento);
        if(this.persistencia.modificarPromocion(miPromocion)){
            Promocion.modificarPromocion(this.promociones, miPromocion);
            return true;
        }else return false;
    }
    
    public boolean bajaPromocion(int id){
        Promocion miPromocion = this.persistencia.obtenerPromocion(id);
        miPromocion.setBaja(true);
        if(this.persistencia.modificarPromocion(miPromocion)){
            Promocion.modificarPromocion(this.promociones, miPromocion);
            return true;
        }else return false;
    }
    
    public List<Promocion> buscarPromocion(String nombre){
        return Promocion.buscarPromocion(this.promociones, nombre);
    }
    
    public Promocion obtenerPromocion(int id){
        return this.persistencia.obtenerPromocion(id);
    }
    
    public List<Promocion> obtenerPromociones(){
        return Promocion.obtenerPromociones(this.promociones);
    }
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    public Servicio crearServicio_id(String servicio, String destino, String fromFecha, String toFecha, String fromHora, String toHora, double precio){
        Servicio unServicio = new Servicio(Servicio.obtenerNuevoCodigo(this.servicios), servicio, destino, fromFecha, toFecha, fromHora, toHora, precio);
        if(this.persistencia.crearServicio(unServicio)){
            this.servicios.add(unServicio);
            return unServicio;
        }else return null;
    }
    
    public boolean crearServicio(String servicio, String destino, String fromFecha, String toFecha, String fromHora, String toHora, double precio){
        Servicio unServicio = new Servicio(servicio, destino, fromFecha, toFecha, fromHora, toHora, precio);
        if(this.persistencia.crearServicio(unServicio)){
            this.servicios.add(unServicio);
            return true;
        }else return false;
    }
    
    public boolean modificarServicio(int id, String servicio, String destino, String fromFecha, String toFecha, String fromHora, String toHora, double precio){
        Servicio miServicio = this.persistencia.obtenerServicio(id);
        miServicio.modificarServicio(servicio, destino, fromFecha, toFecha, fromHora, toHora, precio);
        if(this.persistencia.modificarServicio(miServicio)){
            Servicio.modificarServicio(this.servicios, miServicio);
            this.actualizarPaquetes();
            return true;
        }return false;
    }
    
    public void actualizarPaquetes(){
        this.cargarPaquetes();
        for(Paquete paquete : this.paquetes){
            paquete.calcularFechaInicio();
            paquete.calcularFechaFinalizacion();
            paquete.calcularPrecio();
            this.persistencia.modificarPaquete(paquete);
        }
    }
    
    public Servicio obtenerServicio(int id){
        return this.persistencia.obtenerServicio(id);
    }
    
    public boolean bajaServicio(int id){
        Servicio miServicio = this.persistencia.obtenerServicio(id);
        miServicio.setBaja(true);
        if(this.persistencia.modificarServicio(miServicio)){
            Servicio.modificarServicio(this.servicios, miServicio);
            return true;
        }return false;
    }
    
    public List<Servicio> buscarServicios(String servicio, String destino){
        List<Servicio> misServicios = new LinkedList();
        if(servicio!=null && destino!=null) Servicio.buscarServicio(this.servicios, misServicios, servicio, destino);
        else if(servicio!=null) Servicio.buscarServicio_serv(this.servicios, misServicios, servicio);
        else if(destino!=null) Servicio.buscarServicio_des(this.servicios, misServicios, servicio, destino);
        return misServicios;
    }
    
    public List<Servicio> obtenerServicios(){
        return Servicio.obtenerServicios(this.servicios);
    }
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    public boolean crearPaquete(String nombre, String descripcion, int id_promocion, String[] servicios){
        List<Servicio> misServicios = new LinkedList();
        if(servicios != null && servicios.length>0) misServicios =this.obtenerListaServicios(this.pasarInt(servicios));
        Paquete paquete =  null;
        if(id_promocion > 0){
            Promocion promocion = this.persistencia.obtenerPromocion(id_promocion);
            paquete = new Paquete(nombre, descripcion, promocion, misServicios);
        }else{
            paquete = new Paquete(nombre, descripcion, misServicios);
        }
        paquete.calcularPrecio();
        paquete.calcularFechaInicio();
        paquete.calcularFechaFinalizacion();
        if(this.persistencia.crearPaquete(paquete)) return true;
        else return false;
    }
    
    public List<Servicio> obtenerListaServicios(int[] arrayServicios){
        List<Servicio> misServicios = new LinkedList();
        for(int i=0; i<arrayServicios.length; i++){
            Servicio servicio = this.persistencia.obtenerServicio(arrayServicios[i]);
            misServicios.add(servicio);
        }
        return misServicios;
    }
    
    public Paquete crearPaquete_id(String nombre, String descripcion, Promocion promocion){
        Paquete unPaquete = new Paquete(Paquete.obtenerNuevoCodigo(this.paquetes), nombre, descripcion, promocion);
        if(this.persistencia.crearPaquete(unPaquete)){
            this.paquetes.add(unPaquete);
            return unPaquete;
        }else return null;
    }
    
    public Paquete crearPaquete(String nombre, String descripcion, Promocion promocion){
        Paquete unPaquete = new Paquete(nombre, descripcion, promocion);
        if(this.persistencia.crearPaquete(unPaquete)){
            this.paquetes.add(unPaquete);
            return unPaquete;
        }else return null;
    }
    
    public Paquete crearPaquete_id(String nombre, String descripcion){
        Paquete unPaquete = new Paquete(Paquete.obtenerNuevoCodigo(this.paquetes), nombre, descripcion);
        if(this.persistencia.crearPaquete(unPaquete)){
            this.paquetes.add(unPaquete);
            return unPaquete;
        }else return null;
    }
    
    public Paquete crearPaquete(String nombre, String descripcion){
        Paquete unPaquete = new Paquete(nombre, descripcion);
        if(this.persistencia.crearPaquete(unPaquete)){
            this.paquetes.add(unPaquete);
            return unPaquete;
        }else return null;
    }
    
    public boolean modificarPaquete(int id, String nombre, String descripcion, int idPromocion, String[] servicios){
        List<Servicio> misServicios = new LinkedList();
        if(servicios != null && servicios.length>0) misServicios =this.obtenerListaServicios(this.pasarInt(servicios));
        Paquete paquete = this.persistencia.obtenerPaquete(id);
        if(idPromocion > 0){
            Promocion promocion = this.persistencia.obtenerPromocion(idPromocion);
            paquete.modificarPaquete(nombre, descripcion, promocion, misServicios);
        }else{
            paquete.modificarPaquete(nombre, descripcion, misServicios);
        }
        paquete.calcularPrecio();
        paquete.calcularFechaInicio();
        paquete.calcularFechaFinalizacion();
        if(this.persistencia.modificarPaquete(paquete)) return true;
        else return false;
    }
    
    public boolean modificarPaquete(int id, String nombre, String descripcion, int idPromocion){
        Paquete unPaquete = this.persistencia.obtenerPaquete(id);
        Promocion promocion = this.persistencia.obtenerPromocion(idPromocion);
        unPaquete.modificarPaquete(nombre, descripcion, promocion);
        if(this.persistencia.modificarPaquete(unPaquete)){
            Paquete.modificarPauqte(this.paquetes, unPaquete);
            return true;
        }else return false;
    }
    
    public boolean modificarPaquete(int id, String nombre, String descripcion, String tipo){
        Paquete unPaquete = this.persistencia.obtenerPaquete(id);
        unPaquete.modificarPaquete(nombre, descripcion);
        if(this.persistencia.modificarPaquete(unPaquete)){
            Paquete.modificarPauqte(this.paquetes, unPaquete);
            return true;
        }else return false;
    }
    
    public boolean agregarServicioPaquete(int id_paquete, int id_servicio){
        Paquete paquete = this.persistencia.obtenerPaquete(id_paquete);
        Servicio servicio = this.persistencia.obtenerServicio(id_servicio);
        paquete.getServicios().add(servicio);
        paquete.calcularFechaInicio();
        paquete.calcularFechaFinalizacion();
        paquete.calcularPrecio();
        if(this.persistencia.modificarPaquete(paquete)){
            Paquete.modificarPauqte(this.paquetes, paquete);
            return true;
        }else return false;
    }
    
    public boolean agregarServiciosPaquete(String[] id_servicios, int idPaquete){
        Paquete unPaquete = this.persistencia.obtenerPaquete(idPaquete);
        int [] idServicios = this.pasarInt(id_servicios);
        this.agregarServiciosPaquete(idServicios, unPaquete);
        unPaquete.calcularFechaInicio();
        unPaquete.calcularFechaFinalizacion();
        unPaquete.calcularPrecio();
        if(this.persistencia.modificarPaquete(unPaquete)){
            Paquete.modificarPauqte(this.paquetes, unPaquete);
            return true;
        }else return false;
    }
    
    public void agregarServiciosPaquete(int[] idServicios, Paquete unPaquete){
        for(int i=0; i<idServicios.length; i++){
            Servicio unServicio = this.persistencia.obtenerServicio(idServicios[i]);
            unPaquete.getServicios().add(unServicio);
        }
    }
    
    public int[] pasarInt(String[] elementos){
        int[] misElementos = new int[elementos.length];
        for(int i=0; i<elementos.length; i++){
            misElementos[i] = Integer.valueOf(elementos[i]);
        }
        return misElementos;
    }
    
    public boolean quitarServicioPaquete(int idServicio, int idPaquete){
        Paquete paquete = this.persistencia.obtenerPaquete(idPaquete);
        Servicio servicio = this.persistencia.obtenerServicio(idPaquete);
        paquete.quitarServicio(servicio);
        paquete.calcularFechaInicio();
        paquete.calcularFechaFinalizacion();
        paquete.calcularPrecio();
        if(this.persistencia.modificarPaquete(paquete)){
            Paquete.modificarPauqte(this.paquetes, paquete);
            return true;
        }else return false;
    }
    
    public Paquete obtenerPaquete(int id){
        return this.persistencia.obtenerPaquete(id);
    }
    
    public boolean bajaPaquete(int id){
        Paquete paquete = this.persistencia.obtenerPaquete(id);
        paquete.setBaja(true);
        if(this.persistencia.modificarPaquete(paquete)){
            Paquete.modificarPauqte(this.paquetes, paquete);
            return true;
        }else return false;
    }
    
    public List<Paquete> buscarPaquete(String nombre, String descripcion){
        List<Paquete> misPaquetes = new LinkedList();
        if(nombre!=null && descripcion!=null) misPaquetes.addAll(Paquete.buscarPaquete(this.paquetes, nombre, descripcion));
        if(nombre!=null) misPaquetes.addAll(Paquete.buscarPaquete_nom(this.paquetes, nombre));
        if(descripcion!=null) misPaquetes.addAll(Paquete.buscarPaquete_des(this.paquetes, descripcion));
        return misPaquetes;
    }
    
    public List<Paquete> obtenerPaquetes(){
        return Paquete.obtenerPaquetes(this.paquetes);
    }
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    public boolean crearReservaPaquete(int id_cliente, String tipo, int id_paquete){
        Cliente cliente = this.persistencia.obtenerCliente(id_cliente);
        Paquete paquete = this.persistencia.obtenerPaquete(id_paquete);
        Reserva reserva = new Reserva(tipo, cliente, paquete);
        if(this.persistencia.crearReserva(reserva)){
            this.agregarReservaCliente(cliente, reserva);
            return true;
        }
        else return false;
    }
    
    public boolean crearReservaServicio(int id_cliente, String tipo, int id_servicio){
        Cliente cliente = this.persistencia.obtenerCliente(id_cliente);
        Servicio servicio = this.persistencia.obtenerServicio(id_servicio);
        Reserva reserva = new Reserva(tipo, cliente, servicio);
        if(this.persistencia.crearReserva(reserva)){
            this.agregarReservaCliente(cliente, reserva);
            return true;
        }
        else return false;
    }
    
    public Reserva crearReserva_paq_id(String tipo, String estado, double entrega, int id_cliente, int id_paquete){
        Cliente cliente = this.persistencia.obtenerCliente(id_cliente);
        Paquete paquete = this.persistencia.obtenerPaquete(id_paquete);
        Reserva reserva = new Reserva(Reserva.obtenerNuevoCodigo(this.reservas), tipo, estado, cliente, paquete);
        if(this.persistencia.crearReserva(reserva)){
            this.agregarReservaCliente(cliente, reserva);
            this.reservas.add(reserva);
            return reserva;
        }else return null;
    }
    
    public Reserva crearReserva_paq(String tipo, String estado, double entrega, int id_cliente, int id_paquete){
        Cliente cliente = this.persistencia.obtenerCliente(id_cliente);
        Paquete paquete = this.persistencia.obtenerPaquete(id_paquete);
        Reserva reserva = new Reserva(tipo, estado, cliente, paquete);
        if(this.persistencia.crearReserva(reserva)){
            this.agregarReservaCliente(cliente, reserva);
            this.reservas.add(reserva);
            return reserva;
        }else return null;
    }
    
    public Reserva crearReserva_ser_id(String tipo, String estado, double entrega, int id_cliente, int id_servicio){
        Cliente cliente = this.persistencia.obtenerCliente(id_cliente);
        Servicio servicio = this.persistencia.obtenerServicio(id_servicio);
        Reserva reserva = new Reserva(Reserva.obtenerNuevoCodigo(this.reservas), tipo, estado, cliente, servicio);
        if(this.persistencia.crearReserva(reserva)){
            this.agregarReservaCliente(cliente, reserva);
            this.reservas.add(reserva);
            return reserva;
        }else return null;
    }
    
    public Reserva crearReserva_ser(String tipo, String estado, double entrega, int id_cliente, int id_servicio){
        Cliente cliente = this.persistencia.obtenerCliente(id_cliente);
        Servicio servicio = this.persistencia.obtenerServicio(id_servicio);
        Reserva reserva = new Reserva(tipo, estado, cliente, servicio);
        if(this.persistencia.crearReserva(reserva)){
            this.agregarReservaCliente(cliente, reserva);
            this.reservas.add(reserva);
            return reserva;
        }else return null;
    }
    
    public boolean modificarReserva_paq(int id, String tipo, String estado, double entrega, int id_cliente, int id_paquete){
        Cliente cliente = this.persistencia.obtenerCliente(id_cliente);
        Paquete paquete = this.persistencia.obtenerPaquete(id_paquete);
        Reserva reserva = this.persistencia.obtenerReserva(id);
        reserva.modificarReserva(tipo, estado, cliente, paquete);
        if(this.persistencia.modificarReserva(reserva)){
            Reserva.modificarReserva(this.reservas, reserva);
            return true;
        }else return false;
    }
    
    public boolean modificarReserva_ser(int id, String tipo, String estado, double entrega, int id_cliente, int id_servicio){
        Cliente cliente = this.persistencia.obtenerCliente(id_cliente);
        Servicio servicio = this.persistencia.obtenerServicio(id_servicio);
        Reserva reserva = this.persistencia.obtenerReserva(id);
        reserva.modificarReserva(tipo, estado, cliente, servicio);
        if(this.persistencia.modificarReserva(reserva)){
            Reserva.modificarReserva(this.reservas, reserva);
            return true;
        }else return false;
    }
    
    public boolean cambiarEstadoReserva(int id, String estado){
        Reserva reserva = this.persistencia.obtenerReserva(id);
        reserva.setEstado(estado);
        if(this.persistencia.modificarReserva(reserva)){
            Reserva.modificarReserva(this.reservas, reserva);
            return true;
        }else return false;
    }
    
    public boolean confirmarReserva(int id, String medio_pago_adelanto){
        Reserva reserva = this.persistencia.obtenerReserva(id);
        reserva.setMedio_pago_adelanto(medio_pago_adelanto);
        reserva.calcularAdelanto();
        reserva.setEstado("CONFIRMADA");
        if(this.persistencia.modificarReserva(reserva)){
            Reserva.modificarReserva(this.reservas, reserva);
            return true;
        }else return false;
    }
    
    public boolean finalizarPagoReserva(int id, String medio_pago){
        Reserva reserva = this.persistencia.obtenerReserva(id);
        reserva.setMedio_pago(medio_pago);
        reserva.calcularPagoReserva();
        reserva.setEstado("PAGO_FINALIZADO");
        if(this.persistencia.modificarReserva(reserva)){
            Reserva.modificarReserva(this.reservas, reserva);
            return true;
        }else return false;
    }
    
    public boolean rechazarReserva(int id){
        Reserva reserva = this.persistencia.obtenerReserva(id);
        reserva.setPrecioTotal(0);
        reserva.setEstado("RECHAZADA");
        if(this.persistencia.modificarReserva(reserva)) return true;
        else return false;
    }
    
    public boolean cancelarReserva(int id){
        Reserva reserva = this.persistencia.obtenerReserva(id);
        reserva.setEstado("CANCELADA");
        reserva.calcularCancelarReserva();
        if(this.persistencia.modificarReserva(reserva)) return true;
        else return false;
    }
    
    public Reserva obtenerReserva(int id){
        return this.persistencia.obtenerReserva(id);
    }
    
    public boolean bajaReserva(int id){
        Reserva reserva = this.persistencia.obtenerReserva(id);
        reserva.setBaja(true);
        if(this.persistencia.modificarReserva(reserva)){
            Reserva.modificarReserva(this.reservas, reserva);
            return true;
        }else return false;
    }
    
     public List<Reserva> obtenerReservas(){
         return Reserva.obtenerReservas(this.reservas);
     }
    
    public List<Reserva> buscarReserva(String fecha_reserva, String fecha, int id_Cliente){
        List<Reserva> misReservas = new LinkedList();
        Cliente cliente = this.persistencia.obtenerCliente(id_Cliente);
        if(fecha_reserva!=null && fecha!=null) misReservas = Reserva.buscarReserva(cliente.getReservas(), fecha_reserva, fecha);
        else if(fecha_reserva!=null) misReservas = Reserva.buscarReserva_fecha_rec(cliente.getReservas(), fecha_reserva);
        else if(fecha!=null) misReservas = Reserva.buscarReserva_fecha(cliente.getReservas(), fecha);
        else misReservas = Reserva.obtenerReservas(cliente.getReservas());
        return misReservas;
    }
    
    public List<Reserva> buscarReserva(String fecha_reserva, String fecha){
        List<Reserva> misReservas = new LinkedList();
        if(fecha_reserva!=null && fecha!=null) misReservas = Reserva.buscarReserva(this.reservas, fecha_reserva, fecha);
        else if(fecha_reserva!=null) misReservas = Reserva.buscarReserva_fecha_rec(this.reservas, fecha_reserva);
        else if(fecha!=null) misReservas = Reserva.buscarReserva_fecha(this.reservas, fecha);
        return misReservas;
    }
    
    
    
    
    
    
}
