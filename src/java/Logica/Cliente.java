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
public class Cliente implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_cliente;
    @Basic
    private String dni;
    @Basic
    private String nombre;
    @Basic
    private String apellido;
    @Basic
    private String fechaNac;
    @Basic
    private int edad;
    @Basic
    private String nacionalidad;
    @Basic
    private String direccion;
    @Basic
    private String telefono;
    @Basic
    private String email;
    @Basic
    private boolean baja;
    @OneToMany
    private List<Reserva> reservas;
    

    public Cliente() {
    }

    public Cliente(int id_cliente, String dni, String nombre, String apellido, String fechaNac, int edad, String nacionalidad, String direccion, String telefono, String email) {
        this.id_cliente = id_cliente;
        this.dni = dni;
        this.nombre = nombre;
        this.apellido = apellido;
        this.fechaNac = fechaNac;
        this.edad = edad;
        this.nacionalidad = nacionalidad;
        this.direccion = direccion;
        this.telefono = telefono;
        this.email = email;
        this.reservas = new LinkedList();
        this.baja = false;
    }
    
    public Cliente(String dni, String nombre, String apellido, String fechaNac, int edad, String nacionalidad, String direccion, String telefono, String email) {
        this.dni = dni;
        this.nombre = nombre;
        this.apellido = apellido;
        this.fechaNac = fechaNac;
        this.edad = edad;
        this.nacionalidad = nacionalidad;
        this.direccion = direccion;
        this.telefono = telefono;
        this.email = email;
        this.reservas = new LinkedList();
        this.baja = false;
    }

    public int getId_cliente() {
        return id_cliente;
    }

    public String getDni() {
        return dni;
    }

    public String getNombre() {
        return nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public String getDireccion() {
        return direccion;
    }

    public String getFechaNac() {
        return fechaNac;
    }

    public int getEdad() {
        return edad;
    }

    public String getNacionalidad() {
        return nacionalidad;
    }

    public String getTelefono() {
        return telefono;
    }

    public String getEmail() {
        return email;
    }

    public List<Reserva> getReservas() {
        return reservas;
    }

    public boolean isBaja() {
        return baja;
    }

    public void setBaja(boolean baja) {
        this.baja = baja;
    }
    
    
    
    public static int obtenerNuevoCodigo(List<Cliente> elementos){
        int codigo = 0;
        boolean ban = true;
        do{
            codigo++;
            for(Cliente unElemento : elementos){
                if(unElemento.getId_cliente() == codigo){
                    ban = true;
                    break;
                }else ban = false;
            }
        }while(ban);
        return codigo;
    }
    
    public void modificarCliente(String dni, String nombre, String apellido, String fechaNac, int edad, String nacionalidad, String direccion, String telefono, String email){
        this.dni = dni;
        this.nombre = nombre;
        this.apellido = apellido;
        this.fechaNac = fechaNac;
        this.edad = edad;
        this.nacionalidad = nacionalidad;
        this.direccion = direccion;
        this.telefono = telefono;
        this.email = email;
    }
    
    public static void modificarCliente(List<Cliente> clientes, Cliente miCliente){
        for(Cliente unCliente : clientes){
            if(unCliente.getId_cliente() == miCliente.getId_cliente()){
                clientes.set(clientes.indexOf(unCliente), miCliente);
            }
        }
    }
    
    public static boolean comprobarCliente(List<Cliente> clientes, String dni){
        boolean res = false;
        for(Cliente unCliente : clientes){
            if(unCliente.getDni().equals(dni)){
                res = true;
                break;
            }
        }
        return res;
    }
    
    public static void buscarDni(List<Cliente> clientes, List<Cliente> misClientes, String dni){
        for(Cliente unCliente : clientes){
            if(!unCliente.isBaja() && unCliente.getDni().equals(dni)){
                misClientes.add(unCliente);
            }
        }
    }
    
    public static void buscarApellidoNom(List<Cliente> clientes, List<Cliente> misClientes, String apellido, String nombre){
        for(Cliente unCliente : clientes){
            if(!unCliente.isBaja() && unCliente.getApellido().contains(apellido) && unCliente.getNombre().contains(nombre)){
                if(!misClientes.contains(unCliente)) misClientes.add(unCliente);
            }
        }
    }
    
    public static void buscarApellido(List<Cliente> clientes, List<Cliente> misClientes, String apellido){
        for(Cliente unCliente : clientes){
            if(!unCliente.isBaja() && unCliente.getApellido().equalsIgnoreCase(apellido)){
                if(!misClientes.contains(unCliente)) misClientes.add(unCliente);
            }
        }
    }
    
    public static void buscarNombre(List<Cliente> clientes, List<Cliente> misClientes, String nombre){
        for(Cliente unCliente : clientes){
            if(!unCliente.isBaja() && unCliente.getNombre().equalsIgnoreCase(nombre)){
                if(!misClientes.contains(unCliente)) misClientes.add(unCliente);
            }
        }
    }
    
    public static List<Cliente> obtenerClientes(List<Cliente> clientes){
        List<Cliente> misClientes = new LinkedList();
        for(Cliente unCliente : clientes){
            if(!unCliente.isBaja()) misClientes.add(unCliente);
        }
        return misClientes;
    }
    
}
