package Logica;

import Logica.Promocion;
import Logica.Servicio;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-02-27T19:17:48")
@StaticMetamodel(Paquete.class)
public class Paquete_ { 

    public static volatile SingularAttribute<Paquete, String> descripcion;
    public static volatile ListAttribute<Paquete, Servicio> servicios;
    public static volatile SingularAttribute<Paquete, Promocion> promocion;
    public static volatile SingularAttribute<Paquete, Double> precio;
    public static volatile SingularAttribute<Paquete, Integer> id_paquete;
    public static volatile SingularAttribute<Paquete, Date> fromFecha;
    public static volatile SingularAttribute<Paquete, Date> toFecha;
    public static volatile SingularAttribute<Paquete, Boolean> baja;
    public static volatile SingularAttribute<Paquete, String> nombre;

}