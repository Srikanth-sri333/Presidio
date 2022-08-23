<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>


<body>
 <h1>Welcome... ${display}</h1><br></br>
 <fieldset>
<div id ="main_box">
	<div>
	  <a href = "bookingjsp.jsp">
		<button class = "bt1">New Booking</button>	</a> <br></br>
	 </div>
	 <div>
	  
	 	 <a href ="statusMatching.jsp">
	 		<button>View Status</button>
	 	  <br></br>
	  </a>
	 </div>
	 <div>
	 	<a href = "signin.jsp">Logout</a>
	 
	 </div> <br></br>
	
</div>
</fieldset>
</body>
</html>
<style>
fieldset{
width:600px;
 float:left;
 color:#818181;
  
 border: 2px solid #ccc;
 padding:10px;
 font-family: Georgia;
 font-size: 14px;
 -moz-box-shadow: 0 1px 3px rgba(0,0,0,0.5);
 -webkit-box-shadow: 0 1px 3px rgba(0,0,0,0.5);
 -moz-border-radius: 15px;
 -webkit-border-radius: 15px;
}
a{
	text-decoration:none;
}
.main_box{
    height:100vh;
    font-family: sans-serif;
    display: flex;
    align-items: center;
    cursor: pointer;
    justify-content: center;
   /* background-image: url("bg_img.jpg");*/
    background-repeat: no-repeat;
   background:linear-gradient(to right,rgb(201, 57, 57),rgb(255, 11, 185)) ; 
    overflow:hidden;
}
.bt1:hover{
	cursor:pointer;
}
 h1{
 text-align:center;
 }
 body{
    height:100vh;
    font-family: sans-serif;
    display: flex;
    align-items: center;
    cursor: pointer;
    justify-content: center;
   /* background-image: url("bg_img.jpg");*/
    background-repeat: no-repeat;
   background:linear-gradient(to right,rgb(201, 57, 57),rgb(255, 11, 185)) ; 
    overflow:hidden;
}
 

</style>