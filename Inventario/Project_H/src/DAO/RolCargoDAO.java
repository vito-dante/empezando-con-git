/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DAO;

import MAP.Funcionario;
import MAP.RolCargo;
import ORMutil.HibernateUtil;
import java.util.List;
import javax.swing.JOptionPane;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author Vito
 */
public class RolCargoDAO {
    private RolCargo rol;

    //==============================================================================    
    public List<RolCargo> ListarCargo() {
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        return sesion.createQuery("FROM RolCargo").list();
    }
//============================================================================== 
    public List<RolCargo> BCambiar(String cargo) {
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        return sesion.createQuery("FROM RolCargo where cargo="+"'"+cargo+"'"+"").list();
    }

//==============================================================================  

    public void insertarPersona(Funcionario pers) {
        try {
            SessionFactory sesion = HibernateUtil.getSessionFactory();
            Session session;
            session = sesion.openSession();
            Transaction trans = session.beginTransaction();
            session.save(pers);
            trans.commit();
            session.close();
            System.out.println("haciendo jjj");

        } catch (HibernateException e) {
            JOptionPane.showMessageDialog(null, "Error en insertar \n" + e);
            System.out.println(e);
            //session.getTransaction().rollback();
        }
    }
    
        public void insertarFuncionario(Funcionario func) {
        try {
            SessionFactory sesion = HibernateUtil.getSessionFactory();
            Session session;
            session = sesion.openSession();
            Transaction trans = session.beginTransaction();
            session.save(func);
            trans.commit();
            session.close();
            System.out.println("haciendo rrr");

        } catch (HibernateException e) {
            JOptionPane.showMessageDialog(null, "Error en insertar \n" + e);
            System.out.println(e);
            //session.getTransaction().rollback();
        }
    }
//==============================================================================  

    public void actualizar() {
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        try {
            sesion.beginTransaction();
            sesion.update(this.rol);
            sesion.getTransaction().commit();
            JOptionPane.showMessageDialog(null, "Comprobante se registro correctamente");
        } catch (HibernateException e) {
            JOptionPane.showMessageDialog(null, "Error en actualizar \n" + e);
            sesion.getTransaction().rollback();
        }
    }
}
