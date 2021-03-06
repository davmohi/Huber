package una.progra4.huber.domain;
// Generated 30-sep-2017 15:36:55 by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Usuario generated by hbm2java
 */
public class Usuario  implements java.io.Serializable {


     private String id;
     private String nombre;
     private String apellidos;
     private String correo;
     private String usuario;
     private String password;
     private Date nacimiento;
     private String telefono;
     private int rol;
     private int vigente;
     private Set<Servicio> serviciosForUsuarioTripulante = new HashSet<Servicio>(0);
     private Set<Servicio> serviciosForUsuarioConductor = new HashSet<Servicio>(0);
     private Set<Veiculo> veiculos = new HashSet<Veiculo>(0);
     private Set<Veiculo> veiculos_1 = new HashSet<Veiculo>(0);

    public Usuario() {
    }

	
    public Usuario(String id, String password, int rol) {
        this.id = id;
        this.password = password;
        this.rol = rol;
    }
    public Usuario(String id,
            String nombre,
            String apellidos,
            String correo,
            String usuario,
            String password,
            Date nacimiento,
            String telefono,
            int rol,
            int vigente,
            Set<Servicio> serviciosForUsuarioTripulante,
            Set<Servicio> serviciosForUsuarioConductor,
            Set<Veiculo> veiculos,
            Set<Veiculo> veiculos_1) {
       this.id = id;
       this.nombre = nombre;
       this.apellidos = apellidos;
       this.correo = correo;
       this.usuario = usuario;
       this.password = password;
       this.nacimiento = nacimiento;
       this.telefono = telefono;
       this.rol = rol;
       this.vigente = vigente;
       this.serviciosForUsuarioTripulante = serviciosForUsuarioTripulante;
       this.serviciosForUsuarioConductor = serviciosForUsuarioConductor;
       this.veiculos = veiculos;
       this.veiculos_1 = veiculos_1;
    }
   
    public String getId() {
        return this.id;
    }
    
    public void setId(String id) {
        this.id = id;
    }
    public String getNombre() {
        return this.nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public String getApellidos() {
        return this.apellidos;
    }
    
    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }
    public String getCorreo() {
        return this.correo;
    }
    
    public void setCorreo(String correo) {
        this.correo = correo;
    }
    public String getUsuario() {
        return this.usuario;
    }
    
    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }
    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    public Date getNacimiento() {
        return this.nacimiento;
    }
    
    public void setNacimiento(Date nacimiento) {
        this.nacimiento = nacimiento;
    }
    public String getTelefono() {
        return this.telefono;
    }
    
    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
    public int getRol() {
        return this.rol;
    }
    
    public void setRol(int rol) {
        this.rol = rol;
    }
    public int getVigente() {
        return this.vigente;
    }
    
    public void setVigente(int vigente) {
        this.vigente = vigente;
    }
    public Set<Servicio> getServiciosForUsuarioTripulante() {
        return this.serviciosForUsuarioTripulante;
    }
    
    public void setServiciosForUsuarioTripulante(Set<Servicio> serviciosForUsuarioTripulante) {
        this.serviciosForUsuarioTripulante = serviciosForUsuarioTripulante;
    }
    public Set<Servicio> getServiciosForUsuarioConductor() {
        return this.serviciosForUsuarioConductor;
    }
    
    public void setServiciosForUsuarioConductor(Set<Servicio> serviciosForUsuarioConductor) {
        this.serviciosForUsuarioConductor = serviciosForUsuarioConductor;
    }
    public Set<Veiculo> getVeiculos() {
        return this.veiculos;
    }
    
    public void setVeiculos(Set<Veiculo> veiculos) {
        this.veiculos = veiculos;
    }
    public Set<Veiculo> getVeiculos_1() {
        return this.veiculos_1;
    }
    
    public void setVeiculos_1(Set<Veiculo> veiculos_1) {
        this.veiculos_1 = veiculos_1;
    }




}


