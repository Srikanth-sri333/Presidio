

package User;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//Date date1=new SimpleDateFormat("dd/MM/yyyy").parse(sDate1);  
		String uname = request.getParameter("name");
		String upass = request.getParameter("password");
		String email = request.getParameter("email");
		String umobile = request.getParameter("contact");
		PrintWriter out  = response.getWriter();
		Connection con = null;
		try {

			Class.forName("com.mysql.jdbc.Driver");

			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root","1234");
			PreparedStatement pt = con.prepareStatement("select *from details");
			ResultSet rs = pt.executeQuery();
			while(rs.next())
			{
				String getEmail = rs.getString("email");

				if(getEmail.equals(email) )
				{
					out.println("<script type=\"text/javascript\">");
					out.println("alert('You Are Already a User');");
					out.println("location='Signin.jsp';");
					out.println("</script>");
				}
			}
			PreparedStatement pst = con.prepareStatement("insert into details(uname,upass,email,umobile) values(?, ?, ?, ?)");
			pst.setString(1,uname);
			pst.setString(2,upass);
			pst.setString(3,email);
			pst.setString(4,umobile);
			int rowCount = pst.executeUpdate();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Successfully Registered');");
			out.println("location='Signin.jsp';");
			out.println("</script>");

		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}

	}

}