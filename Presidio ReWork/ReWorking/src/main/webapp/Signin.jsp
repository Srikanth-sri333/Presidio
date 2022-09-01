
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>

<body>


	<div class="top">
		<h1 style ="font-weight:bold;font-size:30px">Login</h1>
		<a href ="Home.jsp"><button class="return">Back</button></a>
	</div>
	<div class="header">
		<form action="Valid" method="post" class="form">
			<div class="inputgiven">
				<label for="email"><i class="input"></i></label> <input type="email"
					name="email" id="email" placeholder="abc@gmail.com" required /><br></br>
				<label for="pass"><i class="input"></i></label> <input
					type="password" name="password" id="password"
					placeholder="Password" required /><br></br>

			</div>
			<div>
				<button class="editable">Login</button>
				<a href="Usersignup.html"> Create a Account</a>
			</div>
		</form>

	</div>
</body>
</html>
<style>
* {
	margin: 0;
	padding: 0;
}

html {
	
}

.top {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 20px;
	background-color: rgb(240, 240, 240);
}

.return {
	height: 45px;
	width: 90px;
	color: white;
	background-color: dodgerblue;
	outline: none;
	border: none;
	border-radius: 6px;
	cursor: pointer;
	font-size: 20px;
}

form {
	margin-top: 70px;
	background-color: white;
	width: 350px;
	height: 200px;
	border-radius: 10px;
	margin-left: 100px;
}

.header {
	width: 100%;
	margin-left: 1px;
}

body {
	background-color: rgb(75, 144, 224);
	background-image: url("UserLogin1.jpg");
}

input {
	margin-left: 10px;
	margin-top: 10px;
	height: 40px;
	width: 300px;
	border-radius: 6px;
	font-size: 20px;
	padding-left: 10px;
	border: 1px solid blue;
	font-weight: bold;
	outline-color: black;
}

input:hover {
	border-color: skyblue;
	outline: none;
}

.editable {
	font-weight: bold;
	font-size: 20px;
	height: 40px;
	width: 150px;
	margin-left: 0px;
	border-radius: 6px;
	border-end-end-radius: 10px;
	margin-left: 10px;
	cursor: pointer;
}

a {
	text-decoration: none;
	font-size: 20px;
	margin-left: 2px;
	font-family: 'Times New Roman';
	color: black;
}

a:hover {
	color: blue;
}
</style>
