<%@ page language="java" contentType="text/html;UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 
<body>
<div>
 	<p id="t" name="ticket"> </p> 
		 <script > 
		 	var ticket = prompt("Please Enter Your TicketId ");
		 	/*  $.ajax({
		 	    url: 'viewStatus',
		 	    data: {
		 	        TicketId: ticket
		 	    },
		 	    type: 'POST'
		 	});​   */
		 	document.getElementById("t").innerHTML=ticket;
		 </script>
	 


</div>
</body>
</html>