/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author win 7
 */
public class Register extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. 
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Register</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Register at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");*/
                String name = request.getParameter("name");
		String email = request.getParameter("email");
		String mobile = request.getParameter("mobile");
		String pswd = request.getParameter("pswd");
                String customer_type = "Customer";
                //StandardPBEStringEncryptor encryptor = new StandardPBEStringEncryptor();
                //encryptor.setPassword(seed);
                //String encrypted= encryptor.encrypt(myIpValue);

    //   out.println("Zinda huu Mae ");        
		try{  
Class.forName("com.mysql.jdbc.Driver");  
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vrp","root","Naval@2356");  
  //out.println("Maran nhi huu Mae ");        
	
PreparedStatement ps=con.prepareStatement(  "insert into register values(?,?,?,?,?)");  
  //out.println("Hoo gaya Mae ");        
	
ps.setString(1,name);  
ps.setString(2,email);  
ps.setString(3,mobile);  
ps.setString(4,pswd);
ps.setString(5,customer_type);
          
int i=ps.executeUpdate();  
if(i>0){
out.print("You are successfully registered...");  
 //request.getRequestDispatcher("login.jsp");  
    String str= DB_Creation(response ,email, mobile);
 response.setHeader("Refresh", "5;url=login.jsp");  

}  
      
     }catch (Exception e2) {System.out.println(e2);}  
          
out.close();  
        
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
        processRequest(request, response);
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
        processRequest(request, response);
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
public String DB_Creation(HttpServletResponse response,String email,String mobile)
                throws ServletException, IOException
    {
        PrintWriter out = response.getWriter();
       
		String[] arrOfStr = email.split("@",0 ); 
                   String goodEmail = arrOfStr[0].replace(".", "");
                   
		String username= goodEmail + "_" + mobile + "_";
   		try{  
                    Class.forName("com.mysql.jdbc.Driver");  
                    Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/vrp","root","Naval@2356");  
                    Statement stmt = con.createStatement();
            
	String sql_tab = "CREATE TABLE  "+username+"_hub (sno INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,id TEXT,hub_name TEXT,x_coordinate TEXT ,y_coordinate TEXT)";
            stmt.executeUpdate(sql_tab);
                    out.println("Create Table Hub sucessfully");
 
	String sql_tab1 = "CREATE TABLE "+username+"_location (sno INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,id TEXT,location_no TEXT,location_name TEXT,location_x_coordinate TEXT,location_y_coordinate TEXT,location_demand TEXT)";
            stmt.executeUpdate(sql_tab1);
            out.println("Create Table Location sucessfully");
  
      String sql_tab2 = "CREATE TABLE "+username+"_vehicle (sno INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,id TEXT,vehicle_no TEXT,vehicle_name TEXT,vehicle_capacity TEXT,petrol_content TEXT,mileage_per_litre TEXT,vehicle_distance TEXT)";
	stmt.executeUpdate(sql_tab2);
            out.println("Create Table Vehicle sucessfully");			
          
            
           String sql_tab3 = "CREATE TABLE "+username+"_solution (sno INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,id TEXT,vehicle_no TEXT,vehicle_path TEXT)";
           stmt.executeUpdate(sql_tab3);
            out.println("Create Table Solution sucessfully");			
        
            String sql_tab4 = "CREATE TABLE "+username+"_timedate(sno INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,id TEXT,time TEXT,date TEXT)";
            stmt.executeUpdate(sql_tab4);
            out.println("Create Table TimeDate sucessfully");			
            
                }catch (Exception e2) {out.println(e2);}  
          
//out.close();  
    
    
    return username;
}   
}
