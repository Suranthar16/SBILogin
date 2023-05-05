

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import SbiDTO.SbiDTO;
import SbiDAO.SbiDAO;



/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		SbiDTO dto=new SbiDTO();
		
		String useremail=request.getParameter("email");
		System.out.println("email="+useremail);
		
		String userpassword=request.getParameter("password");
		System.out.println("password"+userpassword);
		
		
		HttpSession session =request.getSession();
		
		  
		  session.setAttribute("emailval",useremail);
		  
		  SbiDAO dao=new SbiDAO();
		  
		  ArrayList<SbiDTO> list=dao.retrieveUser();
		  if(list!=null)System.out.println("list size---"+list.size());
		  
		  
		  
		  session.setAttribute("Retrivelist", list);
			
		
		
		boolean result = dao.validate(useremail,userpassword);
		
		  if(result) {
			  response.sendRedirect("SbiProceed.jsp");
		  }
		  else {
			  response.sendRedirect("SbiLogin.jsp?error="+"Your Username and Password Missmatch! Try Register") ;
		  }
	}

}
