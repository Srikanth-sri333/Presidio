<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
 
<body>
<center>
<h1>Login </h1>
<fieldset>
<form action="valid" method="post">
         <div>
            <label for="email"><i class="input"></i></label> <input
        type="email" name="email" id="email" placeholder="abc@gmail.com" required /><br></br>
        </div>
        <div>
        <label for="pass"><i class="input"></i></label> <input
        type="password" name="password" id="password" placeholder="Password"  required/><br></br>
        </div>
       
        <button class = "editable">Login</button>
        <a href="user.jsp" >
         Create a Account
        </a>
       
</form>
</fieldset>

</body>
</html>
<style>
.editable{
        color: white;
        background-color: rgb(31, 31, 128);
        width: 60px;
        height: 20px;
        border: 1px solid black;
        cursor: pointer;
        transition : 0.15s;
        border-radius: 3px;
        margin-bottom:8px ;
    }
    .editable:hover{
        background-color: rgb(60, 60, 231);
        color: white;
        box-shadow: 2px 2px 2px   rgba(247, 243, 243, 0.4);
       
    }
    body{
        color: aqua;
        font-family: sans-serif;
        background-color: black;

    }
    input{
    width:200px;
    height:25px;
    border-radius:3px;
    }
    a{
    text-decoration:none;
    color:aqua;
  }
  fieldset{
  padding-top:50px;
  }
  h1{
  text-align:center;
  color:aqua;
  }
  
  