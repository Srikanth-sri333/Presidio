<%@ page language ="java" contentType ="text/html; charset = UTF-8" 
pageEncoding = "UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Home</title>
</head>
<body>
    <div class="header">
        Welcome ${Name}
        
    </div>
    <div class="mainBlock">
    <div>
        <a href="Bookingjsp.jsp"><button>New Booking</button></a>
    </div>
    <div> 
        <a href ="ViewStatusPage.jsp"><button>View Current Status</button></a>
    </div>
    <div>
        <a href="Signin.jsp"><button>Log out</button></a>
    </div>
</div>
</body>
</html>
<style>
    *{
        margin: 0;
        padding: 0;
    }
    .header{
        font-size: 30px;
        color: black;
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 20px;
        background-color: rgb(240,240,240);
    }
    .mainBlock{
        margin-top: 70px;
        margin-left: 100px;
         
         align-items: center;
        justify-content: center;
    }
    div{
        align-items: center;
        margin-bottom: 80px;
    }
    body{
        background-color: skyblue;
        background-image: url("car_service.png");
         background-repeat: no-repeat; 
         background-position:450px 	0px	;
    }
    button{

        width: 300px;
        height: 50px;
        font-size: 30px;
        border-radius: 10px;
        border-color: aquamarine;
    }
    button:hover{
        color: rgb(13, 49, 49);
        background-color: cornsilk;
        box-shadow: 5px 5px 10px rgba(42, 42, 194,0.8);

    }

</style>