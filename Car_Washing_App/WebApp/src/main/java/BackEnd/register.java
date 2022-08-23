 

package BackEnd;

import java.io.IOException;
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
 * Servlet implementation class register
 */
@WebServlet("/register")
public class register extends HttpServlet {
private static final long serialVersionUID = 1L;
       
     

protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
// TODO Auto-generated method stub

String uname = request.getParameter("name");
String upass = request.getParameter("password");
String email = request.getParameter("email");
String umobile = request.getParameter("contact");

Connection con = null;
try {
	
		Class.forName("com.mysql.jdbc.Driver");

        con =DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root","1234");
       PreparedStatement pst = con.prepareStatement("insert into details(uname,upass,email,umobile) values(?, ?, ?, ?)");
       pst.setString(1,uname);
       pst.setString(2,upass);
       pst.setString(3,email);
       pst.setString(4,umobile);
       int rowCount = pst.executeUpdate();
       if(rowCount>0) {
       
        request.setAttribute("status", "success");
       }
       else request.setAttribute("status", "failed");
       RequestDispatcher dispatcher  = request.getRequestDispatcher("signin.jsp");
        
       dispatcher.forward(request, response);
}
catch(Exception e) {
System.out.println(e.getMessage());
}

}

}