package springmvc.dao;

import java.util.List;

import springmvc.model.Usuario;

public interface LoginDao {
 public Usuario findUsuario (String usuario);
 public List<String> getRol(String nombre);
}
