package User;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class valid
 */
@WebServlet("/Valid")
public class Valid extends HttpServlet {
	private static final long serialVersionUID = 1L;



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement p = null;
		ResultSet rs = null;
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		try {
			String pass = request.getParameter("password");	
			String mailId = request.getParameter("email");
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root","1234");
			String sql = "select * from details";
			p = con.prepareStatement(sql);
			rs = p.executeQuery();
			out.println("<script type=\"text/javascript\">");
			while (rs.next()) {

				String name = rs.getString("uname");
				String checkmail = rs.getString("email");
				String checkPass = rs.getString("upass");
				String phone = rs.getString("umobile");
				if(mailId.equals(checkmail) && pass.equals(checkPass)) {
					request.setAttribute("Name",name);
					request.setAttribute("phone",phone);
					 
					RequestDispatcher rd = request.getRequestDispatcher("Welcome.jsp");
					rd.forward(request, response);
					return;
					 
				}
			}


			out.println("alert('Email or password incorrect');");
			out.println("location='Signin.jsp';");
			out.println("</script>");
			//			RequestDispatcher rd = request.getRequestDispatcher("signin.jsp");
			//            rd.forward(request, response);


		}
		catch(Exception e) {
			e.printStackTrace();
		}
		//		 finally
		//		{
		//			try {
		//				con.close();
		//			} catch (SQLException e) {
		//				// TODO Auto-generated catch block
		//				e.printStackTrace();
		//			}
		//		}


	}

}
