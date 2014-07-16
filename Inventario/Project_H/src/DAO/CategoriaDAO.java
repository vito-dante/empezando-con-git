/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import MAP.Categoria;
import ORMutil.HibernateUtil;
import java.util.List;
import org.hibernate.Session;

/**
 *
 * @author Vito
 */
public class CategoriaDAO {

    private CategoriaDAO rol;

    //==============================================================================    
    public List<Categoria> ListarCargo() {
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        return sesion.createQuery("FROM Categoria").list();
    }

    //==============================================================================   

    public List<Categoria> BCambiar(String cargo) {
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        return sesion.createQuery("FROM Categoria where categoria=" + "'" + cargo + "'" + "").list();
    }

}
