package beans;
// Generated 12/03/2018 12:07:35 PM by Hibernate Tools 4.3.1


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * DataUsuario generated by hbm2java
 */
@Entity
@Table(name="data_usuario"
    ,catalog="consultorio_dental"
)
public class DataUsuario  implements java.io.Serializable {


     private Integer idUsuario;
     private CatRoles catRoles;
     private DataPersona dataPersona;
     private String usuario;
     private String password;
     private Boolean activo;

    public DataUsuario() {
    }

	
    public DataUsuario(CatRoles catRoles, DataPersona dataPersona, String usuario, String password) {
        this.catRoles = catRoles;
        this.dataPersona = dataPersona;
        this.usuario = usuario;
        this.password = password;
    }
    public DataUsuario(CatRoles catRoles, DataPersona dataPersona, String usuario, String password, Boolean activo) {
       this.catRoles = catRoles;
       this.dataPersona = dataPersona;
       this.usuario = usuario;
       this.password = password;
       this.activo = activo;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="id_usuario", unique=true, nullable=false)
    public Integer getIdUsuario() {
        return this.idUsuario;
    }
    
    public void setIdUsuario(Integer idUsuario) {
        this.idUsuario = idUsuario;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="rol", nullable=false)
    public CatRoles getCatRoles() {
        return this.catRoles;
    }
    
    public void setCatRoles(CatRoles catRoles) {
        this.catRoles = catRoles;
    }

@ManyToOne
    @JoinColumn(name="id_persona", referencedColumnName = "id_persona",nullable=false)
    public DataPersona getDataPersona() {
        return this.dataPersona;
    }
    
    public void setDataPersona(DataPersona dataPersona) {
        this.dataPersona = dataPersona;
    }

    
    @Column(name="usuario", nullable=false)
    public String getUsuario() {
        return this.usuario;
    }
    
    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    
    @Column(name="password", nullable=false)
    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }

    
    @Column(name="activo")
    public Boolean getActivo() {
        return this.activo;
    }
    
    public void setActivo(Boolean activo) {
        this.activo = activo;
    }




}


