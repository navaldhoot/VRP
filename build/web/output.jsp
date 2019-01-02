<%-- 
    Document   : output
    Created on : 17 Dec, 2018, 10:36:26 PM
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
         String username = (String)request.getSession().getAttribute("username");
         String ID = (String)request.getSession().getAttribute("ID");
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
						<li><a href="#">Output</a></li>
						<li><a href="logout.jsp">Logout</a></li>
					</ul>
				</div>
		</div> <!-------- END OF MENU ROW---------->


	<div class="row about-us">
                <h2 class="heading">Output</h2>
		
            <%
        String hub_name="",hub_x_co="",hub_y_co="";
                //PrintWriter out = 
                try {
                Class.forName("com.mysql.jdbc.Driver");  
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/vrp","root","Naval@2356");  
            Statement stmt = (Statement) con.createStatement();
      
             String query = "SELECT * FROM "+username+"_hub  Where ID='"+ID+"'";
            stmt.executeQuery(query);
            ResultSet rs = stmt.getResultSet();
            
            if (rs.next() == false) {
        out.println("Hub Details Not found");
      } else {
            do{
      
                    hub_name = rs.getString("hub_name");
                hub_x_co = rs.getString("x_coordinate");
                hub_y_co = rs.getString("y_coordinate");
              
            }while(rs.next());
            }
        }catch (Exception e2) {System.out.println(e2);}  
 
  
                
                %>
<div class='col-md-12'>
	<table align='center'>
	<tbody>
	
	<tr>	
	<td class='form_head'>Hub Name</td>
	<td class='form_head'><% out.println(hub_name); %></td>
			</tr>
	
	<tr>	
	<td class='form_head'>X-Coordinate of Hub</td>
	<td class='form_head'><% out.println(hub_x_co); %></td>
			</tr>
	
	
	
	<tr>	
	<td class='form_head'>Y-Coordinate of Hub</td>
	<td class='form_head'><% out.println(hub_y_co); %></td>
			</tr>


	</tbody>
	</table>
	</div>
            <div class='col-md-12 route-head'>	    
<%    

int count=0;
   try {
                Class.forName("com.mysql.jdbc.Driver");  
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/vrp","root","Naval@2356");  
           Statement s = con.createStatement();
ResultSet rs = s.executeQuery("SELECT COUNT(*) AS rowcount FROM "+username+"_location where ID='"+ID+"'");
rs.next();
count = rs.getInt("rowcount");
rs.close();
           
        }catch (Exception e2) {System.out.println(e2);}  
 
%>		<p>Location Information</p>
<span class='form_head'>No. of Locations:<% out.println( count ); %></span><br>
	</div>
<%
	int i=1;
	
  %>
  <div class='row'><div class='col-md-12 location'>
  <table class='location_info' align='center'>
		
	<tr>
			<th class='form_head index'>S.No.</th>
			<th class='form_head'>Location Name</th>
			<th class='form_head'>X-Coordinate</th>
			<th class='form_head'>Y-Coordinate</th>
			<th class='form_head'>Demand</th>
			
			
	</tr>
        <%
	String temp1="",temp2="",temp3="",temp4="";
	
	i=1;
          try {
                Class.forName("com.mysql.jdbc.Driver");  
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/vrp","root","Naval@2356");  
            Statement stmt = (Statement) con.createStatement();
      
             String query = "SELECT * FROM "+username+"_location  Where ID='"+ID+"'";
            stmt.executeQuery(query);
            ResultSet rs = stmt.getResultSet();
            
            if (rs.next() == false) {
        out.println("Location Details Not found");
      } else {
            do{
      
                    temp1 = rs.getString("location_name");
                temp2 = rs.getString("location_x_coordinate");
                temp3 = rs.getString("location_y_coordinate");
                temp4 = rs.getString("location_demand");
            
	 	%>
		<tr>
			<th class='form_head'><% out.print(i);%></th>
			<th class='form_head'><% out.print(temp1);%></th>
			<th class='form_head'><%out.print(temp2);%></th>
			<th class='form_head'><%out.print(temp3);%></th>
			<th class='form_head'><%out.print(temp4);%></th>
			
			
	</tr>
        
        
        <%
           i=i+1;
          }while(rs.next());
        }
  }catch (Exception e2) {System.out.println(e2);}  
 
        
        %>
	</table></div></div>
            
<%    

count=0;
   try {
                Class.forName("com.mysql.jdbc.Driver");  
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/vrp","root","Naval@2356");  
           Statement s = con.createStatement();
ResultSet rs = s.executeQuery("SELECT COUNT(*) AS rowcount FROM "+username+"_vehicle where ID='"+ID+"'");
rs.next();
count = rs.getInt("rowcount");
rs.close();
           
        }catch (Exception e2) {System.out.println(e2);}  
 
%>	
	<div class='col-md-12 route-head'>	    
		<p>Vehicle Information</p>
		<span class='form_head'>No. of Vehicles:<% out.println(count);%></span><br/>

	</div>
	
	
	<% 
          int  j=1;
	
	%>
       <div class='row'>
	 	<div class='col-md-12 vehicle'>
	<table class='vehicle_info' align='center'>
		
	<tr>
			<th class='form_head index'>S.NO.</th>
			<th class='form_head'>Vehicle No.</th>
			<th class='form_head'>Vehicle Capacity</th>
			<th class='form_head'>Petrol Content</th>
			<th class='form_head'>Mileage per litre</th>
			<th class='form_head'>Distance Travel By Vehicle</th>
			
			
	</tr>
        <%
	
            
            
            ArrayList<String> veh_name = new ArrayList<String>();
        
            temp1="";temp2="";temp3="";temp4="";
	String temp5="";
        
        
        j=1;
          try {
                Class.forName("com.mysql.jdbc.Driver");  
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/vrp","root","Naval@2356");  
            Statement stmt = (Statement) con.createStatement();
      
             String query = "SELECT * FROM "+username+"_vehicle  Where ID='"+ID+"'";
            stmt.executeQuery(query);
            ResultSet rs = stmt.getResultSet();
            
            if (rs.next() == false) {
        out.println("Vehicles Details Not found");
      } else {
            do{
      
                temp1 = rs.getString("vehicle_name");
                veh_name.add(temp1);
                temp2 = rs.getString("vehicle_capacity");
                temp3 = rs.getString("petrol_content");
                temp4 = rs.getString("mileage_per_litre");
                temp5 = rs.getString("vehicle_distance");
                
	 	%>
	
	
        <tr>
			<th class='form_head'><% out.println(j);%></th>
			<th class='form_head'><% out.println(temp1);%></th>
			<th class='form_head'><% out.println(temp2);%></th>
			<th class='form_head'><% out.println(temp3);%></th>
			<th class='form_head'><% out.println(temp4);%></th>
			<th class='form_head'><% out.println(temp5);%></th>
			
			
	</tr>
		
        <%
                
    j=j+1;
            }while(rs.next());
            }
        }catch (Exception e2) {System.out.println(e2);}  
 
        	   %>
	
	
    </table></div></div>
		
                   <div class="row">
                   <div class='col-md-12 route-head'>	    
		<p>VRP Method</p>
	</div>
	<%  


           temp1="";
           temp2="";
               int cost =0,EndCost=0;
                  
           try {
                Class.forName("com.mysql.jdbc.Driver");  
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/vrp","root","Naval@2356");  
            Statement stmt = (Statement) con.createStatement();
      
             String query = "SELECT * FROM "+username+"_solution  Where ID='"+ID+"'";
            stmt.executeQuery(query);
            ResultSet rs = stmt.getResultSet();
            
            if (rs.next() == false) {
        out.println("Solution Details Not found");
      } else {
            do{
      
                    temp1 = rs.getString("vehicle_no");
                    
                    
                    
                    
                temp2 = rs.getString("vehicle_path");
                
        	   
           

                
 %>
  
  <div class='col-md-12 route-head'>
				<span class='form_head'>Vehicle <%out.println(veh_name.get(Integer.parseInt(temp1)-1));%>:&nbsp&nbsp&nbsp&nbsp</span>
    <%            
        cost=0;
       String[] arrOfStr = temp2.split(",",0 ); 
    
               int len=arrOfStr.length;
                  int l1 = 0;
                  String s="";
                while(l1<len){
                      s = arrOfStr[l1];
                      if (l1 == len-1)
                       { 
	%>
                        <span class='form_head'><% out.println(s); %></span>&nbsp&nbsp&nbsp&nbsp 
<%			}
                       else 
                       {
                            if(l1%2==0){
                           %>
                           <span class='form_head'><% out.println(s); %>&nbsp&nbsp&nbsp&nbsp &#10230 <sup style='margin-left:-28px'><% out.println(arrOfStr[l1+1]); %></sup>&nbsp&nbsp&nbsp&nbsp&nbsp</span>
                      <% //   }  
                //else{
                        cost = cost + Integer.parseInt(arrOfStr[l1+1]);
                        //EndCost += cost;
               }
                                l1++;
                        }
                     
                      
                      l1++;
                  }
                   EndCost =  EndCost + cost;
                %>
                <br><span class='form_head'>Cost  :<% out.print(cost);%> km</span> </br>
                
                
                
            
           <%
        

   

}while(rs.next());
%>

<%
}          
 }  catch (Exception e2) {System.out.println(e2);}  
 
           
  %>
       <br><span class='form_head'>Total Cost  :<% out.print(EndCost);%> km</span> </br>
         	
  </div>	
	</div>	
        </div>
<!-- FOOTER ROW--->
	</div>
	<!-- END OF FOOTER ROW----------->
<div class="col-md-12" style="padding:0px">
            <footer>Copyright &copy; 
		2018
		</footer>
	</div>
        
    
 </body>
   
</html>
