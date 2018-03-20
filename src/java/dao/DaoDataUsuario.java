/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import HibernateUtil.HibernateUtil;
import beans.DataUsuario;
import java.io.Serializable;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Erik
 */
public class DaoDataUsuario implements Serializable {
    
    public DataUsuario existeUsuario(String usuario) {
        
        DataUsuario dataUsuario = null;
      
        Session session = HibernateUtil.getSession();
        session.beginTransaction();
        try {
            Criteria cr = session.createCriteria(DataUsuario.class);
            cr.add(Restrictions.isNotNull("usuario"));
            cr.add(Restrictions.ilike("usuario", usuario.trim()));
            dataUsuario = (DataUsuario) cr.uniqueResult();
            session.getTransaction().commit();
        } catch (Exception ex) {
            session.getTransaction().rollback();
            ex.printStackTrace(System.err);
        } finally {
            HibernateUtil.close(session);

        }
        
        return dataUsuario;
    }
    
}
