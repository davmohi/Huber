
package una.progra4.huber.bl;

import java.util.List;
import una.progra4.huber.domain.Servicio;


public class ServicioBL extends BaseBL implements IBaseBL<Servicio, Integer> {

    @Override
    public void save(Servicio o) {
        this.getDao(o.getClass().getName()).save(o);
    }

    @Override
    public Servicio merge(Servicio o) {
        return (Servicio) this.getDao(o.getClass().getName()).merge(o);
    }

    @Override
    public void delete(Servicio o) {
        this.getDao(o.getClass().getName()).delete(o);
    }

    @Override
    public Servicio findById(Integer o) {
       return (Servicio) this.getDao(o.getClass().getName()).findById(o);
    }

    @Override
    public List<Servicio> findAll(String className) {
       return this.getDao(className).findAll();
    }
    
}
