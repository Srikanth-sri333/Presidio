<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset = UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="style.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" />
<title>Search Results</title>
</head>
<body>
	<%-- <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/usersrework" user="root"	
		password="1234" />
	<sql:query var="rs" dataSource="${db}"> select *from bookingdetails where CurrentStatus = 'pending' and BookedDate = <%String.valueOf(request.getAttribute("date")); %>  ; </sql:query>
	
 --%>
	<%
	Connection con = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
	String sql = null;
	String place = null;
	String date = null;
	String s = "pending";
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/usersrework", "root", "1234");
		  place = request.getParameter("place");
		  date = request.getParameter("date");
		  System.out.println("fweafawfewfdaaaaaaaaaaaaa");
		  
		  if(place == "" && date == "") System.out.print("succes");
		//Date date = new SimpleDateFormat("dd/MM/yyyy").parse(date1);
		if (date == "")
			sql = "select *from bookingDetails where CurrentStatus = 'pending' and Location = "+"\""+ place + "\"";
		else if (place == "")
			sql = "select *from bookingDetails where CurrentStatus = 'pending' and ServiceDate = "+"\"" + date + "\"";

		 
		  else {
			sql = "select *from bookingDetails where  CurrentStatus = 'pending' and    Location = "+"\"" + place
			+ "\" and ServiceDate = "+"\"" + date + "\"";
		}
		pst = con.prepareStatement(sql);
		rs = pst.executeQuery();
		int flag = 0;
	%>
	<div class="table">
		<div class="table_header">
			<p>
				<b style="font-size: 20px;font-weight:bold;"> <%
				if(place== "" && date =="") out.print("No Search Results Found");
				if(!(place==""))
				{out.print(" Booked At " + place) ; flag =1;}%> <% if(!(date=="")){out.print("On "+date);flag =1;} %>
				</b>
		<%if (flag ==1) %>
			</p>
			<div class="topsection">
				<form action="Filter" method="post">
					<input type="search" placeholder="Place" name="place"> <input
						type="date" placeholder="Date" name="date">

					<button class="Home" style="margin-bottom: 5px;">Filter</button>
				</form>
				<a href="pendingData.jsp" style="text-decoration: none;">
					<button class="Home"
						style="margin-left: 390px; align-items: center;">Back</button>
				</a>
			</div>
		</div>
		<div class="table_section">
			<table>
				<thead>
					<tr>
						<th>S No</th>
						<th>Reg No</th>
						<th>Car Model</th>
						<th>Email ID</th>
						<th>Location</th>
						<th>Contact No</th>
						<th>Booked Date</th>
						<th>Service Date</th>
						<th>Service</th>
						<th style="padding-right: 40px;">Ticket Id</th>
						<th style="padding-right: 30px;">Action</th>

					</tr>
				</thead>
				<%
				int rollno = 1;
				while (rs.next()) {
				%>

				<tbody>
					<tr>

						<td>
							<%
							 out.print(rollno++);
							%>
						</td>
						<td>
							<%
							out.print(rs.getString("RegNo"));
							%>
						</td>
						<td>
							<%
							out.print(rs.getString("CarModel"));
							%>
						</td>

						<td>
							<%
							out.print(rs.getString("EmailId"));
							%>
						</td>
						<td>
							<%
							out.print(rs.getString("Location"));
							%>
						</td>
						<td>
							<%
							out.print(rs.getString("PhoneNo"));
							%>
						</td>
						<td>
							<%
							out.print(rs.getString("BookedDate"));
							%>
						</td>
						<td>
							<%
							out.print(rs.getString("ServiceDate"));
							%>
						</td>
						<td>
							<%
							out.print(rs.getString("Service"));
							%>
						</td>

						<td>
							<%
							out.print(rs.getString("TicketId"));
							%>
						</td>
						<td style="padding-left: 0%; padding-right: 40px">

							<button>
								<a href="FinalAccept.html" style="text-decoration: none;"> <b>Accept</b>
								</a>

							</button>
							<button>
								<a href="FinalReject.html" style="text-decoration: none;"> <b>Reject</b>
								</a>
							</button> </a>
						</td>

					</tr>
				</tbody>
				<%
				}
				%>
			</table>
		</div>
	</div>

	<%
	} catch (Exception e) {
	e.printStackTrace();
	}
	%>


	<%-- <div class="table">
		<div class="table_header">
			<p>
				<b style="font-size: 20px;">BOOKED At ${place} On ${date} </b>
			</p>
			<div class="topsection">
				<form action="AdminFilter" method="post">
					<input type="search" placeholder="Place" name="place"> <input
						type="date" placeholder="Date" name="date">

					<button class="Home" style="margin-bottom: 5px;">Filter</button>
				</form>
				<button class="Home"
					style="margin-left: 390px; align-items: center;">Home</button>
			</div>
		</div>
		<div class="table_section">
			<table>
				<thead>
					<tr>
						<th>S No</th>
						<th>Reg No</th>
						<th>Car Model</th>
						<th>Email ID</th>
						<th>Location</th>
						<th>Contact No</th>
						<th>Booked Date</th>
						<th>Service Date</th>
						<th>Service</th>
						<th style="padding-right: 40px;">Ticket Id</th>
						<th style="padding-right: 30px;">Action</th>

					</tr>
				</thead>
				<c:forEach items="${rs.rows}" var="display">
					<tbody>
						<tr>

							<td>${display.Sno}</td>
							<td>${display.RegNo}</td>
							<td>${display.CarModel}</td>

							<td>${display.EmailId}</td>
							<td>${display.Location}</td>
							<td>${display.PhoneNo}</td>
							<td>${display.BookedDate}</td>
							<td>${display.ServiceDate}</td>
							<td>${display.Service}</td>

							<td>${display.TicketId}</td>
							<td style="padding-left: 0%; padding-right: 40px">

								<button>
									<a href="FinalAccept.html" style="text-decoration: none;">
										<b>Accept</b>
									</a>

								</button>
								<button>
									<a href="FinalReject.html" style="text-decoration: none;">
										<b>Reject</b>
									</a>
								</button> </a>
							</td>

						</tr>
					</tbody>
				</c:forEach>
			</table>
		</div>
	</div>
 --%>
</body>
</html>

