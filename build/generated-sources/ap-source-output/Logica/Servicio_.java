package Logica;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-02-27T19:17:48")
@StaticMetamodel(Servicio.class)
public class Servicio_ { 

    public static volatile SingularAttribute<Servicio, Double> precio;
    public static volatile SingularAttribute<Servicio, String> servicio;
    public static volatile SingularAttribute<Servicio, Date> fromFecha;
    public static volatile SingularAttribute<Servicio, Date> toFecha;
    public static volatile SingularAttribute<Servicio, Boolean> baja;
    public static volatile SingularAttribute<Servicio, String> destino;
    public static volatile SingularAttribute<Servicio, Integer> id_servicio;

}