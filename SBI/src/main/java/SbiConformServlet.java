

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import SbiDAO.SbiDAO;
import SbiDTO.SbiDTO;

/**
 * Servlet implementation class SbiConformServlet
 */
@WebServlet("/SbiConformServlet")
public class SbiConformServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SbiConformServlet() {
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
		
		
		HttpSession session =request.getSession();
		
		 dto=(SbiDTO)session.getAttribute("dto");
		
		SbiDAO dao=new SbiDAO();
		dao.Sbi(dto);
		
		
		
		
		
		  ArrayList<SbiDTO> list=dao.retrieveUser();
		  if(list!=null)System.out.println("list size---"+list.size());
		  
		  
		  
		  session.setAttribute("Retrivelist", list);
		   
		  String email=dto.getEmail();
		  
		  session.setAttribute("emailval",email);
		 
		 
		  response.sendRedirect("SbiAcknowledg.jsp");
	}

}
