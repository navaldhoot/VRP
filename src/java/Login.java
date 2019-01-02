/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.sql.Statement;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author win 7
 */
public class Login extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            /*out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Login</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Login at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
            */
               String email = request.getParameter("email");
		String pswd = request.getParameter("password");
                 boolean login = false;
                   String dbPassword,usertype;
        try {
                Class.forName("com.mysql.jdbc.Driver");  
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/vrp","root","Naval@2356");  
            Statement stmt = (Statement) con.createStatement();
      
             String query = "SELECT * FROM register Where Email='"+email+"'";
            stmt.executeQuery(query);
            ResultSet rs = stmt.getResultSet();
            
            if (rs.next() == false) {
        out.println("ResultSet in empty in Java");
      } else {
            do{
      
                dbPassword = rs.getString("Password");
                usertype = rs.getString("User_Type");
                
                if(dbPassword.equals(pswd)){
                    if(usertype.equals("Admin")){
      
                        login=true;
                        out.println("Login Successfully");
                        HttpSession session = request.getSession();
                        session.setAttribute("email", email);
                       response.setHeader("Refresh", "5;url=admin_dashboard.jsp");  
                       }
                    else{
      
                        login=true;
                        out.println("Login Successfully");
                        HttpSession session = request.getSession();
                        session.setAttribute("email", email);
                        response.setHeader("Refresh", "5;url=user_homepage.jsp");  
                 
                    }
                    
                }else{
                        login=false;
                        out.println("Login Not Successfully");
                     response.setHeader("Refresh", "5;url=login.jsp");  
                 
                    
                }
                 //response.setHeader("Refresh", "5;url=user.jsp");  

            }while(rs.next());
            }
        }catch (Exception e2) {System.out.println(e2);}  
 
  
        
            
            
            
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

}
