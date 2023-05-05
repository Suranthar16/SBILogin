

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import SbiDAO.SbiDAO;
import SbiDTO.SbiDTO;

/**
 * Servlet implementation class SbiEditServlet
 */
@WebServlet("/SbiEditServlet")
public class SbiEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SbiEditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		SbiDTO dto=new SbiDTO();
		
		String name=request.getParameter("name");
		System.out.println("name="+name);
		dto.setName(name);
		
		String dob=request.getParameter("dob");
		System.out.println("dob="+dob);
		dto.setDob(dob);
		
		String emailVal=request.getParameter("emailVal");
		System.out.println("emailVal  = "+emailVal);
		  
		String email=request.getParameter("emailVal");
		System.out.println("email="+email);
		dto.setEmail(email);
		
		String password=request.getParameter("password");
		System.out.println("password="+password);
		dto.setPassword(password);
		
		String age=request.getParameter("age");
		System.out.println("age="+age);
		dto.setAge(age);
		
		String qualification=request.getParameter("qualification");
		System.out.println("qualification="+qualification);
		dto.setQualification(qualification);
		
		String a="";
		String chkbox[]=request.getParameterValues("hobbies");
		
		System.out.println(chkbox);
		for(int i=0;i<chkbox.length;i++) {
			if(i==0) {
				a+=chkbox[i];
			}else {
				a+=","+chkbox[i];
			}
			System.out.println(i+"chkbox="+a);
		}
		dto.setA(a);
		
		
		String mobile=request.getParameter("mobile");
		System.out.println("mobile="+mobile);
		dto.setMobile(mobile);
		
		
		  boolean Deleted=false;
		  
		  
		
		//Delete function 
			SbiDAO dao1=new SbiDAO();
			
			 Deleted=dao1.SbiDelete(emailVal);
			 System.out.println("delete email"+email);
			
			
			System.out.println("deleted the data");
			boolean Insert=false;
			 SbiDAO dao=new SbiDAO(); //Insert function
			if(Deleted) {
			
			 Insert=dao.Sbi(dto);
			}
		  
			response.sendRedirect("SbiLogin.jsp");
	}

}
