/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package una.progra4.huber.bl;

import java.util.LinkedHashMap;
import una.progra4.huber.dao.*;
import una.progra4.huber.dao.IBaseDAO;


public class BaseBL {
   private final LinkedHashMap<String, IBaseDAO> daos; 
    
    public BaseBL() {
        daos = new LinkedHashMap();
        daos.put("una.progra4.huber.domain.Usuario",new UsuarioDAO());
        daos.put("una.progra4.huber.domain.Servicio",new ServicioDAO());
        daos.put("una.progra4.huber.domain.Veiculo",new VeiculoDAO());
    }
    
    public IBaseDAO getDao(String className){
        return daos.get(className);
    }
}
