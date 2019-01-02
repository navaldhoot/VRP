<%-- 
    Document   : myaccount
    Created on : 19 Dec, 2018, 6:50:52 PM
    Author     : win 7
--%>

<%@page import="java.io.PrintWriter"%>
<%@page import="java.lang.*"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.TimeZone"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@page import="java.text.DateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
       
         String email = (String)request.getSession().getAttribute("email");
            session.setAttribute("email",email) ;
    
      //   out.println(email);
        // out.println(username);
        /// out.println(ID);
         

%>
<!DOCTYPE html>
 <!DOCTYPE html>
		
		
	<html lang="en">
<head>
	
  <title> Output</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/output.css">

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  
  
 
  
</head>
<body >
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
						<li><a href="admin_view_user.jsp">View User</a></li>
						<li><a href="#">My Account</a></li>
						<li><a href="logout.jsp">Logout</a></li>
					</ul>
				</div>
		</div> <!-------- END OF MENU ROW---------->


	<div class="row about-us">

       <%
             String mobile="";

try {
                Class.forName("com.mysql.jdbc.Driver");  
                Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/vrp","root","Naval@2356");  
            Statement stmt = (Statement) con.createStatement();
      
            String query = "SELECT * FROM register Where Email='"+email+"'";
            stmt.executeQuery(query);
            ResultSet rs = stmt.getResultSet();
            if (rs.next() == false) {
                out.print("Email not found!!");
      } else {
            do{
      
                mobile = rs.getString("Mobile");
                
 
            }while(rs.next());
            }
        }catch (Exception e2) {System.out.println(e2);}  
 
  
        
    String[] arrOfStr = email.split("@",0 ); 
                   String goodEmail = arrOfStr[0].replace(".", "");
        
 String username= goodEmail + "_" + mobile + "_";

  %>
  
  
  
  
  <div class="col-md-12 route-head">	    
		<p>My Account</p>
	</div>
	
	<div class="col-md-12">
	<table align="center">
	<tbody>
	
	<tr>	
	<td class="form_head">Date & Time</td>
                <td>	<select name="datetimevalue" id="datetimevalue">
            
                        <option name="Select" selected>--------Select--------</option>        
            <%	
                String time="",date="",combine="";
                try {
                Class.forName("com.mysql.jdbc.Driver");  
                Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/vrp","root","Naval@2356");  
            Statement stmt = (Statement) con.createStatement();
            
            String query = "SELECT * FROM  "+username+"_timedate";
            stmt.executeQuery(query);
            ResultSet rs = stmt.getResultSet();
            if (rs.next() == false) {
                out.print("Email not found!!");
      } else {
            do{
      
                time = rs.getString("Time");
                date = rs.getString("Date");
                combine = date + " " + time  ;
                
                 %>
                        <option name="<%=combine%>" selected><% out.println(combine); %></option>        
                
 <%
            }while(rs.next());
            }
        }catch (Exception e2) {System.out.println(e2);}  
 %>
 </select>
</td>
			</tr>
	
        </table>
    </body>
</html>
