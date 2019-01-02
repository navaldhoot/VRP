<%-- 
    Document   : contactus
    Created on : 16 Dec, 2018, 1:01:22 PM
    Author     : win 7
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

	<!-- TITLE --->
	<title>Contact Us</title>

	<!----------- INCLUSION OF FONT AWESOME LIBRARY------------->
	<script src="https://use.fontawesome.com/7d44bc7623.js"></script>
	<link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet'>
	
	<!---------- INCLUSION OF VIEWPORT --------------->
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<!----------- INCLUSION OF  CSS FILES  ----------->
	<link rel="stylesheet" type="text/css" href="css/normalize.css">
	<link rel="stylesheet" type="text/css" href="css/contact_us.css">
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
						<li><a href="login.jsp">Login</a></li>
						<li><a href="register.jsp">Register</a></li>
						<li><a href="aboutus.jsp">About Us</a></li>
						<li><a href="#">Contact Us</a></li>
					</ul>
				</div>
		</div> <!-------- END OF MENU ROW---------->


	
	
		
	<div class="row contact-us cont">
		
		
		
		<div id="map" style="height:400px;margin:50px 30px;"></div>
    <script>
      function initMap() {
        var uluru = {lat: 22.7196, lng: 75.8577};
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 14,
          center: uluru,
		  scrollwheel: false
        });
        var marker = new google.maps.Marker({
          position: uluru,
          map: map
        });
      }
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAp8BMgxPlZs_AQBOCMfs7Ce27E738YySk&callback=initMap">
	</script>

	
			<div class="row r1">
			<h2>CONTACTS</h2>
		</div>	

	<div class="row">
			<div class="col-md-4 info">
			<h2>CONTACT<br/>INFO</h2>
			<h5>Lorem Ipsum is simply dummy text of the printing and typesetting industry<br/></h5>
			<p id="txt">	Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.<br/><br/>
				SGSITS,Indore<br/>
				23, Park Road,<br/>
				Indore,MP - 452003<br/>
				Telephone: +1 800 603 6035<br/>
				E-mail: mail@sgsits.com</p>
			</div>
			
			
	<div class="col-md-8 col-sm-12 fom">
				<h2 class="head">CONTACT FORM</h2>
				
				
				<form action="contact.php" method="post" class="col-sm-12 ftxt">
				<div class="col-md-4 col-sm-4">
				<input type="text" name="name" placeholder="Name:">
				</div>
				<div class="col-md-4 col-sm-4">
				<input type="email" name="email" placeholder="Email:">
				</div>
				<div class="col-md-4 col-sm-4">
				<input type="text" name="phone" placeholder="Phone:">
				</div>
				<div class="col-md-12 ta">
				<textarea rows="7" cols="100" name="message" placeholder="Message:"></textarea>
				</div>
				<div class="ocbtn">
				<div class="col-sm-3"><input type="reset" value="CLEAR" class="sub"></div>
				<div class="col-sm-3"><input  type="submit" value="SEND" class="sub"></div>
				</div>
				</form>
			</div>
			
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