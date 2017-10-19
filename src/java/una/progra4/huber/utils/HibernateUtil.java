
package una.progra4.huber.utils;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;


public class HibernateUtil {

    private static final SessionFactory sessionFactory;
    private Session session;
    private Transaction transaction;
    
    
    
    static {
        try {
            // Create the SessionFactory from standard (hibernate.cfg.xml) 
            // config file.
            sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
        } catch (Throwable ex) {
            // Log the exception. 
            System.err.println("Initial SessionFactory creation failed." + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }
    
    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }
    
    
    
    public void iniciarOperacion() throws HibernateException {
        session = HibernateUtil.getSessionFactory().openSession();
        transaction = session.beginTransaction();
    }
    
    public void manejarExcepcion(HibernateException ex) throws HibernateException {
        transaction.rollback();
        throw new HibernateException("Ha ocurrido un error con la Base de Datos...",ex);
    }
    
    public Session getSession(){
        return session;
    }
    
    public Transaction getTransaction(){
        return transaction;
    }
    
    public void setTransaction(Transaction trans){
        this.transaction = trans;
    }
    
}
