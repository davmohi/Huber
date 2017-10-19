package una.progra4.huber.domain;
// Generated 30-sep-2017 15:36:55 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Veiculo generated by hbm2java
 */
public class Veiculo  implements java.io.Serializable {


     private int placa;
     private Usuario usuario;
     private String modelo;
     private int ano;
     private String color;
     private Integer puntuacion;
     private short estado;
     private int ubicacionId;
     private short vigente;
     private String licencia;
     private Set<Servicio> servicios = new HashSet<Servicio>(0);
     private Set<Usuario> usuarios = new HashSet<Usuario>(0);

    public Veiculo() {
    }

	
    public Veiculo(int placa, Usuario usuario, String modelo, int ano, String color, short estado, int ubicacionId, short vigente, String licencia) {
        this.placa = placa;
        this.usuario = usuario;
        this.modelo = modelo;
        this.ano = ano;
        this.color = color;
        this.estado = estado;
        this.ubicacionId = ubicacionId;
        this.vigente = vigente;
        this.licencia = licencia;
    }
    public Veiculo(int placa, Usuario usuario, String modelo, int ano, String color, Integer puntuacion, short estado, int ubicacionId, short vigente, String licencia, Set<Servicio> servicios, Set<Usuario> usuarios) {
       this.placa = placa;
       this.usuario = usuario;
       this.modelo = modelo;
       this.ano = ano;
       this.color = color;
       this.puntuacion = puntuacion;
       this.estado = estado;
       this.ubicacionId = ubicacionId;
       this.vigente = vigente;
       this.licencia = licencia;
       this.servicios = servicios;
       this.usuarios = usuarios;
    }
   
    public int getPlaca() {
        return this.placa;
    }
    
    public void setPlaca(int placa) {
        this.placa = placa;
    }
    public Usuario getUsuario() {
        return this.usuario;
    }
    
    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
    public String getModelo() {
        return this.modelo;
    }
    
    public void setModelo(String modelo) {
        this.modelo = modelo;
    }
    public int getAno() {
        return this.ano;
    }
    
    public void setAno(int ano) {
        this.ano = ano;
    }
    public String getColor() {
        return this.color;
    }
    
    public void setColor(String color) {
        this.color = color;
    }
    public Integer getPuntuacion() {
        return this.puntuacion;
    }
    
    public void setPuntuacion(Integer puntuacion) {
        this.puntuacion = puntuacion;
    }
    public short getEstado() {
        return this.estado;
    }
    
    public void setEstado(short estado) {
        this.estado = estado;
    }
    public int getUbicacionId() {
        return this.ubicacionId;
    }
    
    public void setUbicacionId(int ubicacionId) {
        this.ubicacionId = ubicacionId;
    }
    public short getVigente() {
        return this.vigente;
    }
    
    public void setVigente(short vigente) {
        this.vigente = vigente;
    }
    public String getLicencia() {
        return this.licencia;
    }
    
    public void setLicencia(String licencia) {
        this.licencia = licencia;
    }
    public Set<Servicio> getServicios() {
        return this.servicios;
    }
    
    public void setServicios(Set<Servicio> servicios) {
        this.servicios = servicios;
    }
    public Set<Usuario> getUsuarios() {
        return this.usuarios;
    }
    
    public void setUsuarios(Set<Usuario> usuarios) {
        this.usuarios = usuarios;
    }




}

