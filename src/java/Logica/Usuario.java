/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Logica;

import java.io.Serializable;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import javax.persistence.*;

/**
 *
 * @author Caro
 */

@Entity
public class Usuario implements Serializable {
    @Id
    private int id;
    @Basic
    private String usuario;
    private String clave;

    public Usuario() {
    }

    public Usuario(int id, String usuario, String clave) {
        this.id = id;
        this.usuario = usuario;
        this.clave = clave;
    }

    public int getId() {
        return id;
    }

    public String getUsuario() {
        return usuario;
    }

    public String getClave() {
        return clave;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }
    
    static String sha1(String input) throws NoSuchAlgorithmException {
        MessageDigest mDigest = MessageDigest.getInstance("SHA1");
        byte[] result = mDigest.digest(input.getBytes());
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < result.length; i++) {
            sb.append(Integer.toString((result[i] & 0xff) + 0x100, 16).substring(1));
        }
         
        return sb.toString();
    }
    
    public static int obtenerNuevoCodigo(List<Usuario> elementos){
        int codigo = 1;
        if(!elementos.isEmpty()){
            boolean ban = true;
            codigo = 0;
            do{
                codigo++;
                for(Usuario unElemento : elementos){
                    if(unElemento.getId() == codigo){
                        ban = true;
                        break;
                    }else ban = false;
                }
            }while(ban);
        }
        return codigo;
    }
    
    public static void modificarUsuario(List<Usuario> usuarios, Usuario miUsuario){
        for(Usuario unUsuario : usuarios){
            if(unUsuario.getClave().equals(miUsuario.getClave())){
                usuarios.set(usuarios.indexOf(unUsuario), miUsuario);
                break;
            }
        }
    }
    
    public static void eliminarUsuario(List<Usuario> usuarios, int id){
        for(Usuario unUsuario : usuarios){
            if(unUsuario.getId() == id){
                usuarios.remove(unUsuario);
                break;
            }
        }
    }
    
    
    public static boolean autenticar(List<Usuario> usuarios, String usu, String clave){
        boolean res = false;
        for(Usuario unUsuario : usuarios){
            if(unUsuario.getUsuario().equals(usu) && unUsuario.getClave().equals(clave) ){
                res = true;
                break;
            }
        }
        return res;
    }
    
    public static boolean comprobarUsuario(List<Usuario> usuarios, String usu){
         boolean res = false;
        for(Usuario unUsuario : usuarios){
            if(unUsuario.getUsuario().equals(usu)){
                res = true;
                break;
            }
        }
        return res;
    }
    
    public static Usuario buscarUsuario(List<Usuario> usuarios, String usu, String clave) throws NoSuchAlgorithmException{
        Usuario miUsuario = null;
        String claveSha = sha1(clave);
        for(Usuario unUsuario : usuarios){
            if(unUsuario.getUsuario().equals(usu) && unUsuario.getClave().equals(claveSha) ){
                miUsuario = unUsuario;
                break;
            }
        }
        return miUsuario;
    }
    
}
