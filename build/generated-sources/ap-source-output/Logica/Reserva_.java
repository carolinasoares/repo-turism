package Logica;

import Logica.Cliente;
import Logica.Paquete;
import Logica.Servicio;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-02-27T19:17:48")
@StaticMetamodel(Reserva.class)
public class Reserva_ { 

    public static volatile SingularAttribute<Reserva, String> tipo;
    public static volatile SingularAttribute<Reserva, String> estado;
    public static volatile SingularAttribute<Reserva, Servicio> servicio;
    public static volatile SingularAttribute<Reserva, Date> fecha_reserva;
    public static volatile SingularAttribute<Reserva, String> medio_pago;
    public static volatile SingularAttribute<Reserva, Double> adelanto;
    public static volatile SingularAttribute<Reserva, Paquete> paquete;
    public static volatile SingularAttribute<Reserva, Cliente> cliente;
    public static volatile SingularAttribute<Reserva, Boolean> baja;
    public static volatile SingularAttribute<Reserva, Integer> id_reserva;
    public static volatile SingularAttribute<Reserva, String> medio_pago_adelanto;
    public static volatile SingularAttribute<Reserva, Double> precioTotal;
    public static volatile SingularAttribute<Reserva, Double> pago_reserva;
    public static volatile SingularAttribute<Reserva, Date> fecha_caducidad;

}