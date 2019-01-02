<%-- 
    Document   : register
    Created on : 16 Dec, 2018, 1:03:48 PM
    Author     : win 7
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

	<!------TITLE----------->
	<title>Registration</title>

	<!----------INCLUSION OF FONT AWESOME LIBRARY---------------->
	<script src="https://use.fontawesome.com/7d44bc7623.js"></script>
	<link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet'>

	<!---------- INCLUSION OF VIEWPORT --------------->
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	
	<!------------BOOTSTRAP  FILE---------->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

	<!-----------CSS FILE---------->
	<link rel="stylesheet" type="text/css" href="css/normalize.css">
	<link rel="stylesheet" type="text/css" href="css/register.css">
	<link rel="stylesheet" type="text/css" href="css/common.css">
	
	
	
</head>
<body>
	<!----- MAIN CONTAINER OF BOOTSTRAP ------------------>
	<div id="container-fluid">
		
				<div class="row header">
            <div class="col-md-4 col-sm-4 logo">
                	<img src="images/logo.jpg" alt="Company Logo">
            </div>
            <div class="col-md-8 col-sm-8 heading">
				<h1>Smart Route Planner Using VRP</h1>      
				
			</div>
		</div>			

		
		
		
		
		
				
		<!------ MENU ROW --------------->
		<div class="row menu">
		
				<!------ MENU CODE ---------->
				<div class="col-md-12 navigation">
					<ul>
					<!--<li><a href="admin_loginpage.html">Admin</a></li>-->
						
						<li><a href="home.jsp">Home</a></li>
						<li><a href="login.jsp">Login</a></li>
						<li><a href="#">Register</a></li>
						<li><a href="aboutus.jsp">About Us</a></li>
						<li><a href="contact_us.jsp">Contact Us</a></li>
					</ul>
				</div>
		</div> <!-------- END OF MENU ROW---------->


	
	
	
	
	
	
	<div class="row registration">
		<div class="col-md-12 student-head">
			<p>Registration Form</p>
	
		</div>
	
	<form action="Register" method="post">
	
	<div class="col-md-12 register-form">
	
	
	<table align="center">
	<tbody>
	
	<tr>	
	<td class="form_head">Name</td>
	<td><input type="text" name="name" id="name" placeholder="Name">
	<p id="nerror"></p></td>
			</tr>
	
	



	<tr>	
	<td class="form_head">Email</td>
	<td><input type="email" name="email" id="email" placeholder="Email Id">
	<p class="eerror"></p>
	</td>
			</tr>

	<tr>	
	<td class="form_head">Mobile Number</td>
	<td><input type="number" name="mobile" id="mobile" placeholder="Mobile "><p id="merror"></p></td>
			</tr>
	
	
	
	<tr>
	<td class="form_head">Password</td>

		<td>	<input type="password" name="pswd" id="pswd" placeholder="Password">
			<p id="pwderror"></p></td>
 	
	
	</tr>
	<tr>

	<tr>
	<!--<td class="form_head">Confirm Password</td>

		<td>	<input type="password" name="cnfrm_pswd" id="cnfrm_pswd" placeholder="Password">
			<p id="cnfrmpswderror"></p></td>
 	
	
	</tr>-->
	<tr>

	
		<td> 
			<input type="submit" value="Register" onclick="return validate()"></td>
		
		
		
	</tr>
	<tr>
		
		
	</tbody>
	</table>
	
	</form>
	</div>
	
	<script>
function validate(){
			var name = document.getElementById("name").value;
					//var  email=document.getElementById("stu_email").value;

					var  mobile=document.getElementById("mobile").value;
		var  pswd=document.getElementById("pswd").value;
		//var cnfrm_pswd=document.getElementById("cnfrm_pswd").value;
	
	var regularExpression = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,16}$/;
	 var flag=true;

	 var letters = /^[A-Za-z]+$/;
  
	 var re = /^(?=.*\d)(?=.*[!@#$%^&*])(?=.*[a-z])(?=.*[A-Z]).{8,}$/;
    
	 
	 
	 if( name.toString().length === 0 &&  !(name.toString().match(letters)) )
	 {
			
		document.getElementById("nerror").innerHTML="Enter Correct Name";
			//alert("Confirmation fields do not match, please retype and try again.");
			flag=false;//flag=false;
			//return false;
		}
		else 
		{
		document.getElementById("nerror").innerHTML="";
		}

		if(mobile.toString().length != 10 )
		{
			document.getElementById("merror").innerHTML="Enter Correct Mobile Number";
			flag=false;
		}
		else 
		{
		document.getElementById("merror").innerHTML="";
		}


	//	if(email.toString().length === 0 )
	//	{
		//	document.getElementById("eerror").innerHTML="Enter Email Address";
		//	flag=false;
		//}
		
		
		if( !re.test(pswd))
		{
			console.log(pswd);
			document.getElementById("pwderror").innerHTML="Password must be minimum of eight character and contains at least 1 uppercase , 1 lowercase ,1 numbers and 1  special character.";
			flag=false;
		
		}
		else 
		{
		document.getElementById("pwderror").innerHTML="";
		}

		
 
/*	 if( pswd.toString() ===  cnfrm_pswd.toString())//|| name.value.match(letters) )
	 {
			
		document.getElementById("cnfrmpswderror").innerHTML="Password Not Matches";
			//alert("Confirmation fields do not match, please retype and try again.");
			flag=false;//flag=false;
			//return false;
		}
		else 
		{
		document.getElementById("cnfrmpswderror").innerHTML="";
		}
			
*/
	return flag;
	
	}
	
	</script>

	</div>
	</div>
		<!-- FOOTER ROW--->
	<div class="row">
		<footer>Copyright &copy;
		ANNS
		</footer>
	</div>
	<!-- END OF FOOTER ROW----------->

		




</div>	
</body>
</html>