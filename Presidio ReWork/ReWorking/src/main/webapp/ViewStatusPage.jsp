
<!-- <%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%> -->
<!DOCTYPE html>
<!-- <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> -->
<html>
<meta http-equiv="Content-Type" content="text/html;  charset = UTF-8">
<body>

	<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/usersrework" user="root"
		password="1234" />
	<div class="header">
		<p>${message}</p>
		<form action="ViewStatus" method="post">
			<input type="text" name="RegNo">
			<button class="btn1">Check</button>
		</form>
	</div>
	<table class="table">

		<tbody>

			<tr>
				<td name="TicketId" style="margin: top 20px;">TicketId</td>
				<td style="padding-left: 50px;">${TicketId}</td>
			</tr>
			<tr>
				<td name="CarModel" style="margin: top 10px;">CarModel</td>
				<td style="padding-left: 50px;">${CarModel}</td>
			</tr>
			<tr>
				<td name="RegNo">RegNo</td>
				<td style="padding-left: 50px;">${RegNo}</td>
			</tr>
			<tr>
				<td name="Location">Location</td>
				<td style="padding-left: 50px;">${Location}</td>
			</tr>
			<tr>
				<td name="BookedDate">Date</td>
				<td style="padding-left: 50px;">${Date}</td>
			</tr>
			<tr>
				<td name="Service">Service</td>
				<td style="padding-left: 50px;">${Service}</td>
			</tr>

			<td name="Status">Status</td>
			<td style="padding-left: 50px;">${status}</td>
			</tr>
		</tbody>


	</table>
	<a href="Welcome.jsp"><button class="btn2">Back</button></a>
</body>
</html>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 20px;
	background-color: black;
	border-radius: 6px;
}

body {
	background-color: #32312f;
	font-family: sans-serif;
	background-image: url("blueAndblack.jpg");
}

img {
	opacity: 0.1;
}

input {
	height: 40px;
	border-color: skyblue;
	outline: none;
	font-size: 20px;
}

.table-container {
	padding: 0 10%;
	margin: 40px auto 0;
}

label {
	width: 100px;
}

.table {
	display: inline-block;
	border-radius: 10px;
	background: transparent;
	font-weight: bold;
	cursor: pointer;
	background-color: rgba(255, 255, 255, 0.164);
	width: 500px;
	height: 670px;
	padding: 4px;
	box-shadow: -5px -5px 40px aqua;
	margin-top: 3%;
	margin-left: 34%;
	justify-content: space-between;
	border-spacing: 0 2em;
	display: flex;
	color: white;
	padding-left: 30px;
	border-color: black;
	outline: black;
	font-size: 30px;
}

.td {
	padding-right: 100px;
}

.table_header p {
	color: black;
}

.btn1 {
	padding: 10px 20px;
	color: white;
	background-color: dodgerblue;
	border-color: aqua;
	cursor: pointer;
}

.btn2 {
	padding: 10px 20px;
	color: white;
	background-color: dodgerblue;
	border-radius: 6px;
	border-color: aqua;
	float: right;
	margin-right: 20px;
	margin-top: -50px;
	cursor: pointer;
}

p {
	font-weight: bold;
	color: white;
	font-size: 30px;
}
</style>