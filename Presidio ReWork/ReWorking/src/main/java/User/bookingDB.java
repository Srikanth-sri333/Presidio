package User;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BookingDB
 */
@WebServlet("/bookingDB")
public class bookingDB extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con = null;
		Connection con1 = null;


		response.setContentType("text/html");
		String RegNo =  request.getParameter("PlateNo");
		String CarModel = request.getParameter("Model");
		String EmailId = request.getParameter("email");

		String location = request.getParameter("place");
		String service	= request.getParameter("option");

		String bookdate = request.getParameter("date");

		Random ran = new Random();
		long millis=System.currentTimeMillis();  
		java.sql.Date date=new java.sql.Date(millis);  
		String phoneNo = null;
		PrintWriter out = response.getWriter();
		try {
			Class.forName("com.mysql.jdbc.Driver");

			con =DriverManager.getConnection("jdbc:mysql://localhost:3306/usersrework","root","1234");
			Statement stt = con.createStatement();
			ResultSet rts = stt.executeQuery("select *from bookingDetails");
			con1 =DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root","1234");
			Statement stt1  = con1.createStatement();
			String sql = "select *from details ";
			ResultSet rts1 = stt1.executeQuery(sql);

			int mailDulicate = 0;
			while(rts1.next())
			{
				if(EmailId.equals(rts1.getString("email"))) 
				{
					mailDulicate =1;
					phoneNo = rts1.getString("umobile");

				}
			}
			if (mailDulicate==0) {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('The Mail is Not Yet Registered !!!');");
				out.println("location='Bookingjsp.jsp';");
				out.println("</script>");
			}

			String sql1 = "select *from places";
			Statement stt11 = con.createStatement();
			ResultSet rts2 = stt11.executeQuery(sql1);
			int flag = 0;
			//while(rts2.next()==false) System.out.println("rts2 not executed");
			while(rts2.next())
			{	String place = rts2.getString("place");
			if(place.equals(location)) {
				String wash = rts2.getString("wash");

				String basicService = rts2.getString("basicService");

				if(service.equals("Washing") && wash.equals("false"))
				{
					flag =1;
				}
				if(service.equals("Basic Services") && basicService.equals("false")) flag =1;
			}

			}
			System.out.println(flag+"flag value");
			if(flag ==1)
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Sorry, The Service is Not Available Now. Please Choose Another Service');");
				out.println("location='Bookingjsp.jsp';");
				out.println("</script>");
				//								RequestDispatcher rd = request.getRequestDispatcher("Bookingjsp.jsp");
				//								rd.forward(request, response);
				//								return;
			}
			else {
				int count = 0,x=0;
				while(rts.next()) {
					String cur = rts.getString("BookedDate");
					String loc = rts.getString("Location");
					if(RegNo.equals(rts.getString("RegNo")))
					{
						out.println("<script type=\"text/javascript\">");
						out.println("alert('Sorry, ReBooking of Vechile is Not Allowed');");
						out.println("location='Bookingjsp.jsp';");
						out.println("</script>");

					}
					if (bookdate.equals(cur) && loc.equals(location)) count++;
				}


				if(count<5)                             // if the location date is less than 5 
				{ 
					x = ran.nextInt(10000,90000);
					PreparedStatement pst = con.prepareStatement("insert into bookingDetails(RegNo,CarModel,EmailId,PhoneNo,Location,BookedDate,ServiceDate,Service,TicketId,CurrentStatus) values(?,?,?,?,?,?,?,?,?,?)");
					pst.setString(1,RegNo);
					pst.setString(2,CarModel);
					pst.setString(3, EmailId);
					pst.setString(4, phoneNo);
					pst.setString(5,location);
					pst.setString(6,String.valueOf(date));
					pst.setString(7,bookdate );
					pst.setString(8, service);
					pst.setInt(9, x);
					pst.setString(10,"pending");
					pst.executeUpdate();

					String s = String.valueOf(x);

					request.setAttribute("TicketId",s);
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Thank You for Registering ');");
					out.println("location='Bookingjsp.jsp';");
					out.println("</script>");
					RequestDispatcher rd = request.getRequestDispatcher("Success.jsp");
					rd.forward(request, response);
					return;
				}
				else {
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Allowed Booking Reached Maximum Count..');");
					out.println("location='Bookingjsp.jsp';");
					out.println("</script>");

				}

			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
