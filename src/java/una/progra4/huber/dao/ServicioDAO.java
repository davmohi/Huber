/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package una.progra4.huber.dao;

import java.util.List;
import org.hibernate.HibernateException;
import una.progra4.huber.domain.Servicio;
import una.progra4.huber.utils.HibernateUtil;


    public class ServicioDAO extends HibernateUtil implements IBaseDAO<Servicio, Integer> {

    @Override
    public void save(Servicio o) {
        
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
    public Servicio merge(Servicio o) {
        
         try{
             iniciarOperacion();
             o = (Servicio) getSession().merge(o);
        } catch(HibernateException he){
            manejarExcepcion(he);
             throw he;
        } finally {
        }
         return o;
    }

    @Override
    public void delete(Servicio o) {
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
        public Servicio findById(Integer o) {
            Servicio servicios = null;
            try {
                servicios = (Servicio) getSession().get(Servicio.class, o);
            } catch (HibernateException he) {
            } finally {
                getSession().close();
            }

            return servicios;
        }

    @Override
    public List<Servicio> findAll() {
        List<Servicio> listaServicios;
        
         try{
             iniciarOperacion();
             listaServicios = getSession().createQuery("from Servicio").list();
        } finally {
             getSession().close();
        }
         return listaServicios;
    }
    
}
