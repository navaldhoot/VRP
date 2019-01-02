<%-- 
    Document   : route_planner
    Created on : 16 Dec, 2018, 7:08:48 PM
    Author     : win 7
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	
  <title>Route Planner</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/route_planner.css">

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  
  
  	<script type="text/javascript">
		
	jQuery(function(){
    var counter = 1;
	var counter2= 1;
/*LOcationn Information*********/
    jQuery('button.add_location').click(function(event){
        event.preventDefault();

        var newRow = jQuery('<tr><td class="index">'+
		counter2 + '</td><td><input type="text" name="location_name'+
		counter2 + '" id="location_name'+counter2+'" placeholder="Location Name"/><p id="lnerror+'+counter2+'"></p></td><td><input type="number" name="location_x_co'+
		counter2 + '" id="location_x_co'+counter2+'" step="any" placeholder="X-Coordinate of Location"/><p id="lxerror+'+counter2+'"></p></td><td><input type="number" name="location_y_co'+
		counter2 + '" id="location_y_co'+counter2+'" step="any" placeholder="Y-Coordinate of Location"/><p id="lyerror+'+counter2+'"></p></td><td><input type="number" name="location_demand'+
		counter2 + '" id="location_demand'+counter2+'" step="any" placeholder="Demand"/><p id="lderror+'+counter2+'"></p></td></tr>');
	            counter2++;
        jQuery('table.location_info').append(newRow);

    });

	
	
	/*********Car Information**************/
	jQuery('button.add_vehicle').click(function(event){
        event.preventDefault();

        var newRow = jQuery('<tr><td class="index">'+
		counter + '</td><td><input type="text" name="vehicle_name'+
		counter + '" id="vehicle_name'+counter+'" placeholder="Vehicle Name"/><p id="vnerror+'+counter+'"></p></td><td><input type="number" name="vehicle_capacity'+
		counter + '" id="vehicle_capacity'+counter+'" step="any" placeholder="Vehicle Capacity"/><p id="vcerror+'+counter+'"></p></td><td><input type="number" name="vehicle_petrol'+
		counter + '" id="vehicle_petrol'+counter+'" step="any" placeholder="Petrol Content"/><p id="vperror+'+counter+'"></p></td><td><input type="number" name="vehicle_mileage'+
		counter + '" id="vehicle_mileage'+counter+'" step="any" placeholder="Vehicle Mileage"/><p id="vmerror+'+counter+'"></p></td></tr>');
	            counter++;
        jQuery('table.vehicle_info').append(newRow);

    });

	
	

	});

</script>

  
</head>
<body >
    <%
         String email = (String)session.getAttribute("email" );
        //String getEmail = session.getId("email  ");
       session.setAttribute("email",email) ;
    
    
    %>
		
	
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
						<li><a href="#">Route Planner</a></li>
						<li><a href="admin_view_user.jsp">View User</a></li>
						<!--<li><a href="myaccount.jsp">My Account</a></li>-->
						<li><a href="logout.jsp">Logout</a></li>
					</ul>
				</div>
		</div> <!-------- END OF MENU ROW---------->


	<div class="row about-us">
		<h2 class="heading">Input Form</h2>
			<form action="VRP" method="post">
	
	
	<div class="col-md-12 route-head">	    
		<p>Hub Information</p>
	</div>
	
	<div class="col-md-12">
	<table align="center">
	<tbody>
	
	<tr>	
	<td class="form_head">Hub Name</td>
	<td>		<input type="text" name="hub_name" id="hub_name" placeholder="Hub-Name">
		<p id="hnerror"></p></td>
			</tr>
	
	<tr>	
	<td class="form_head">X-Coordinate of Hub</td>
	<td><input type="number" name="hub_x_co" id="hub_x_co" step="any" placeholder="X-Coordinate of Hub">
	<p id="hxerror"></p></td>
			</tr>
	
	
	
	<tr>	
	<td class="form_head">Y-Coordinate of Hub</td>
	<td><input type="number" name="hub_y_co" id="hub_y_co" step="any" placeholder="Y-Coordinate of Hub">
	<p id="hyerror"></p></td>
			</tr>


	</tbody>
	</table>
	</div>
	
	<div class="col-md-12 route-head">	    
		<p>Location Information</p>
	</div>
	<div class="col-md-12 location">
	<table class="location_info" align="center">
		
	<tr>
			<th class="form_head index">S.NO.</th>
			<th class="form_head">Location Name</th>
			<th class="form_head">X-Coordinate</th>
			<th class="form_head">Y-Coordinate</th>
			<th class="form_head">Demand</th>
			
			
	</tr>
	</table>
	<input name="NumLocation" id="NumLocation" type="hidden" >
	<input name="NumVehicles" id="NumVehicles" type="hidden" >
	
		<button  title="" class="add_location" onclick="location_increment()"><span>Add Row</span></button>
	<script type="text/javascript">

		var j=0;
	function location_increment()
	{
		j=j+1;
		document.getElementById("NumLocation").value= j	;
	}

	</script>
  </div>
  
	<div class="col-md-12 route-head">	    
		<p>Vehicle Information</p>
	</div>
	 	<div class="col-md-12 vehicle">
	<table class="vehicle_info" align="center">
		
	<tr>
			<th class="form_head index">S.NO.</th>
			<th class="form_head">Vehicle Name</th>
			<th class="form_head">Vehicle Capacity</th>
			<th class="form_head">Petrol Content</th>
			<th class="form_head">Mileage per litre</th>
			
			
	</tr>
	
	</table>
		<button  title="" class="add_vehicle" onclick="vehicle_increment()"><span>Add Row</span></button>
	<script type="text/javascript">

		var i=0;
	function vehicle_increment()
	{
		i=i+1;
		document.getElementById("NumVehicles").value= i	;
	}

	</script>
  
	</div>
  
  
 
  <div class="col-md-12">
				<input type="submit" value="Submit Query" onclick="return validate()">
	<script>
		function validate()
		{
			var flag=true;
			
			var hub_name = document.getElementById("hub_name").value;
			var hub_x_co=document.getElementById("hub_x_co").value;
			var  hub_y_co=document.getElementById("hub_y_co").value;
			console.log(i);
			
			var a  = {};
			
			for(var k=1;k<i;k=k+1){
				k["vehicle_name"+k]=document.getElementById("vehicle_name"+k).value;
				console.log(a["vehicle_name"+k]	);
				
			}
			/*var  clg_pin=document.getElementById("clg_pin").value;
			var  clg_contact=document.getElementById("clg_contact").value;
			var  clg_stream=document.getElementById("clg_stream[]").value;
	
		console.log(clg_stream);
	
			var flag=true;

	
	var chklength = CheckForm();
		if(chklength === 0 )
		{
			document.getElementById("berror").innerHTML="Select AtLeast One Branch";
			flag=false;
		}
		else 
		{
			document.getElementById("berror").innerHTML="";
			
		}
		*/	
	
	 if( hub_name.toString().length === 0 )//|| name.value.match(letters) )
	 {
			
		document.getElementById("hnerror").innerHTML="Enter Hub Name";
			//alert("Confirmation fields do not match, please retype and try again.");
			flag=false;//flag=false;
			//return false;
	}
	else 
	{
			document.getElementById("hnerror").innerHTML="";
			
	}

	if(hub_x_co.toString().length === 0 )
		{
			document.getElementById("hxerror").innerHTML="Enter X-Coordinate of Hub";
			flag=false;//flag=false;
		}
		else 
		{
			document.getElementById("hxerror").innerHTML="";
			
		}
		
		if(hub_y_co.toString().length === 0 )
		{
			document.getElementById("hyerror").innerHTML="Enter Y-Coordinate of Hub";
			flag=false;
		}
		else 
		{
			document.getElementById("hyerror").innerHTML="";
			
		}
/*		if(clg_pin.toString().length != 6 )
		{
			document.getElementById("perror").innerHTML="Enter 6 digit Correct Pincode";
			flag=false;
		}
		else 
		{
			document.getElementById("perror").innerHTML="";
			
		}
		
		
		if(clg_contact.toString().length === 0 )
		{
			document.getElementById("conerror").innerHTML="Enter Contact Number";
			flag=false;
		}
		else 
		{
			document.getElementById("conerror").innerHTML="";
			
		}
	*/	
	return flag;
	
	}
	
	

</script>
  </div>
</form>
	
	
        </div>
	</div>

		
		
		
		

<!-- FOOTER ROW--->
	<div class="row">
		<footer >Copyright &copy  
		 2018
		</footer>
	</div>
	<!-- END OF FOOTER ROW----------->


</body>
</html>
	