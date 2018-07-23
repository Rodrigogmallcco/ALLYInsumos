package springmvc.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import springmvc.dao.LoginDao;
import springmvc.model.Usuario;

public class LoginService implements UserDetailsService{
	LoginDao loginDao;
	@Autowired
	public void setLogindao(LoginDao loginDao) {
		this.loginDao = loginDao;
	}

	@Override
	public UserDetails loadUserByUsername(String usuario) throws UsernameNotFoundException {
		Usuario usuarioInfo= loginDao.findUsuario(usuario);
		if(usuarioInfo==null) {
			throw new UsernameNotFoundException("usuario no encontrado");
		}
		List<String> roles = loginDao.getRol(usuario);
		List<GrantedAuthority> grantedAuthorityList = new ArrayList<GrantedAuthority>(); 
		  
		  if(roles!=null){
		   for(String role : roles){
		    GrantedAuthority authority = new SimpleGrantedAuthority(role);
		    grantedAuthorityList.add(authority);
		   }
		  }
		  UserDetails userDetails = new User(usuarioInfo.getUsuario() , usuarioInfo.getPassword(), grantedAuthorityList);
				  
				  return userDetails;
	}

}
