package springmvc.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Repository;

import springmvc.model.Usuario;
@Repository
public class LoginDaoImpl implements LoginDao{
	NamedParameterJdbcTemplate namedParameterJdbcTemplate;
	@Autowired
	public void setNamedParameterJdbcTemplate(NamedParameterJdbcTemplate namedParameterJdbcTemplate) throws DataAccessException
	{
		this.namedParameterJdbcTemplate=namedParameterJdbcTemplate;
	}
	//Validacion con el usuario y contraseña
	public Usuario findUsuario(String usuario) {
		String query= "Select * from Usuario when usuario= :usuario";
		try {
			Usuario user = namedParameterJdbcTemplate.queryForObject(query, getSqlParameterByModel(usuario, "") , new UsuarioMapper());
			return user;
		} catch (EmptyResultDataAccessException e) {
			// TODO: handle exception
			return null;
		}
		
	}
	private SqlParameterSource getSqlParameterByModel(String usuario, String password)
	{
	MapSqlParameterSource ParamSources =new MapSqlParameterSource();	
	ParamSources.addValue(usuario, usuario);
	ParamSources.addValue(password, password);
	return ParamSources;
	}
	private static final class UsuarioMapper implements RowMapper<Usuario>{

		public Usuario mapRow(ResultSet rs, int rowNum) throws SQLException {
			String usuario=rs.getString("usuario");
			String password=rs.getString("password");
			return new Usuario(usuario, password);
		} 
		
	}
//Validacion del rol que llevara el usuario 
	public List<String> getRol(String nombre) {
		String query= "select nombre from Rol WHERE usuario=:usuario";
		List<String> roles = namedParameterJdbcTemplate.queryForList(query, getSqlParameterByModel(nombre, ""), String.class);
		  return roles;
	}

}
