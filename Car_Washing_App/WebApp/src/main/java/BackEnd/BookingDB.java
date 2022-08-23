package BackEnd;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
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
@WebServlet("/BookingDB")
public class BookingDB extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 @Override
	    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	    	// TODO Auto-generated method stub
	    	
	    	//insert aa=new insert(a,b);
	 }
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con = null;
        PreparedStatement p = null;
         
        PrintWriter pw=response.getWriter();
    	response.setContentType("text/html");
 
        String location = request.getParameter("place");
        String umobile = request.getParameter("number");
        String bookdate = request.getParameter("date");
        ArrayList<Integer> nums = new ArrayList<>();
        Random ran = new Random();
        
        try {
        	Class.forName("com.mysql.jdbc.Driver");

            con =DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root","1234");
            Statement stt = con.createStatement();
            ResultSet rts = stt.executeQuery("select *from bookingdetails");
            int count = 0,x=0;
            while(rts.next()) {
         	   String cur = rts.getString("bookingdate");
         	   if (bookdate.equals(cur)) count++;
            }
            System.out.println(count);
         
            if(count<5)
            {
            x = ran.nextInt(10000);
           PreparedStatement pst = con.prepareStatement("insert into bookingdetails(umobile,bookingdate,place,bookId) values(?, ?,?,?)");
           pst.setString(1,umobile);
           pst.setString(2,bookdate);
           pst.setString(3,location);
           pst.setInt(4,x);
           int rowCount = pst.executeUpdate();
           String s = String.valueOf(x);
           
           request.setAttribute("TicketId",s);
           RequestDispatcher rd = request.getRequestDispatcher("success.jsp");
           rd.forward(request, response);
           }
            else {
            	System.out.println(90);
            	response.sendRedirect("bookingjsp.jsp");
            }
 
        }
        catch(Exception e) {
        	e.printStackTrace();
        }
	}

}
