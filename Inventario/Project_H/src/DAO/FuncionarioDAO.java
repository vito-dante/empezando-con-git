/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import MAP.Funcionario;
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
public class FuncionarioDAO {

    private Funcionario persona;

    //==============================================================================    
    public List<Funcionario> ListarPersona() {
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        return sesion.createQuery("FROM Funcionario").list();
    }
//============================================================================== 

    public Funcionario MostrarPersonaPorId(int id) {
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        List la = sesion.createQuery("FROM persona WHERE id_persona=" + id + "").list();
        if (la != null) {
//           empleado = (Empleado)la.get(0);
        }
        return persona;
    }
//==============================================================================  

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

    public void UpdateFuncionario(Funcionario func) {
        try {
            SessionFactory sesion = HibernateUtil.getSessionFactory();
            Session session;
            session = sesion.openSession();
            Transaction trans = session.beginTransaction();
            session.update(func);
            trans.commit();
            session.close();
            System.out.println("haciendo update");

        } catch (HibernateException e) {
            JOptionPane.showMessageDialog(null, "Error en insertar \n" + e);
            System.out.println(e);
            //session.getTransaction().rollback();
        }
    }
}
