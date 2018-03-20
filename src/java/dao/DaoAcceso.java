/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.io.Serializable;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import HibernateUtil.HibernateUtil;
import beans.DataUsuario;
import java.util.Iterator;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Erik
 */
public class DaoAcceso implements Serializable {
    
    private Session sessions;
    private Transaction transaction;

    private boolean initTran() {
     
        boolean result = false;
        try {
            sessions = HibernateUtil.getSession();
            transaction = sessions.beginTransaction();
            result = true;
        } catch (HibernateException ex1) {
            result = false;
            System.out.println("Error al iniciar la transaccion:" + ex1.getMessage());
        }
        return result;
    }

    

    public boolean chkUserPass(String usuario, String clave) {
        boolean res = false;
        Session session = HibernateUtil.getSession();
        Transaction tran = session.beginTransaction();
        try {
            //String cve = new String(Base64.encode(Protection.makeDigest(usuario, clave)));
            List acceso = session.createCriteria(DataUsuario.class).add(Restrictions.like("usuario", usuario)).add(Restrictions.like("password", clave)).list();
            Iterator i = acceso.iterator();
            if (i.hasNext()) {//Usuario y contraseña correctos
                res = true;
            }
            tran.commit();
        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            HibernateUtil.close(session);
        }
        return res;
    }

}
