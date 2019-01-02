<%-- 
    Document   : user_homepage
    Created on : 16 Dec, 2018, 1:13:21 PM
    Author     : win 7
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	
  <title>Login Home</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/user_homepage.css">

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
</head>
<body >
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
<%
         String email = (String)session.getAttribute( "email" );
        //String getEmail = session.getId("email  ");
       session.setAttribute("email",email) ;
    
    
    %>
		
		
		
		
		
				
		<!------ MENU ROW --------------->
		<div class="row menu">
		
				<!------ MENU CODE ---------->
				<div class="col-md-12 navigation">
					<ul>
						<li><a href="#">Home</a></li>
						<li><a href="profile_page.jsp">Profile</a></li>
						<li><a href="logout.jsp">Logout</a></li>
					</ul>
				</div>
		</div> <!-------- END OF MENU ROW---------->


	<div class="row about-us">
		<h2 class="heading">HOME PAGE</h2>
		<p class="text">
		

The vehicle routing problem (VRP) is a combinatorial optimization and integer programming problem which asks "What is the optimal set of routes for a fleet of vehicles to traverse in order to deliver to a given set of customers?". It generalises the well-known travelling salesman problem (TSP). It first appeared in a paper by George Dantzig and John Ramser in 1959,[1] in which first algorithmic approach was written and was applied to petrol deliveries. Often, the context is that of delivering goods located at a central depot to customers who have placed orders for such goods. The objective of the VRP is to minimize the total route cost. In 1964, Clarke and Wright improved on Dantzig and Ramser's approach using an effective greedy approach called the savings algorithm.

Determining the optimal solution to VRP is NP-hard, so the size of problems that can be solved, optimally, using mathematical programming or combinatorial optimization may be limited. Therefore, commercial solvers tend to use heuristics due to the size and frequency of real world VRPs they need to solve. (For a non-technical explanation of why the VRP is so challenging please see the External Links below.)

The VRP has many obvious applications in industry. In fact, the use of computer optimization programs can give savings of 5% to a company[3] as transportation is usually a significant component of the cost of a product (10%)[4] - indeed, the transportation sector makes up 10% of the EU's GDP. Consequently, any savings created by the VRP, even less than 5%, are significant.[3]
		
		
		</p>
			</div>

		
		
		
		

<!-- FOOTER ROW--->
	<div class="row">
		<footer>Copyright &copy;
		2018
		</footer>
	</div>
	<!-- END OF FOOTER ROW----------->







</body>
</html>