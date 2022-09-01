package Admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Filter
 */
@WebServlet("/Filter")
public class Filter extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 	String place1 =  request.getParameter("place");
		 	String date1 =   request.getParameter("date");
		 
		 if (place1 == null && date1 == null)
		 {
			 System.out.println("first block");
			 RequestDispatcher rd = request.getRequestDispatcher("pendingData.jsp");
			 rd.forward(request, response);
			 return; 
		 }
		 else if (place1.equals(null))
		 {
			 System.out.println("second");
			 request.setAttribute("place","null");
			 request.setAttribute("date",date1);
		 }
		 else {	
			 System.out.println("thirth");
			 request.setAttribute("place",place1);
			 request.setAttribute("date",date1);
		 }
		  
		 RequestDispatcher rd = request.getRequestDispatcher("AdminFilter.jsp");
		 rd.forward(request, response);
		 return;
	}

}
