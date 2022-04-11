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

    String sessionid = (String) session.getAttribute("id");

    if (sessionid == null || sessionid.equals("")) {
%>
<jsp:forward page="index.html"/>
<%}%>
<%
    String acc = request.getParameter("accinput");

    try {

        String Name;
        String balance = null;

        //Step 1. Register the Driver
        Connection conn = DatabaseConnection.initializeDatabase();

        //Step 3. Create Statement
        PreparedStatement pstmt = conn.prepareStatement("Select * from CUSTOMERS where accno=?");

        pstmt.setString(1, acc);
        ResultSet rs = pstmt.executeQuery();

        if (rs.next()) {
            Name = rs.getString(2)+" "+rs.getString(3);
            pstmt = conn.prepareStatement("Select * from BALANCE where accno=?");
            pstmt.setString(1, acc);

            ResultSet rs2 = pstmt.executeQuery();
            if(rs2.next()){
                balance = rs2.getString(1);
            }
            out.print(Name + ',' + balance);
        }
       else{
            Name="0";
            balance="0";
            out.print(Name + ',' + balance);
        }
    }catch (Exception e){
        out.print(e);
    }
%>


