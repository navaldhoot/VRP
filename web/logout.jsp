<%-- 
    Document   : logout
    Created on : 16 Dec, 2018, 6:05:35 PM
    Author     : win 7
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
session.invalidate();
response.sendRedirect("login.jsp");
%>
    </body>
</html>
