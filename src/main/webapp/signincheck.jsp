<%-- 
    Document   : signin
    Created on : 22 Mar, 2022, 3:39:24 PM
    Author     : Dhruv
--%>

<%@page import="java.sql.*"%>
<%@ page import="com.example.testdelete.DatabaseConnection" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SignIn Check</title>
    </head>
    <body>

        <%
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            try {

                //Step 1. Register the Driver
                Connection conn = DatabaseConnection.initializeDatabase();

                //Step 3. Create Statement
                PreparedStatement pstmt = conn.prepareStatement("Select * from USERS where user_name=? and user_password=?");
                pstmt.setString(1, username);
                pstmt.setString(2, password);

                //Step 4. Execute Query
                ResultSet rs = pstmt.executeQuery();

                if (rs.next()) {

                    session.setAttribute("id", rs.getString(1));
                    response.sendRedirect("dashboard.jsp");

                } else {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Incorrect Credentials');");
                    out.println("location='index.html';");
                    out.println("</script>");
                }
                conn.close();
            } catch (Exception e) {
             out.println(e);
            }


        %>

    </body>
</html>
