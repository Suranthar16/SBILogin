package SbiDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import SbiDB.SbiDB;
import SbiDTO.SbiDTO;


public class SbiDAO {
	
	public boolean Sbi(SbiDTO dto) {
		
		
		System.out.println("dtoname="+dto.getName());
		
		System.out.println("dtoDob="+dto.getDob());
		
		System.out.println("dtoemail="+dto.getEmail());
		
		System.out.println("dtopassword="+dto.getPassword());
		
		System.out.println("dtoage="+dto.getAge());
		
		System.out.println("dtoqualification="+dto.getQualification());
		
		System.out.println("dtohobbies="+dto.getA());
		
		System.out.println("dtomobile="+dto.getMobile());
		
		
		
		SbiDB db=new SbiDB();
		Connection conn= db.getConnection();
		boolean result1=false;
		
		String sql="INSERT INTO test1.sbidata(Name,Dob,Email,password,Age,Qualification,Hobbies,Mobile)VALUES(?,?,?,?,?,?,?,?);";
		PreparedStatement ps=null;
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getDob());
			ps.setString(3, dto.getEmail());
			ps.setString(4, dto.getPassword());
			ps.setString(5, dto.getAge());
			ps.setString(6, dto.getQualification());
			ps.setString(7, dto.getA());
			ps.setString(8, dto.getMobile());
			
			double result=0;
			result=ps.executeUpdate();//Important key for Updating values into Database
			System.out.println(result);
				if(result>0) 
				{
					result1=true;
					System.out.println("insert success!");
				}
		    } catch (Exception e) {
		    	System.out.println(e);
		    }
		
		
		
		String sql1="INSERT INTO test1.sbilogin(UserName,Password)VALUES(?,?);";
		PreparedStatement ps1=null;
		try {
			ps1=conn.prepareStatement(sql1);
			ps1.setString(1, dto.getEmail());
			ps1.setString(2, dto.getPassword());
			
			double result=0;
			result=ps1.executeUpdate();
			System.out.println(result);
				if(result>0) 
				{
					result1=true;
					System.out.println("insert success!");
				}
		    } catch (Exception e) {
		    	System.out.println(e);
		    }
		
		
		
		System.out.println(conn);
		return result1;
		
	}
	
	
	
	//get data from database
	 public ArrayList<SbiDTO> retrieveUser() {
			
		    SbiDB db=new SbiDB();
			Connection conn= db.getConnection();
			
			ArrayList<SbiDTO> list=new ArrayList<SbiDTO>();
			System.out.println(conn);
			ResultSet rs=null;
			PreparedStatement ps=null;
			
			String sql="select * from test1.sbidata;";
			
			try {
				ps=conn.prepareStatement(sql);
				rs=ps.executeQuery();
				System.out.println(rs);
				
				while(rs.next())
				{
				
					SbiDTO dto1=new SbiDTO();
					String Name=rs.getString("Name");
					System.out.println("Name---->"+Name);
					dto1.setName(Name);;
					
					String Dob=rs.getString("Dob");
					System.out.println("Dob---->"+Dob);
					dto1.setDob(Dob);
					
					String Email=rs.getString("Email");
					System.out.println("Email---->"+Email);
					dto1.setEmail(Email);
					
					String password=rs.getString("password");
					System.out.println("password---->"+password);
					dto1.setPassword(password);
					
					String Age=rs.getString("Age");
					System.out.println("Age---->"+Age);
					dto1.setAge(Age);
					
					String Qualification=rs.getString("Qualification");
					System.out.println("Qualification---->"+Qualification);
					dto1.setQualification(Qualification);
					
					String Hobbies=rs.getString("Hobbies");
					System.out.println("Hobbies---->"+Hobbies);
					dto1.setA(Hobbies);
					
					String Mobile=rs.getString("Mobile");
					System.out.println("Mobile---->"+Mobile);
					dto1.setMobile(Mobile);
					
					
					list.add(dto1);
				}
				
			} catch (Exception e) {
			System.out.println(e);
			}
			
			
			return list;		
	 }
	 
	 
	//email & password validation
		 public boolean validate(String useremail, String userpassword) {
		     
			 SbiDB db=new SbiDB();
			 Connection conn= db.getConnection();
			 boolean result1=false;
			 ResultSet rs=null;
			 PreparedStatement ps=null;
			 
			  String sql= "SELECT UserName, Password FROM Sbilogin";
			 try {
		           ps=conn.prepareStatement(sql);
				   rs=ps.executeQuery();
		            while (rs.next())
		            {
		            String name = rs.getString("UserName");
		            String password = rs.getString("Password");

		               if (useremail!=null&&userpassword!=null&&(useremail.equals(name)) && (userpassword.equals(password))) {

		                  System.out.println("Username and Password exist"); 
		                  result1=true;
		            }else {

		             System.out.println("Please Check Username and Password ");
		            }
		            }}  
		         catch (Exception e) {

		            System.out.println(e);
		        }
			return result1;

		 }          
	 
	 
		 
		 public boolean SbiDelete(String email) {

			 SbiDB db=new SbiDB();
			 Connection conn= db.getConnection();
			 boolean result1=false;

			 String sql="Delete From test1.Sbidata Where email=?";
			 String sql1="Delete From test1.Sbilogin Where email=?";
			 PreparedStatement ps=null;
			 PreparedStatement ps1=null;
			 try {
			 	ps=conn.prepareStatement(sql);
			 	ps1=conn.prepareStatement(sql1);
			 	ps.setString(1, email);
			 	ps1.setString(1, email);
			 	
			 	
			 	double result=0;
			 	result=ps.executeUpdate();
			 	System.out.println(result);
			 		if(result>0) 
			 		{
			 			result1=true;
			 			System.out.println("Delete success!");
			 		}
			     } catch (Exception e) {
			     	System.out.println(e);
			     }

			 	System.out.println(conn);
			 	return result1;
			   }
 

	
}
