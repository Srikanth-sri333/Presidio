<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<meta http-equiv="Content-Type" content="text/html;  charset = UTF-8">
<header style="margin-top: 20px; margin-left: 30px;"> </header>
<body>

	<div class="header">
		<h2>
			<i>Please Book Your Choice</i>
		</h2>
		<a href ="Welcome.jsp" style ="text-decoration: none;">
		<button class="btn">Back</button></a>
	</div>
	<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/usersrework" user="root"
		password="1234" />
	<sql:query var="rs" dataSource="${db}"> select *from places</sql:query>
 
	<form action="bookingDB" method="post" style="text-align: center"
		class="book">
		<table>
			<tr>
				<td style="padding-left: 150px">Car Model</td>
				<td><input type="text" placeholder="Model" name="Model"
					style="font-size: 20px;" required></td>
				<br></br>
			</tr>
			<tr>
				<td style="padding-left: 150px">vehicle Number</td>
				<td><input type="text" placeholder="vehicle Number"
					name="PlateNo" style="font-size: 20px;" required></td>
				<br></br>
			</tr>
			<tr>
				<td style="padding-left: 150px">Email Id</td>
				<td><input type="email" placeholder="abc@gmail.com"
					name="email" style="font-size: 20px;" required></td>
			</tr>
			<tr>
				<td style="padding-left: 150px;">Location</td>

				<td ><select style="margin-left: -95px;font-size: 20px;width:200px;height:30px;border-radius: 10px;border-color: skyblue;padding-left: 10px;"
					name="place" id="cars" required >
						<c:forEach items="${rs.rows}" var="location">
							<option value="${location.place}" ><b>${location.place}</b></option>

						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td style="padding-left: 150px">Date</td>
				<td style="height: 10px; width: 10px; background-color: lightrose;  "><input
					type="date" name="date" required style="font-size: 20px;margin-left: 8px;"></td>
			</tr>
			<tr>
				<td style="padding-left: 150px">Type Of Service</td>
				<td><select name="option" id="services"  name = "option"required
					style="font-size: 15px; cursor: pointer; font-size: 20px; height: 30px; width: 200px;border-radius: 10px;border-color: skyblue;margin-left: -90px;">
						<option value="Washing" name ="service"> Car Washing </option>
						<option value="Basic Services"name ="service" >Basic Services</option>
						<option value ="Include Both" name ="service">Include Both</option>
				</select></td>
			</tr>
			<tr>
				<td style="padding-left: 150px">Confrim</td>
				<td style=""><button
						style="font-size: 15px; cursor: pointer; width: 200px; height: 40px;margin-left:-80px;border-radius:10px">
						<b>Register</b>
					</button></td>
			</tr>

		</table>
	</form>
</body>
</html>

<style>
*{
	margin: 0;
	padding: 0;
	 
}

form {
	height: 500px;
	justify-content: center;
	width: 650px;
	display: inline-flex;
	background-color: rgb(15, 74, 122);
	margin-left: 150px;
	margin-top: 50px;
	border-radius: 10px;
}

form:hover {
	box-shadow: 5px 5px 5px rgb(15, 142, 201);
}

body {
	background-color: skyblue;
	font-family: sans-serif;
}

.table-container {
	padding: 0 10%;
	margin: 40px auto 0;
}
.table{
	width:100%;
}
label {
	width: 100px;
}

td {
	padding-right: 100px;
	padding-left: 30px;
	color: white;
	font-size: 20px;
	margin-left: 20px;
}

input {
	height: 30px;
	width: 300px;
	border-radius: 10px;
	font-size: 20px;
	border-color: skyblue;
    
}
.option{
height: 30px;
	width: 300px;
	border-radius: 10px;
	font-size: 20px;
	border-color: skyblue;


}

::placeholder {
	font-size: 20px;
	margin-left: 10px;
	display: flex;
	color: black;
	 padding-left: 10px;
}
.btn{
		height:45px;
		width:90px;
        color: white;
        background-color: dodgerblue;
        outline: none;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        font-size:20px;



}

.header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 20px;
	margin-top:20px;
	background-color: rgb(240, 240, 240);
}
</style>