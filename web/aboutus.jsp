<%-- 
    Document   : aboutus
    Created on : 16 Dec, 2018, 12:59:08 PM
    Author     : win 7
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>


	<!-- TITLE --->
	<title>ABOUT US</title>

	<!----------- INCLUSION OF FONT AWESOME LIBRARY------------->
	<script src="https://use.fontawesome.com/7d44bc7623.js"></script>
	<link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet'>
	
	<!---------- INCLUSION OF VIEWPORT --------------->
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<!----------- INCLUSION OF  CSS FILES  ----------->
	<link rel="stylesheet" type="text/css" href="css/normalize.css">
	<link rel="stylesheet" type="text/css" href="css/aboutus.css">
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
						
						<li><a href="home.jsp">Home</a></li>
						<li><a href="login.jsp">Login</a></li>
						<li><a href="register.jsp">Register</a></li>
						<li><a href="#">About Us</a></li>
						<li><a href="contact_us.jsp">Contact Us</a></li>
					</ul>
				</div>
		</div> <!-------- END OF MENU ROW---------->


	
	
		
	<div class="row about-us">
		<h2 class="heading">ABOUT US</h2>
		<p class="text">
		

The vehicle routing problem (VRP) is a combinatorial optimization and integer programming problem which asks "What is the optimal set of routes for a fleet of vehicles to traverse in order to deliver to a given set of customers?". It generalises the well-known travelling salesman problem (TSP). It first appeared in a paper by George Dantzig and John Ramser in 1959,[1] in which first algorithmic approach was written and was applied to petrol deliveries. Often, the context is that of delivering goods located at a central depot to customers who have placed orders for such goods. The objective of the VRP is to minimize the total route cost. In 1964, Clarke and Wright improved on Dantzig and Ramser's approach using an effective greedy approach called the savings algorithm.

Determining the optimal solution to VRP is NP-hard, so the size of problems that can be solved, optimally, using mathematical programming or combinatorial optimization may be limited. Therefore, commercial solvers tend to use heuristics due to the size and frequency of real world VRPs they need to solve. (For a non-technical explanation of why the VRP is so challenging please see the External Links below.)

The VRP has many obvious applications in industry. In fact, the use of computer optimization programs can give savings of 5% to a company[3] as transportation is usually a significant component of the cost of a product (10%)[4] - indeed, the transportation sector makes up 10% of the EU's GDP. Consequently, any savings created by the VRP, even less than 5%, are significant.[3]
		
		
		</p>
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