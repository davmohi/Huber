/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package una.progra4.huber.dao;

import java.util.List;
import org.hibernate.HibernateException;
import una.progra4.huber.domain.Veiculo;
import una.progra4.huber.utils.HibernateUtil;


public class VeiculoDAO extends HibernateUtil implements IBaseDAO<Veiculo, Integer> {

    @Override
    public void save(Veiculo o) {
        
        try{
            iniciarOperacion();
            getSession().save(o);
            getTransaction().commit();
        } catch(HibernateException he){
            manejarExcepcion(he);
            throw he;
        } finally {
            getSession().close();
        }
    }

    @Override
    public Veiculo merge(Veiculo o) {
        try {
            iniciarOperacion();
            o = (Veiculo) getSession().merge(o);
        } catch (HibernateException he) {
            manejarExcepcion(he);
            throw he;
        } finally {
            getSession().close();
        }
        return o;
    }

    @Override
    public void delete(Veiculo o) {
        
             try{
                 iniciarOperacion();
                 getSession().delete(o);
                 getTransaction().commit();
                 
        } catch(HibernateException he){
            manejarExcepcion(he);
            throw he;
        } finally{     
             getSession().close();
        }
    }

    @Override
    public Veiculo findById(Integer o) {
        Veiculo vehiculos = null;
         try{
             iniciarOperacion();
             vehiculos = (Veiculo) getSession().get(Veiculo.class, o);
        } finally{
             getSession().close();
        }
         return vehiculos;
    }

    @Override
    public List<Veiculo> findAll() {
        List<Veiculo> listaVehiculos;
        try{
               iniciarOperacion();
               listaVehiculos =  getSession().createQuery("from Veiculo").list();
        } finally{
            getSession().close();
        }
        return listaVehiculos;
    }
    
}
