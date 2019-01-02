<%-- 
    Document   : login
    Created on : 16 Dec, 2018, 1:03:00 PM
    Author     : win 7
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

	<!-- TITLE --->
	<title>Login</title>

	<!----------- INCLUSION OF FONT AWESOME LIBRARY------------->
	<script src="https://use.fontawesome.com/7d44bc7623.js"></script>
	<link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet'>
	
	<!---------- INCLUSION OF VIEWPORT --------------->
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<!----------- INCLUSION OF  CSS FILES  ----------->
	<link rel="stylesheet" type="text/css" href="css/normalize.css">
	<link rel="stylesheet" type="text/css" href="css/login.css">
	<link rel="stylesheet" type="text/css" href="css/common.css">

	<!----- INCLUSION OF BOOTSTRAP ------------>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>



<!-------- BODY STARTS --------------->
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
					<li>
					<!--<a href="admin_loginpage.html">Admin</a></li>-->
						
						<li><a href="home.jsp">Home</a></li>
						<li><a href="#">Login</a></li>
						<li><a href="register.jsp">Register</a></li>
						<li><a href="aboutus.jsp">About Us</a></li>
						<li><a href="contact_us.jsp">Contact Us</a></li>
					</ul>
				</div>
		</div> <!-------- END OF MENU ROW---------->


	<!--------------------Login Form---------------------->	
	<div class="row login-text">
	<div class="ccol-md-12">
	
	<div class ="login-body man">
         <img src ="images/man2.jpg"/>
 

         <form action="Login" method="post">
             <div class ="form-input">
                 <input type="email" name="email" id="email" placeholder="Enter Email">
				 <p class="error" id="uerror"></p>
             </div>
             <div class ="form-input">
                 <input type="password" name="password" id="password" placeholder="Enter Password">
					 <p class="error" id="perror"></p>	
             </div>
            <input type="submit" name="submit" value="LOGIN" class ="btn-login" onclick="return validate()">
         </form><br>
		 <div class="forgot-text">
         <a href="#">Forgot Password?</a>
         </div>
		 </div>
	</div>
</div>	
     <!-------------End of Login Text-------------------->

<script>	
	function validate(){
			var  user=document.getElementById("email").value;
			var  pswd=document.getElementById("password").value;
			var flag=true;
			
			if(user.toString().length === 0 )
			{
			document.getElementById("uerror").innerHTML="Enter Username";
			flag=false;
			}
			else 
			{
			document.getElementById("uerror").innerHTML="";
			}
		
		
		if(pswd.toString().length === 0 )
		{
			document.getElementById("perror").innerHTML="Enter Password";
			flag=false;
		}
		else 
		{
			document.getElementById("perror").innerHTML="";
			
		}
		
		return flag;
	
	}
	</script>








		
		
		<!-- FOOTER ROW--->
	<div class="row">
		<footer>Copyright &copy;
		2018    
		</footer>
	</div>
	<!-- END OF FOOTER ROW----------->

		
		
		
		
		
	</div>
</body>
</html>	
		