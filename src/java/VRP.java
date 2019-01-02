/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.*;
import java.io.*;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
/**
 *
 * @author win 7
 */
public class VRP extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. 
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet VRP</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VRP at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");*/
            HttpSession session = request.getSession();
            
             String email = (String)session.getAttribute("email" );
        //String getEmail = session.getId("email  ");
       session.setAttribute("email",email) ;
    
            TimeZone timeZone = TimeZone.getTimeZone("Asia/Kolkata");
            DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            Calendar cal = Calendar.getInstance();
            String actual=dateFormat.format(cal.getTime());
            
out.println(dateFormat.format(cal.getTime()));
//PrintWriter out = ne;
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
                   SimpleDateFormat sd = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        Date date = new Date();
        sd.setTimeZone(TimeZone.getTimeZone("IST"));
        //System.out.println(sd.format(date));
             String date1=sd.format(date).toString();
    String[] arrOf = date1.split(" ",0 ); 
                   String actualDate=arrOf[0];
                   String actualTime=arrOf[1];
        
String username= goodEmail + "_" + mobile + "_";
String ID = username +"_"+actualTime+"_"+actualDate;
out.println("<br>"+username+"</br>");
out.println("<br>"+ID+"</br>");

try{
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/vrp","root","Naval@2356");  
PreparedStatement ps=con.prepareStatement("insert into "+username+"_timedate(id,time,date)  values(?,?,?)");  
  
ps.setString(1,ID);  
ps.setString(2,actualTime);  
ps.setString(3,actualDate);  
          
int i=ps.executeUpdate();  
if(i>0){
//out.print("You are successfully registered...");  
} 
else{
    out.println("Error in inserting user time date");
}//request.getRequestDispatcher("login.jsp");  
}catch(Exception ex){ out.println(ex);
}

                            
        //Problem Parameters
        int NoOfCustomers = Integer.parseInt(request.getParameter("NumLocation"));///30;
        int NoOfVehicles = Integer.parseInt(request.getParameter("NumVehicles"));//10;
        int VehicleCap = 50;

        //Depot Coordinates
        String hub_name = (String)request.getParameter("hub_name");
        int Depot_x = Integer.parseInt(request.getParameter("hub_x_co"));//50;
        int Depot_y = Integer.parseInt(request.getParameter("hub_y_co"));//50;

        try{
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/vrp","root","Naval@2356");  

    PreparedStatement ps1=con.prepareStatement("insert into "+username+"_hub(id,hub_name,x_coordinate,y_coordinate) values(?,?,?,?)");
 
  
ps1.setString(1,ID);  
ps1.setString(2,hub_name);  
ps1.setString(3,Integer.toString(Depot_x));  
ps1.setString(4,Integer.toString(Depot_y));

int  z2 = ps1.executeUpdate();  
if(z2>0){
//out.print("You are successfully registered...");  
} 
else{
    out.println("Error in inserting in hub table");
}
}catch(Exception ex){
    out.println(ex);
}   

        
        
        
      
        //Initialise
        //Create Random Customers
        Node[] Nodes = new Node[NoOfCustomers + 1];
        Node depot = new Node(Depot_x, Depot_y);
        int x,y,dem;
        String loc_name;
        Nodes[0] = depot;
        for (int i = 1; i <= NoOfCustomers; i++) {
           /* Nodes[i] = new Node(i, //Id ) is reserved for depot
                    ran.nextInt(100), //Random Cordinates
                    ran.nextInt(100),
                    4 + ran.nextInt(7)  //Random Demand
            );*/
           loc_name=(String)request.getParameter("location_name"+i);
            x=Integer.parseInt(request.getParameter("location_x_co"+i));
            y=Integer.parseInt(request.getParameter("location_y_co"+i));
            dem=Integer.parseInt(request.getParameter("location_demand"+i));
            Nodes[i] = new Node(i, x,y,dem);//Id ) is reserved for depot
             try{
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/vrp","root","Naval@2356");  
PreparedStatement ps2=con.prepareStatement("insert into "+username+"_location(id,location_no,location_name,location_x_coordinate,location_y_coordinate,location_demand)  values(?,?,?,?,?,?)");  
  
ps2.setString(1,ID);  
ps2.setString(2,Integer.toString(i));
ps2.setString(3,loc_name);
ps2.setString(4,Integer.toString(x));
ps2.setString(5,Integer.toString(y));
ps2.setString(6,Integer.toString(dem));  
          
int j=ps2.executeUpdate();  
if(j>0){
//out.print("You are successfully registered...");  
} 
else{
    out.println("Error in inserting location  data table");
}}catch(Exception ex){out.println(ex);
}
}
        
        double[][] distanceMatrix = new double[NoOfCustomers + 1][NoOfCustomers + 1];
        double Delta_x, Delta_y;
        for (int i = 0; i <= NoOfCustomers; i++) {
            for (int j = i + 1; j <= NoOfCustomers; j++) //The table is summetric to the first diagonal
            {                                      //Use this to compute distances in O(n/2)

                Delta_x = (Nodes[i].Node_X - Nodes[j].Node_X);
                Delta_y = (Nodes[i].Node_Y - Nodes[j].Node_Y);

                double distance = Math.sqrt((Delta_x * Delta_x) + (Delta_y * Delta_y));

                distance = Math.round(distance);                //Distance is Casted in Integer
                //distance = Math.round(distance*100.0)/100.0; //Distance in double

                distanceMatrix[i][j] = distance;
                distanceMatrix[j][i] = distance;
            }
        }
        int printMatrix = 1; //If we want to print diastance matrix

        if (printMatrix == 1){
            for (int i = 0; i <= NoOfCustomers; i++) {
                for (int j = 0; j <= NoOfCustomers; j++) {
                    out.print(distanceMatrix[i][j] + "  ");
                }
                out.println();
            }
        }

        //Compute the VRP Solution
        out.println("Attempting to resolve Vehicle Routing Problem (VRP) for "+NoOfCustomers+
                " Customers and "+NoOfVehicles+" Vehicles"+" with "+VehicleCap + " units of capacity\n");

        Solution s = new Solution(NoOfCustomers, NoOfVehicles, VehicleCap,request,username,ID);

        s.VRPSolution(Nodes, distanceMatrix,response);

        s.SolutionPrint("VRP Solution",request,response,distanceMatrix,username,ID);

        session.setAttribute("username", username);
        session.setAttribute("ID", ID);
        response.setHeader("Refresh", "0;url=output.jsp");  
                 
        
       }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(VRP.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(VRP.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

class Solution
{
    int NoOfVehicles;
    int NoOfCustomers;
    Vehicle[] Vehicles;
    double Cost;

    public Vehicle[] VehiclesForBestSolution;
    double BestSolutionCost;

    public ArrayList<Double> PastSolutions;
    int veh_cap=0,veh_pet=0,veh_mil=0,veh_dis=0;
    String veh_name="";
    Solution(int CustNum, int VechNum , int VechCap,HttpServletRequest request,String username,String ID)
    {
        this.NoOfVehicles = VechNum;
        this.NoOfCustomers = CustNum;
        this.Cost = 0;
        Vehicles = new Vehicle[NoOfVehicles];
        VehiclesForBestSolution =  new Vehicle[NoOfVehicles];
        PastSolutions = new ArrayList<>();
           int j;
        for (int i = 0 ; i < NoOfVehicles; i++)
        {
            j=i+1;
            veh_name = (String)request.getParameter("vehicle_name"+j);
            veh_cap = Integer.parseInt(request.getParameter("vehicle_capacity"+j));
            veh_pet = Integer.parseInt(request.getParameter("vehicle_petrol"+j));
            veh_mil = Integer.parseInt(request.getParameter("vehicle_mileage"+j));
            veh_dis =  veh_pet*veh_mil;
            
            Vehicles[i] = new Vehicle(i+1,veh_cap);
            VehiclesForBestSolution[i] = new Vehicle(i+1,veh_cap);
            
            
                try{
                    
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/vrp","root","Naval@2356");  
                
PreparedStatement ps4=con.prepareStatement("insert into "+username+"_vehicle(id,vehicle_no,vehicle_name,vehicle_capacity,petrol_content,mileage_per_litre,vehicle_distance)  values(?,?,?,?,?,?,?)");  
  
ps4.setString(1,ID); 
ps4.setString(2,Integer.toString(j));
ps4.setString(3,veh_name);
ps4.setString(4,Integer.toString(veh_cap));
ps4.setString(5,Integer.toString(veh_pet));
ps4.setString(6,Integer.toString(veh_mil));
ps4.setString(7,Integer.toString(veh_dis));  

     
int z5=ps4.executeUpdate();

if(z5>0){
//out.print("You are successfully registered...");  
} 
else{
  out.println("Error in inserting vehicle date");
}
                }catch(Exception ex){}
	
        }
    }

    public boolean UnassignedCustomerExists(Node[] Nodes)
    {
        for (int i = 1; i < Nodes.length; i++)
        {
            if (!Nodes[i].IsRouted)
                return true;
        }
        return false;
    }

    public void VRPSolution(Node[] Nodes , double[][] CostMatrix,HttpServletResponse response) throws IOException {
PrintWriter out = response.getWriter();
        double CandCost,EndCost;
        int VehIndex = 0;

        while (UnassignedCustomerExists(Nodes)) {

            int CustIndex = 0;
            Node Candidate = null;
            double minCost = (float) Double.MAX_VALUE;

            if (Vehicles[VehIndex].Route.isEmpty())
            {
                Vehicles[VehIndex].AddNode(Nodes[0]);
            }

            for (int i = 1; i <= NoOfCustomers; i++) {
                if (Nodes[i].IsRouted == false) {
                    if (Vehicles[VehIndex].CheckIfFits(Nodes[i].demand)) {
                        CandCost = CostMatrix[Vehicles[VehIndex].CurLoc][i];
                        if (minCost > CandCost) {
                            minCost = CandCost;
                            CustIndex = i;
                            Candidate = Nodes[i];
                        }
                    }
                }
            }

            if ( Candidate  == null)
            {
                //Not a single Customer Fits
                if ( VehIndex+1 < Vehicles.length ) //We have more vehicles to assign
                {
                    if (Vehicles[VehIndex].CurLoc != 0) {//End this route
                        EndCost = CostMatrix[Vehicles[VehIndex].CurLoc][0];
                        Vehicles[VehIndex].AddNode(Nodes[0]);
                        this.Cost +=  EndCost;
                    }
                    VehIndex = VehIndex+1; //Go to next Vehicle
                }
                else //We DO NOT have any more vehicle to assign. The problem is unsolved under these parameters
                {
                    out.println("\n<br>The rest customers do not fit in any Vehicle\n" +
                            "The problem cannot be resolved under these constrains<br/>");
                    break;//System.exit(0);
                }
            }
            else
            {
                Vehicles[VehIndex].AddNode(Candidate);//If a fitting Customer is Found
                Nodes[CustIndex].IsRouted = true;
                this.Cost += minCost;
            }
        }

        EndCost = CostMatrix[Vehicles[VehIndex].CurLoc][0];
        Vehicles[VehIndex].AddNode(Nodes[0]);
        this.Cost +=  EndCost;

    }

   

    public void SolutionPrint(String Solution_Label,HttpServletRequest request,HttpServletResponse response,double[][] CostMatrix,String username,String ID) throws SQLException,IOException //Print Solution In console
    {
        try{
            int veh=0;
        PrintWriter out = response.getWriter();
        out.println("<br>=========================================================</br>");
        out.println("<br>"+Solution_Label+"\n</br>");
        String sol="";
        int l,m,k;
        int cost=0;
        for (int j=0 ; j < NoOfVehicles ; j++)
        {
         sol= "";   
            if (! Vehicles[j].Route.isEmpty())
            {  out.print("<br>Vehicle " + (j+1) + ":");
                int RoutSize = Vehicles[j].Route.size();
                  for (k = 0; k < RoutSize ; k++) {
                    if(k!=0){
                        l=Vehicles[j].Route.get(k).NodeId;
                        m=Vehicles[j].Route.get(k-1).NodeId;
                        cost = (int)CostMatrix[l][m];
                        sol = sol +cost + ","; 
                    }
                    
                    if (k == RoutSize-1)
                    {   
                      veh =   Vehicles[j].Route.get(k).NodeId;
                        if(veh == 0){
                            sol = sol + (String)request.getParameter("hub_name");
                          
                        }
                        else{
                            sol = sol + (String)request.getParameter("location_name"+veh);
                          
                        }
                        //sol = sol + Vehicles[j].Route.get(k).NodeId;
                        out.print(Vehicles[j].Route.get(k).NodeId );  }
                    
                    
                    else
                    { //out.newLine();
                        
                        veh = Vehicles[j].Route.get(k).NodeId;
                        if(veh == 0){
                            sol = sol + (String)request.getParameter("hub_name")+ ",";
                          
                        }
                        else{
                            sol = sol + (String)request.getParameter("location_name"+veh) + ",";
                          
                        }
                        //sol = sol + Vehicles[j].Route.get(k).NodeId + ",";
                        out.print(Vehicles[j].Route.get(k).NodeId+ "->"); }
                }
            }else {
                sol = sol + "No Need";
                out.print("No Need");
            
            }
                out.println("<br/>");
                out.println("<br>"+sol+"</br>");
            
                
                 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/vrp","root","Naval@2356");  
PreparedStatement ps=con.prepareStatement("insert into "+username+"_solution(id,vehicle_no,vehicle_path)  values(?,?,?)");  
  
ps.setString(1,ID);  
ps.setString(2,Integer.toString(j+1));  
ps.setString(3,sol);  
          
int i=ps.executeUpdate();  
if(i>0){
//out.print("You are successfully registered...");  
} 
else{
    out.println("Error in inserting user time date");

}      
        }
        
       out.println("<br>\nSolution Cost "+this.Cost+"\n</br>");
            }catch(Exception ex){
                out.println(ex);
                        }
    }
}

class Node
{
    public int NodeId;
    public int Node_X ,Node_Y; //Node Coordinates
    public int demand; //Node Demand if Customer
    public boolean IsRouted;
    private boolean IsDepot; //True if it Depot Node

    public Node(int depot_x,int depot_y) //Cunstructor for depot
    {
        this.NodeId = 0;
        this.Node_X = depot_x;
        this.Node_Y = depot_y;
        this.IsDepot = true;
    }

    public Node(int id ,int x, int y, int demand) //Cunstructor for Customers
    {
        this.NodeId = id;
        this.Node_X = x;
        this.Node_Y = y;
        this.demand = demand;
        this.IsRouted = false;
        this.IsDepot = false;
    }
}

class Vehicle
{
    public int VehId;
    public ArrayList<Node> Route = new ArrayList<Node>();
    public int capacity;
    public int load;
    public int CurLoc;
    public boolean Closed;

    public Vehicle(int id, int cap)
    {
        this.VehId = id;
        this.capacity = cap;
        this.load = 0;
        this.CurLoc = 0; //In depot Initially
        this.Closed = false;
        this.Route.clear();
    }

    public void AddNode(Node Customer )//Add Customer to Vehicle Route
    {
        Route.add(Customer);
        this.load +=  Customer.demand;
        this.CurLoc = Customer.NodeId;
    }

    public boolean CheckIfFits(int dem) //Check if we have Capacity Violation
    {
        return ((load + dem <= capacity));
    }

}

