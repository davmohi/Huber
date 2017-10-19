
package una.progra4.huber.test;

import java.util.Date;
import una.progra4.huber.bl.UsuarioBL;
import una.progra4.huber.domain.Usuario;



public class Test {

    public static void main(String[] args) {
        

        //..........Metodos para Usuario...................//
        UsuarioBL u1 = new UsuarioBL();
        Usuario usuario_1 = new Usuario();
        usuario_1.setId("116290648");
        usuario_1.setNombre("eithan");
        usuario_1.setApellidos("Mendez");
        usuario_1.setCorreo("ova@gmail.com");
        usuario_1.setUsuario("EithanMM");
        usuario_1.setPassword("123");
        usuario_1.setNacimiento(new Date());
        usuario_1.setTelefono("232455");
        usuario_1.setRol(0);
        usuario_1.setVigente(0);
        
        u1.save(usuario_1);
        //u1.delete(usuario_1); ocupa un id para borrar
 
        
        
        //..........Metodos para Direccion................//
        //..........Metodos para Veiculo..................//
    }
    
}
