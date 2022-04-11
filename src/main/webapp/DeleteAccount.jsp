<%@ page import="com.example.testdelete.DatabaseConnection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: juzarbharmal
  Date: 11/04/22
  Time: 12:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String acc = request.getParameter("accinput");

    try {
        //Step 1. Register the Driver
        Connection conn = DatabaseConnection.initializeDatabase();

        //Step 3. Create Statement
        PreparedStatement pstmt = conn.prepareStatement("DELETE  FROM BALANCE WHERE accno=?");
        pstmt.setString(1,acc);
        ResultSet rs = pstmt.executeQuery();
        pstmt = conn.prepareStatement("DELETE FROM CUSTOMERS WHERE accno=?");
        pstmt.setString(1, acc);
        rs = pstmt.executeQuery();
        String message = "success";
        out.print(message);

       }catch (Exception e){
        out.print(e);
    }
%>


