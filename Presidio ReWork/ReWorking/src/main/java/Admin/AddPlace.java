package Admin;

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
 * Servlet implementation class AddPlace
 */
@WebServlet("/AddPlace")
public class AddPlace extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con = null;
		System.out.println("addplace");
		ResultSet rs = null;
		PreparedStatement pst = null;
		response.setContentType("text/html");
		String Addedplace = request.getParameter("place");
		 
		String serviceType = request.getParameter("service");
		System.out.println("service"+serviceType);
		PrintWriter out = response.getWriter();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/usersrework","root","1234");
			PreparedStatement pt = con.prepareStatement("select *from places");
			out.print("<script type = \"text/javascript\">");
			rs = pt.executeQuery(); int flag = 0;
			while(rs.next())
			{
				String DBplace = rs.getString("place");
				String DBwash = rs.getString("wash");
				String DBbasic = rs.getString("basicService");
				 
				if(DBplace.equals(Addedplace) && DBwash.equals("true") && DBbasic.equals("true") )  

				{

					out.print("alert('Place Already Exist');");
					out.print("location='AddingService.html';");
					flag = 1;
					 
				}
				else if(DBplace.equals(Addedplace) && ( DBwash.equals("false") && serviceType.equals("Washing")))
				{
					String sql = "update places set wash = 'true' where place = "+"\""+Addedplace+"\""; flag   =1;
					pst = con.prepareStatement(sql);
					 pst.executeUpdate();
				}
				else if(DBplace.equals(Addedplace) && ( DBbasic.equals("false") && serviceType.equals("Car Service")))
				{
					String sql = "update places set basicService = 'true' where place = "+"\""+Addedplace+"\""; flag   =1;
					pst = con.prepareStatement(sql);
					 pst.executeUpdate();

				}

			}
			out.print("</script>");
			if (flag==1)
			{
				out.print("<script type = \"text/javascript\">");
				out.print("alert('Successfully Updated');");
				out.print("location='AddingService.html';");
				out.print("</script>");
				return;
			}
			else {
			pst = con.prepareStatement("insert into places(place,wash,basicService) values(?,?,?)");
			pst.setString(1,Addedplace);
			if (serviceType.equals("Washing")) {
				
				pst.setString(3, "false");
			pst.setString(2, "true");
			}
			if(serviceType.equals("Car Service")) {
				pst.setString(3, "true");
				pst.setString(2, "false");
			}
			
			if(serviceType.equals("Include Both"))
			{
				pst.setString(2, "true");
				pst.setString(3, "true");
			}
				
			pst.executeUpdate();
			out.print("<script type = \"text/javascript\">");
			out.print("alert('Successfully Updated');");
			out.print("location='AddingService.html';");
			out.print("</script>");
			}
		}

		catch (Exception e){
			e.printStackTrace();
		}
	}

}
