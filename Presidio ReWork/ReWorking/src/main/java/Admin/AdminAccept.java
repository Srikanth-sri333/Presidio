package Admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdminAccept
 */
@WebServlet("/AdminAccept")
public class AdminAccept extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 PrintWriter out = response.getWriter();
		 response.setContentType("text/html");
		 String num =  (request.getParameter("TicketId"));
		 System.out.println(num);
		 Connection con = null;
		  
		 PreparedStatement pst = null;
		 try {
			 Class.forName("com.mysql.jdbc.Driver");
			 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/usersrework","root","1234");
			 String sql = "update bookingDetails set CurrentStatus = 'Accept' where TicketId = "+"\""+num+"\""; 
			 pst = con.prepareStatement(sql);
			 pst.executeUpdate();
			 RequestDispatcher rd = request.getRequestDispatcher("pendingData.jsp");
			 rd.forward(request, response);
			 return;
		 }
		 catch(Exception e)
		 {
			 e.printStackTrace();
		 }
		 
	}

}
