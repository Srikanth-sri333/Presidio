<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
 
<body>
<center>
 <form action="BookingDB" method = "post" style ="text-align:center" class = "book">
 <h2>Booking Page</h2>
 	<div>
            <label for="email"><i class="input"></i>Car Model  </label> <input
        type="text" name="carmodel"  required /><br></br>
        </div>
 	 <div>
 	 	<label class = "car_details">Car Number</label><input type = "text"/><br></br>
 	 </div>
 	 <div>
 	 	<label class = "car_details">Personal Number</label><input type = "text" name = "number"/><br></br>
 	 </div>
 	 
	 <label for="cars">Choose a Location</label>
     <select name = "place" id = "cars">
     <option value="karur">Karur</option>
     <option value="chennai">Chennai</option>
     <option value="namakkal">Namakkal</option>
     </select><br></br>
     <label >Choose A Date:<input type="date" name = "date"></label><br></br>
     <button>Submit</button>
   </form>
</body>
</html>
 <style>
 h2{
 text-align:center;
 }
label{
		width:100px;
		display:inline-block;
}
book{
display:inline-block;	
border-radius:10px;
background:black;
color:white;
width:290px;
padding:4px;

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