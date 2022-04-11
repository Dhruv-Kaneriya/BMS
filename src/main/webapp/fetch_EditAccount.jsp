<%@ page import="java.sql.Connection" %>
<%@ page import="com.example.testdelete.DatabaseConnection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Arrays" %><%--
  Created by IntelliJ IDEA.
  User: juzarbharmal
  Date: 10/04/22
  Time: 6:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String acc = request.getParameter("accinput");

    try {

        String firstName;
        String balance = null;

        //Step 1. Register the Driver
        Connection conn = DatabaseConnection.initializeDatabase();

        //Step 3. Create Statement
        PreparedStatement pstmt = conn.prepareStatement("Select * from CUSTOMERS where accno=?");

        pstmt.setString(1, acc);
        ResultSet rs = pstmt.executeQuery();

        if (rs.next()) {
            firstName = rs.getString(2);
            pstmt = conn.prepareStatement("Select * from BALANCE where accno=?");
            pstmt.setString(1, acc);

            ResultSet rs2 = pstmt.executeQuery();
            if(rs2.next()){
                balance = rs2.getString(1);
            }

            out.print(firstName + ',' + balance);




        }}catch (Exception e){
        out.print(e);
    }
%>


