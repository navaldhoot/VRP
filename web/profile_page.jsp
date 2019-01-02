<%-- 
    Document   : profile_page
    Created on : 16 Dec, 2018, 5:55:45 PM
    Author     : win 7
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
        String email = (String)session.getAttribute("email");
       // out.print(email);
        String name="";
        String mobile="";
//String getEmail = session.getId("email  ");
       session.setAttribute("email",email) ;
         try {
                Class.forName("com.mysql.jdbc.Driver");  
                Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/vrp","root","Naval@2356");  
            Statement stmt = (Statement) con.createStatement();
      // out.print("Heloo");
            String query = "SELECT * FROM register Where Email='"+email+"'";
           // out.print("Hj");
            stmt.executeQuery(query);
            //out.print("j");
            ResultSet rs = stmt.getResultSet();
           // out.print("Heloojhkjkj");
            if (rs.next() == false) {
                   out.println("ResultSet in empty in Java");
      } else {
            do{
      
                 name = rs.getString("Name");
                 mobile = rs.getString("Mobile");
               
                
                 //response.setHeader("Refresh", "5;url=user.jsp");  

            }while(rs.next());
            }
        }catch (Exception e2) {System.out.println(e2);}  
 
   
    
    %>

<!DOCTYPE html>
<head>
	<title>VRP</title>
	
	<!----------- INCLUSION OF FONT AWESOME LIBRARY------------->
	<script src="https://use.fontawesome.com/7d44bc7623.js"></script>
	<link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet'>
	
	
	<!---------- INCLUSION OF VIEWPORT --------------->
<!---------- INCLUSION OF VIEWPORT --------------->
<meta name="viewport" content="width=1250">
	
	<!----------- INCLUSION OF  CSS FILES  ----------->
	<link rel="stylesheet" type="text/css" href="css/profile_page.css">
	<link rel="stylesheet" type="text/css" href="css/common.css">
	<!----- INCLUSION OF BOOTSTRAP ------------>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>

<body>
	<div class="container">
	
		
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
						<li><a href="user_homepage.jsp">Home</a></li>
						<li><a href="#">Profile</a></li>
						<li><a href="logout.jsp">Logout</a></li>
					</ul>
				</div>
		</div> <!-------- END OF MENU ROW---------->

	
	<div class="row">
		<div class="col-md-12 head">
			<p > Profile</p>
	
		</div>
	
	<div class="col-md-12 form">
	
	
	<table align="center">
	<tbody>
	
	<tr>	
	<td class="form_head">Name</td>
	<td class="profile"><% out.print(name); %></td>
			</tr>
	
	

	

	<tr>	
	<td class="form_head">Email</td>
	<td class="profile"><% out.print(email); %></p>
	</td>
			</tr>

	<tr>	
	<td class="form_head">Mobile Number</td>
	<td class="profile"><% out.print(mobile); %></td>
			</tr>
	
	<tr>	
		
	</tbody>
	</table>
	
	</div>
	</div>
	<div class="row footer">
		
				<footer>
                		<p>CopyRight &copy 2018</p>
                </footer>
            </div>
    	
		
	
	</div>	
</body>	
</html>
