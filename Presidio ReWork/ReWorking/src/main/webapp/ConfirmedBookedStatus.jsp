<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="style.css"/>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" />
<title>View Booked Details</title>
</head>

<body>
	<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/usersrework" user="root"
		password="1234" />
	<sql:query var="rs" dataSource="${db}"> select *from bookingdetails where CurrentStatus = 'Accept'; </sql:query>
	<div class="table">
		<div class="table_header">
			<p>
				<b style="font-size: 20px;">Confirmed Booked Status </b>
			</p>
			<div class="topsection">
				<form action="Filter" method="post">
					<input type="search" placeholder="Place" name="place"> <input
						type="date" placeholder="Date" name="date">

					<button class="Home" style="margin-bottom: 5px;">Filter</button>
				</form>
				<a href = "AdminHome.html" style = "text-decoration: none;">
				<button class="Home"
					style="margin-left: 390px; align-items: center;">Back</button> </a>
			</div>
		</div>
		<%int number =1; %>
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
						<th>Ticket Id</th>
						 

					</tr>
				</thead>
				<c:forEach items="${rs.rows}" var="display">
					<tbody>
						<tr>
							 
								<td><% out.print(number++); %></td>
								<td>${display.RegNo}</td>
								<td>${display.CarModel}</td>
								
								<td>${display.EmailId}</td>
								<td>${display.Location}</td>
								<td>${display.PhoneNo}</td>
								<td>${display.BookedDate}</td>
								<td>${display.ServiceDate}</td>
								<td>${display.Service}</td>
								
								<td>${display.TicketId}</td>
								 
						 
						</tr>
					</tbody>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>

