
package una.progra4.huber.bl;

import java.util.List;
import una.progra4.huber.domain.Usuario;


public class UsuarioBL extends BaseBL implements IBaseBL<Usuario, Integer>{

    @Override
    public void save(Usuario o) {
        this.getDao(o.getClass().getName()).save(o);
    }

    @Override
    public Usuario merge(Usuario o) {
            return (Usuario) this.getDao(o.getClass().getName()).merge(o);
    }

    @Override
    public void delete(Usuario o) {
        this.getDao(o.getClass().getName()).delete(o);
    }

    @Override
    public Usuario findById(Integer o) {
         return (Usuario)this.getDao(o.getClass().getName()).findById(o);
    }

    @Override
    public List<Usuario> findAll(String className) {
            return this.getDao(className).findAll();
    }
    
}
