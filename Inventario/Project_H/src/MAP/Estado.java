package MAP;
// Generated Jul 15, 2014 10:25:33 AM by Hibernate Tools 3.6.0


import java.util.HashSet;
import java.util.Set;

/**
 * Estado generated by hbm2java
 */
public class Estado  implements java.io.Serializable {


     private Integer idEstado;
     private String estado;
     private Set categorias = new HashSet(0);
     private Set funcionarios = new HashSet(0);
     private Set productos = new HashSet(0);
     private Set usuarios = new HashSet(0);

    public Estado() {
    }

    public Estado(String estado, Set categorias, Set funcionarios, Set productos, Set usuarios) {
       this.estado = estado;
       this.categorias = categorias;
       this.funcionarios = funcionarios;
       this.productos = productos;
       this.usuarios = usuarios;
    }
   
    public Integer getIdEstado() {
        return this.idEstado;
    }
    
    public void setIdEstado(Integer idEstado) {
        this.idEstado = idEstado;
    }
    public String getEstado() {
        return this.estado;
    }
    
    public void setEstado(String estado) {
        this.estado = estado;
    }
    public Set getCategorias() {
        return this.categorias;
    }
    
    public void setCategorias(Set categorias) {
        this.categorias = categorias;
    }
    public Set getFuncionarios() {
        return this.funcionarios;
    }
    
    public void setFuncionarios(Set funcionarios) {
        this.funcionarios = funcionarios;
    }
    public Set getProductos() {
        return this.productos;
    }
    
    public void setProductos(Set productos) {
        this.productos = productos;
    }
    public Set getUsuarios() {
        return this.usuarios;
    }
    
    public void setUsuarios(Set usuarios) {
        this.usuarios = usuarios;
    }




}

