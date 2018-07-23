package springmvc.config;

import javax.naming.NamingException;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;
@Configuration
@ComponentScan({"springmvc"})
@Import({SecurityConfig.class})
public class WebConfig extends WebMvcConfigurerAdapter{
 @Autowired
 DataSource dataSource;
 
 @Bean 
 public NamedParameterJdbcTemplate getNamedParameterJdbcTemplate(){
	 return new NamedParameterJdbcTemplate(dataSource);
 }
 @Bean //Configuracion para la conexion en la base de datos 
 public DataSource getDataSource() throws NamingException {
	 DriverManagerDataSource dataSource = new DriverManagerDataSource();
	 dataSource.setDriverClassName("com.mysql.jdbc.Driver");
	  dataSource.setUrl("jdbc:mysql://localhost:3306/mydb");
	  dataSource.setPassword("root");
	  dataSource.setUsername("");
	  return dataSource;
}
 @Override //Declaracion de la ubicacion de los Recursos a usar
 public void addResourceHandlers(ResourceHandlerRegistry RHR){
	 RHR.addResourceHandler("/resources/**/").addResourceLocations("/resources");
 }
 @Bean //Declaracion de la carpeta que contendra las vistas jsp
 public InternalResourceViewResolver viewResolver(){
	 InternalResourceViewResolver viewResolver= new InternalResourceViewResolver();
	 viewResolver.setViewClass(JstlView.class);
	 viewResolver.setPrefix("/WEB-INF/jsp/");
	 viewResolver.setSuffix(".jsp");
	 return viewResolver;
 }
}
