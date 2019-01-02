<%-- 
    Document   : admin_view_user
    Created on : 16 Dec, 2018, 6:46:08 PM
    Author     : win 7
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>VRP</title>
	<link rel="shortcut icon" href="img/favicon.ico" />
	<!----------- INCLUSION OF FONT AWESOME LIBRARY------------->
	<script src="https://use.fontawesome.com/7d44bc7623.js"></script>
	<link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet'>
	
	<!---------- INCLUSION OF VIEWPORT --------------->
<!---------- INCLUSION OF VIEWPORT --------------->
	<meta name="viewport" content="width=1250">
	<!----------- INCLUSION OF  CSS FILES  ----------->
	<link rel="stylesheet" type="text/css" href="css/style.css">

	<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/admin_view_user.css">
	<!----- INCLUSION OF BOOTSTRAP ------------>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	
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
						<li><a href="admin_dashboard.jsp">Dashboard</a></li>
						<li><a href="route_planner.jsp">Route Planner</a></li>
						<li><a href="#">View User</a></li>
						<!--<li><a href="myaccount.jsp">My Account</a></li>-->
						<li><a href="logout.jsp">Logout</a></li>
					</ul>
				</div>
		</div> <!-------- END OF MENU ROW---------->

	
	</div>	
	<div class="row">
		<div class="col-md-12 admin-head">
			<p>View User</p>
	
		</div>
	
	<div class="col-md-12 student-form">
	
	
			
	<table align='center' border='1' >
			<tr>
			<th>S.no.</th>
			<th>Name</th>
			<th>Email</th>
			<th>Mobile</th>
			<th>User_Type</th>	
		</tr>
    <%
         String email = (String)session.getAttribute( "email" );
        //String getEmail = session.getId("email  ");
       session.setAttribute("email",email) ;
        String getEmail="",name="",mobile="";
                String user_type="";
        int i=0;
        
        try {
                Class.forName("com.mysql.jdbc.Driver");  
                Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/vrp","root","Naval@2356");  
            Statement stmt = (Statement) con.createStatement();
      
            String query = "SELECT * FROM register order by User_Type";
            stmt.executeQuery(query);
            ResultSet rs = stmt.getResultSet();
            if (rs.next() == false) {
        out.println("Nobody is here");
      } else {
            do{
                name= rs.getString("Name");
                getEmail = rs.getString("Email");
                user_type = rs.getString("User_Type");
                mobile = rs.getString("Mobile");
                i++;
               //response.setHeader("Refresh", "5;url=user.jsp");  
%>
        
    		
                
                <tr>
                                <td><% out.println(i); %></td>
				<td><% out.println(name); %></td>
				<td><% out.println(getEmail); %></td>
				<td><% out.println(mobile); %></td>
				<td><% out.println(user_type); %></td>
			</tr>
      <%    }while(rs.next());
            }
        }catch (Exception e2) {System.out.println(e2);}  
 
  
        
    
    %>          
  	

                        
        </table>      
        </div>
        </div>
        <div class="row">
		<footer>
                <div class="col-md-12">
                		<p>CopyRight &copy 2018</p>
                </div>
            </div>
			</footer>
    </div>
		
		
	
	</div>	
</body>	
</html>

