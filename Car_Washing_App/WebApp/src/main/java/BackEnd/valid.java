package BackEnd;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class valid
 */
@WebServlet("/valid")
public class valid extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
   
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 Connection con = null;
	        PreparedStatement p = null;
	        ResultSet rs = null;
	        PrintWriter out = response.getWriter();
	        response.setContentType("text/html");
	        try {
	        	String mailId = request.getParameter("email");
	        	String pass = request.getParameter("password");
	        	Class.forName("com.mysql.jdbc.Driver");
	            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root","1234");
	            String sql = "select * from details";
	            p = con.prepareStatement(sql);
	            rs = p.executeQuery();
	 
	           
	            System.out.println("name\t\temail");
	 
	            
	            while (rs.next()) {
	 
	                String name = rs.getString("uname");
	                String checkmail = rs.getString("email");
	                String checkPass = rs.getString("upass");
	                String phone = rs.getString("umobile");
	               if(mailId.equals(checkmail) && pass.equals(checkPass)) {
	            	   request.setAttribute("display",name);
	            	   request.setAttribute("phone",phone);
	            	   RequestDispatcher rd = request.getRequestDispatcher("welcome.jsp");
	            	   rd.forward(request, response);
	               }
	            }
	            out.println("<script type=\"text/javascript\">");
	            out.println("alert('User or password incorrect');");
	            out.println("</script>");
	            RequestDispatcher rd = request.getRequestDispatcher("signin.jsp");
	            rd.forward(request, response);
 
	            
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
