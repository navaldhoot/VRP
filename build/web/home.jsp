<%-- 
    Document   : home
    Created on : 16 Dec, 2018, 1:02:18 PM
    Author     : win 7
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

	<!-- TITLE --->
	<title>VRP</title>

	<!----------- INCLUSION OF FONT AWESOME LIBRARY------------->
	<script src="https://use.fontawesome.com/7d44bc7623.js"></script>
	<link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet'>
	
	<!---------- INCLUSION OF VIEWPORT --------------->
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<!----------- INCLUSION OF  CSS FILES  ----------->
	<link rel="stylesheet" type="text/css" href="css/normalize.css">
	<link rel="stylesheet" type="text/css" href="css/home.css">
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
						<!--<li><a href="admin_loginpage.html">Admin</a></li>-->
						<li><a href="#">Home</a></li>
						<li><a href="login.jsp">Login</a></li>
						<li><a href="register.jsp">Register</a></li>
						<li><a href="aboutus.jsp">About Us</a></li>
						<li><a href="contact_us.jsp">Contact Us</a></li>
					</ul>
				</div>
		</div> <!-------- END OF MENU ROW---------->


		<!----------- HEADER ROW ------------>
		<div class="row">
		
		
		
			<!-- SLIDESHOW CODE ---------------->
			<div class="slideshow-container" >

				<div class="effect mySlides">
				  <img src="images/1.jpg" class="imgshow">
					</div>
				 
				<div class="effect mySlides">
				  <img src="images/2.jpg" class="imgshow">
				</div>

				<div class="effect mySlides">
				  <img src="images/3.jpg" class="imgshow">
				</div>
				
				<div class="effect mySlides">
				  <img src="images/4.jpg" class="imgshow">
				</div>

				<div class="dot-container" style="text-align:center">
				<span class="dot"></span> 
				<span class="dot"></span> 
				<span class="dot"></span> 
				<span class="dot"></span> 
				</div>

			</div> <!-- END OF SLIDESHOW CODE------------>
</div>

	<!-- JAVSCRIPT CONTAIN OF SLIDESHOW ---------------->
	<script>
		var slideIndex = 0;
		showSlides();

		function showSlides() {
			var i;
			var slides = document.getElementsByClassName("mySlides");
			var dots = document.getElementsByClassName("dot");
			for (i = 0; i < slides.length; i++) {
			   slides[i].style.display = "none";  
			}
			slideIndex++;
			if (slideIndex> slides.length) {slideIndex = 1}    
			for (i = 0; i < dots.length; i++) {
				dots[i].className = dots[i].className.replace(" active", "");
			}
			slides[slideIndex-1].style.display = "block";  
			dots[slideIndex-1].className += " active";
			setTimeout(showSlides, 2000); // Change image every 2 seconds
		}
	</script>
	<!-- END OF JAVASCRIPT CONTAIN---------------->

	<!-- FEATURES ROW------------>	
	<div class="row feature">
		<p class="fhead">VRP Variants</p>
		
		<!-- 1 & 2 COLUMN---->
		<div class="col-md-6 col-sm-12 f1">
			<h1 class="fpt">1</h1>
			<div class="fdiv">
			<h3 style="color:#f6d38f" class="fh3">Vehicle Routing Problem with Pickup and Delivery (VRPPD)</h3>
			<p class="ftxt"> A number of goods need to be moved from certain pickup locations to other delivery locations. The goal is to find optimal routes for a fleet of vehicles to visit the pickup and drop-off locations.</p>
			</div>
			
			<h1 class="fpt">2</h1>
			<div class="fdiv">
			<h3 style="color:#d4e06d" class="fh3">Capacitated Vehicle Routing Problem</h3>
			<p class="ftxt">CVRP or CVRPTW. The vehicles have limited carrying capacity of the goods that must be delivered.</p>
			</div>
		</div>
		<!-- END OF 1 & 2 COLUMN---->
	
		<!-- 3 & 4 COLUMN---->
		<div class="col-md-6 col-sm-12 f2">
			<h1 class="fpt">3</h1>
			<div class="fdiv">
			<h3 style="color:#1888af" class="fh3">Vehicle Routing Problem with LIFO </h3>
			<p class="ftxt">Similar to the VRPPD, except an additional restriction is placed on the loading of the vehicles: at any delivery location, the item being delivered must be the item most recently picked up. This scheme reduces the loading and unloading times at delivery locations </p>
			</div>

			<h1 class="fpt">4</h1>
			<div class="fdiv">
			<h3 style="color:#e95151" class="fh3">Vehicle Routing Problem with Time Windows (VRPTW) </h3>
			<p class="ftxt">The delivery locations have time windows within which the deliveries (or visits) must be made.</p>
			</div>
		</div>
		<!-- END OF 3 & 4 COLUMN---->
		
	</div>
	<!---  END OF FEATURES ROW ---------->
	



	<!-- Team ROW---
	<div class="row team">
	
		
		
		
		





	</div>
	<!-- END OF TEAM ROW----------->










	<!-- FOOTER ROW--->
	<div class="row">
		<footer>Copyright &copy;2018 
		</footer>
	</div>
	<!-- END OF FOOTER ROW----------->

		
		
		
		
		
	</div>
</body>
</html>