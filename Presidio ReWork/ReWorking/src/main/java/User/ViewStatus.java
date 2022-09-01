package User;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class viewStatus
 */
@WebServlet("/ViewStatus")
public class ViewStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String nums = request.getParameter("RegNo");

		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		out.println("<htlm>");
		out.println("<body>");
 
		Connection con = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");

			con =DriverManager.getConnection("jdbc:mysql://localhost:3306/usersrework","root","1234");
			Statement st = con.createStatement();
			ResultSet rts = st.executeQuery("select *from bookingDetails");
			out.print("<script type = \"text/javascript\">");
			String message = "";
			while(rts.next()) {
				String check_num = String.valueOf(rts.getString("RegNo"));


				if(check_num.equals(nums)) {
					//                                       setting attributes to the request and access in ViewStatusPage.jsp

					String result1 = rts.getString("CurrentStatus");																		

					request.setAttribute("RegNo", rts.getString("RegNo"));
					request.setAttribute("TicketId",rts.getString("TicketId"));
					request.setAttribute("CarModel", rts.getString("CarModel"));
					request.setAttribute("Location", rts.getString("Location"));
					request.setAttribute("Date", rts.getString("BookedDate"));
					request.setAttribute("Service", rts.getString("Service"));
					//																finding the status
					
					if (result1.equals("pending")) {

						request.setAttribute("status","Pending");
						message = "Please Wait Your Status is Under Verification";
					}
					else if (result1.equals("Accept")) {
						request.setAttribute("status","Accepted");
						message ="Congratulations Your Booking is Confirmed";
					}
					else {
						request.setAttribute("status", "Rejected");
						message = "Sorry , Better Luck Next Time";
					}
					request.setAttribute("TicketNo",nums);
					request.setAttribute("message",message);
					RequestDispatcher rd = request.getRequestDispatcher("ViewStatusPage.jsp");
					rd.forward(request, response);
					return;
 
				}
			}
			message ="Please Enter a Valid Registration Number";
			request.setAttribute("message", message);
			out.println("alert('Invalid Registration Number');");
			out.println("location='ViewStatusPage.jsp';");
			out.println("</script>");
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
