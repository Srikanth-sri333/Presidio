package BackEnd;

 
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class viewStatus
 */
@WebServlet("/viewStatus")
public class viewStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 String nums = request.getParameter("number");
		 PrintWriter out = response.getWriter();
		 response.setContentType("text/html");
		 out.println("<htlm>");
		 out.println("<body>");
		 Connection con = null;
		 try {
			 Class.forName("com.mysql.jdbc.Driver");

	         con =DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root","1234");
	         Statement st = con.createStatement();
	         ResultSet rts = st.executeQuery("select *from bookingdetails");
	        
	         while(rts.next()) {
	        	String check_num = rts.getString("bookId");
	        	if(check_num.equals(nums)) {
	        		String Number = rts.getString("umobile");
	        		String Date = rts.getString("bookingdate");
	        		String Place = rts.getString("place");
	        		out.println("<br></br>");
	                out.println("Mobile Number-->: " + Number);
	        		out.println("<br></br>");
	                out.println("Your Date------>: " + Date);
	        		out.println("<br></br>");
	                out.println("Place --------->: " + Place );   
 	
	        	}
	         }
		 }
		 catch(Exception e) {
			 e.printStackTrace();
		 }
		 finally {
			 try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		 }
		 
	}

}
