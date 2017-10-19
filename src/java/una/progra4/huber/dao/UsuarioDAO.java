/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package una.progra4.huber.dao;

import java.util.List;
import org.hibernate.HibernateException;
import una.progra4.huber.domain.Usuario;
import una.progra4.huber.utils.HibernateUtil;

/**
 *
 * @author Eithan
 */
public class UsuarioDAO extends HibernateUtil implements IBaseDAO<Usuario, Integer> {

    @Override
    public void save(Usuario o) {
        try {
            iniciarOperacion();
            getSession().save(o);
            getTransaction().commit();
        } catch (HibernateException he) {
            manejarExcepcion(he);
            throw he;

        } finally {
            getSession().close();
        }
    }

    @Override
    public Usuario merge(Usuario o) {
        try {
            iniciarOperacion();
            o = (Usuario) getSession().merge(o);
            getTransaction().commit();
        } catch (HibernateException he) {
            manejarExcepcion(he);
            throw he;
        } finally {
            getSession().close();
        }
        return o;
    }

    @Override
    public void delete(Usuario o) {
        try{
            iniciarOperacion();
            getSession().delete(o);
            getTransaction().commit();
        
        } catch(HibernateException he){
            manejarExcepcion(he);
            throw he;
        } finally {
            getSession().close();
        }
    }

    @Override
    public Usuario findById(Integer o) {
        Usuario usuarios = null;
        
        try{
        iniciarOperacion();
        usuarios = (Usuario) getSession().get(Usuario.class, o);
        } finally {
            getSession().close();
        }
        return usuarios;
    }

    @Override
    public List<Usuario> findAll() {
        List<Usuario> listaUsuarios;
        try{
            iniciarOperacion();
            listaUsuarios = getSession().createQuery("from Usuario").list();
        } finally{
            getSession().close();
        }
        return listaUsuarios;
    }
    
}
