<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=div, initial-scale=1.0">
    <title>Car Spa</title>
</head>
<body>
    <div class="header">
        <div class="welcome">
            <p>Welcome To Car Spa</p>
        </div>
    </div>
     <div class ="form">
        <div >
            <a href ="Signin.jsp" style ="text-decoration: none;"><button class="btn1">User Portal</button></a>
        </div>
        <div>
            <a href ="AdminLogin.html" style ="text-decoration: none;"><button class="btn2">Admin Portal</button></a>
        </div>
     </div>
</body>
</html>
<style>
    *{
        margin: 0;
        padding: 0;
    }
    p{
        font-size: 50px;
        font-weight:bold;
    }
    body{
        justify-content: center;
        display: flex;
        background-color: aquamarine;
        background-image: url("UserLogin.jpg");
    }
    .header{
        width: 120%;
        display: flex;
        align-items: center;
        justify-content: space-between;
        background-color: skyblue;
        height: 100px;
    }
    .form{
    width: 250px;
	height: 300px;
	position: absolute;
	top: 190px;
	left: 500px;
	border-radius: 10px;
	text-align: center;
	padding: 25px;
	justify-content:center;
    background-color: transparent;
    
    }
    .btn1{
        margin-top: 30px;
        height: 100px;
        width: 440px;
        background-color: transparent;
        border-color:skyblue;
        border-radius: 6px;
        font-size: 30px;
        cursor: pointer;
        margin-bottom: 30px;

    }
    .btn2{
        margin-top: 80px;
        height: 100px;
        width: 440px;
        background-color: transparent;
        border-color:skyblue;
        border-radius: 6px;
        font-size: 30px;
        
        cursor: pointer;
    }
    button:hover{
    	box-shadow: 5px 5px 10px blue;
    	background-color:skyblue;
    	font-weight:bold;
    
    }
     
    
</style>