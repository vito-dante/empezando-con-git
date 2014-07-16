package MAP;
// Generated Jul 15, 2014 10:25:33 AM by Hibernate Tools 3.6.0


import java.util.HashSet;
import java.util.Set;

/**
 * Categoria generated by hbm2java
 */
public class Categoria  implements java.io.Serializable {


     private Integer idCategoria;
     private Estado estado;
     private String categoria;
     private String detalleCategoria;
     private Set productos = new HashSet(0);

    public Categoria() {
    }

	
    public Categoria(Estado estado) {
        this.estado = estado;
    }
    public Categoria(Estado estado, String categoria, String detalleCategoria, Set productos) {
       this.estado = estado;
       this.categoria = categoria;
       this.detalleCategoria = detalleCategoria;
       this.productos = productos;
    }
   
    public Integer getIdCategoria() {
        return this.idCategoria;
    }
    
    public void setIdCategoria(Integer idCategoria) {
        this.idCategoria = idCategoria;
    }
    public Estado getEstado() {
        return this.estado;
    }
    
    public void setEstado(Estado estado) {
        this.estado = estado;
    }
    public String getCategoria() {
        return this.categoria;
    }
    
    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }
    public String getDetalleCategoria() {
        return this.detalleCategoria;
    }
    
    public void setDetalleCategoria(String detalleCategoria) {
        this.detalleCategoria = detalleCategoria;
    }
    public Set getProductos() {
        return this.productos;
    }
    
    public void setProductos(Set productos) {
        this.productos = productos;
    }




}

