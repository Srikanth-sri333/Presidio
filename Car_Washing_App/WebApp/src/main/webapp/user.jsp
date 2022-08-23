<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<!DOCTYPE html>
 
<html>
<body>
<input type = "hidden", id = "status" value="<%= request.getAttribute("status") %>">
    <h1>Sign up ....</h1>
    <form action="register" method="post">
        <div>
        <label for="name"><i class="input"></i></label> <input
        type="text" name="name" id="name" placeholder="Your Name"required /><br></br>
        </div>
        <div>
        <label for="pass"><i class="input"></i></label> <input
        type="password" name="password" id="password" placeholder="Password"  required/><br></br>
        </div>
        <div>
            <label for="email"><i class="input"></i></label> <input
        type="email" name="email" id="email" placeholder="abc@gmail.com" required /><br></br>
        </div>
        <div>
<label for="contact"><i class="input"></i></label>
<input type="text" name="contact" id="contact" placeholder="Contact no" /> <br></br>

</div>
        <button class = "btn1" onclick ="fn()">Create</button><br></br>
         
       
    </form>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="alert/dist/sweetalert.css">
    </body>
</html>
<style>
   
      body{
        color: aqua;
        font-family: sans-serif;
        background-color: black;

    }
    signin{
    te
    }
    input{
        border-radius: 5px;
    }
    input:hover{
        cursor: pointer;
    }
    .btn1{
        color: white;
        background-color: rgb(31, 31, 128);
        width: 60px;
        height: 20px;
        border: 1px solid black;
        cursor: pointer;
        transition : 0.15s;
        border-radius: 3px;
    }
    .btn1:hover{
        background-color: rgb(60, 60, 231);
        color: white;
        box-shadow: 5px 5px 10px rgba(78, 18, 18,0.4);
       
    }
</style>
 
