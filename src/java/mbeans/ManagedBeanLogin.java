/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mbeans;

import beans.DataUsuario;
import dao.DaoAcceso;
import dao.DaoDataUsuario;
import java.io.IOException;
import java.io.Serializable;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import lombok.Getter;
import lombok.Setter;

/**
 *
 * @author Erik
 */
@ManagedBean
@ViewScoped
public class ManagedBeanLogin implements Serializable {

    /**
     * Creates a new instance of ManagedBeanLogin
     */
    @Getter
    @Setter
    private String user;
    @Getter
    @Setter
    private String clave;
    @Getter
    @Setter
    private DataUsuario dataUsusario;
    private DaoAcceso daoAcceso;
    private DaoDataUsuario daoUsuario;

    private HttpServletRequest httpServletRequest;
    private FacesContext facesContext;
    private final String rutaLogin = "/ClinicaDental/faces/index.xhtml";

    public ManagedBeanLogin() {
        daoAcceso = new dao.DaoAcceso();
        daoUsuario = new DaoDataUsuario();
    }

    public void login() {
        System.out.println("user: " + user);
        System.out.println("password: " + clave);
        HttpSession httpSession = null;
        facesContext = FacesContext.getCurrentInstance();
        httpServletRequest = (HttpServletRequest) facesContext.getExternalContext().getRequest();
        dataUsusario = daoUsuario.existeUsuario(user);

        if (dataUsusario != null) {
            System.out.println(dataUsusario.getDataPersona().getNombre());
            if (daoAcceso.chkUserPass(user, clave)) {
                
                httpSession = (HttpSession) FacesContext.getCurrentInstance().getExternalContext().getSession(true);
                httpSession.setMaxInactiveInterval(60 * 60);//1h sin actividad para destruir la session
                httpSession.setAttribute("acceso", this.dataUsusario);
                System.out.println("Session: " + httpSession.isNew()); 
                try {
                    FacesContext.getCurrentInstance().getExternalContext().redirect("/ClinicaDental/faces/secciones/home/home.xhtml");
                } catch (Exception ex) {
                    ex.printStackTrace(System.out);
                }
            } else {
                FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_WARN, "Contrseña erronea.", null));

            }
        } else {
            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_WARN, "Usuario erroneo.", null));

        }

    }

    public void logout() {
        HttpSession httpSession = (HttpSession) FacesContext.getCurrentInstance().getExternalContext().getSession(true);
        httpSession.removeAttribute("acceso");
        httpSession.invalidate();
        //FacesContext.getCurrentInstance().getExternalContext().invalidateSession();
        try {
            FacesContext.getCurrentInstance().getExternalContext().redirect(rutaLogin);
        } catch (IOException ex) {
            Logger.getLogger(ManagedBeanLogin.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
