/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.io.Serializable;
import java.util.List;
import javax.swing.JOptionPane;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import MAP.Usuario;
import ORMutil.HibernateUtil;

/**
 *
 * @author Vito
 */
public class Login_userDAO implements Serializable {

    private Usuario usuario;
    private String usuario_in;
    private String clave_in;
    private boolean foco = false;
    private int idUsuario;
    private int idPersona;
//==============================================================================    

    public Login_userDAO(String us, String pas) {
        this.usuario_in = us;
        this.clave_in = pas;
    }

    public void esUsuario() {
        String u, p;
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        try //<editor-fold defaultstate="collapsed" desc="comment">
        {
            //</editor-fold>
            sesion.beginTransaction();
            String cns = "From Usuario as usuario WHERE id_estado=1";
            List la = sesion.createQuery(cns).list();
            if (la != null) {
                for (int i = 0; i <= la.size() - 1; i++) {
                    usuario = (Usuario) la.get(i);
                    u = usuario.getUsuario();
                    p = usuario.getPassword();
                    if (comprobar(u, p)) {
                        foco = true;
                        idUsuario = usuario.getIdUsuario();
                      //  idPersona = usuario.getIdPersona();
                    }
                }

            }
            sesion.getTransaction().commit();
            sesion.close();
        } catch (HibernateException e) {
            sesion.getTransaction().rollback();
            JOptionPane.showMessageDialog(null, "La tabla Usuario no tiene datos\n" + e);
        }
    }
//==============================================================================    

    private boolean comprobar(String x, String y) {
        boolean res = (x.equals(usuario_in) && y.equals(clave_in));
        return res;
    }

    @SuppressWarnings("empty-statement")
    public int validar(String x, String y) {
        int res = -2;
        res = (x.equals(usuario_in) && y.equals(clave_in)) ? 0 : res;
        res = (x.equals(usuario_in) || y.equals(clave_in)) ? res : 1;
        if (res == -2) {
            if (x.equals(usuario_in)) {
                res = 2;
            } else {
                res = 3;
            }
            ;
        }
        return res;
    }

    public int tienedatos() {
        int res = -2;
        res = (usuario_in.equals("") && clave_in.equals("")) ? 0 : res;
        res = (usuario_in.equals("") || clave_in.equals("")) ? res : 1;
        if (res == -2) {
            if (usuario_in.equals("")) {
                res = 2;
            } else {
                res = 3;
            }
        }
        return res;
    }
//==============================================================================    

    public boolean getLog() {
        return this.foco;
    }
//==============================================================================

    public int getIdUsuario() {
        return this.idUsuario;
    }
//==============================================================================

    public int getIdPersona() {
        return this.idPersona;
    }
//==============================================================================
}
