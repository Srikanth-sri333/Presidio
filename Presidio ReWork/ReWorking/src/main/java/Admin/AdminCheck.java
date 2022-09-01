package Admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Admin
 */
@WebServlet("/AdminCheck")
public class AdminCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String adminName =   request.getParameter("adminName");
		String adminPass =   request.getParameter("adminPass");
		 
		PreparedStatement pst = null;
		ResultSet rs = null;
		Connection con = null;
		
		try {

			Class.forName("com.mysql.jdbc.Driver"); 
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/usersrework","root","1234");
			pst = con.prepareStatement("select *from adminData");
			rs = pst.executeQuery();
			PrintWriter out = response.getWriter();
			while(rs.next())
			{
				String name = rs.getString("AdminName");
				String pass = rs.getString("AdminPassWord");
				if(!(name.equals(adminName) && pass.equals(adminPass)))
				{
					Cookie ck = new Cookie("admin","srikanth");
					response.addCookie(ck);
					
					out.println("<script type =\"text/javascript\">");
					
					out.println("location='AdminHome.html';");
					out.println("</script>");
				}
			}
			
			out.print("<script type =\"text/javascript\">");
			out.println("alert('Password incorrect');");
			out.println("location='AdminLogin.html';");
			out.println("</script>");
		}
		catch (Exception e )
		{
			e.printStackTrace();
		}


	}

}




