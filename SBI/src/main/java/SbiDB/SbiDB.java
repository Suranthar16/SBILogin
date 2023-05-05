package SbiDB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

public class SbiDB {
	

	public Connection getConnection() {
		Connection c=null;
		
		
		
		 try{  
			 Properties prop=new Properties();
			 prop.setProperty("user", "root");
			 prop.setProperty("password", "");
			 prop.setProperty("MaxPooledStatements", "250");
			   String url="jdbc:mysql://localhost:3306/test1"; 
			   Class.forName("com.mysql.jdbc.Driver");  
			    c=DriverManager.getConnection(url,prop); 
			    
			    
			    
			}catch(Exception ee){System.out.println(ee);}  
		 return c;
	}

}
