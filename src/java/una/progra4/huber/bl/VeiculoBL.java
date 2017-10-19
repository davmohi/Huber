
package una.progra4.huber.bl;

import java.util.List;
import una.progra4.huber.domain.Veiculo;


public class VeiculoBL extends BaseBL implements IBaseBL<Veiculo, Integer> {
    
    @Override
    public void save(Veiculo o) {
        this.getDao(o.getClass().getName()).merge(o);
    }

    @Override
    public Veiculo merge(Veiculo o) {
            return (Veiculo) this.getDao(o.getClass().getName()).merge(o);
    }

    @Override
    public void delete(Veiculo o) {
        this.getDao(o.getClass().getName()).delete(o);
    }

    @Override
    public Veiculo findById(Integer o) {
         return (Veiculo)this.getDao(o.getClass().getName()).findById(o);
    }

    @Override
    public List<Veiculo> findAll(String className) {
            return this.getDao(className).findAll();
    }
}
