<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<body>
	<div class="header">
		<p class="top">Thank You For Registering</p>
		<a href="Welcome.jsp"><button>Back</button></a>
	</div>
	<div class="content">
		<p>Our Team Members Will Contact You Soon</p>
		<br>
		<p>
			Please Note The Your TicketId <span> ${TicketId}</span>
		</p>

	</div>
	<div class="secondcontent">
		<p>Please Wait For Confirmation Your Details is Considered for
			Verification</p>
		<br>
		<p>You Can Check It in View Status Page With Your TicketId</p>
	</div>
</body>
</html>

<style>

* {
	margin: 0;
	padding: 0;
}

.header {
	justify-content: space-between;
	display: flex;
	padding: 20px;
	color: black;
	align-items: center;
	background-color: rgb(240, 240, 240);
}

.content {
	width: 350px;
	height: 100px;
	color: white;
	margin-top: 40px;
	margin-left: 100px;
	font-size: 40px;
}

span {
	color: darkred;
}

.secondcontent {
	float: right;
	color: white;
	font-size: 40px;
	width: 300px;
	margin-right: 100px;
	margin-top: -60px;
}

button {
	padding: 10px 20px;
	color: white;
	font-size: 20px;
	cursor: pointer;
	background-color: black;
}

.top {
	font-weight: bold;
	font-style: italic;
	font-size: 30px;
}

p {
	margin-bottom: 10px;
}

body {
	background-image: url("blackImage.jpg");
}
</style>