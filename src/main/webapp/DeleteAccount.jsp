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

    String sessionid = (String) session.getAttribute("id");

    if (sessionid == null || sessionid.equals("")) {
%>
<jsp:forward page="index.html"/>
<%}%>
<%
    String acc = request.getParameter("accinput");
    String message;
    try {
        //Step 1. Register the Driver
        Connection conn = DatabaseConnection.initializeDatabase();
        PreparedStatement pstmt=conn.prepareStatement("Select * from BALANCE where accno=?");
        pstmt.setString(1,acc);
        ResultSet rs= pstmt.executeQuery();
        //Step 3. Create Statement

        if(rs.next()){
            float num=0f;
            if(Float.compare(rs.getFloat(1),num)==0) {
                pstmt=conn.prepareStatement("Delete from BALANCE where accno=?");
                pstmt.setString(1,acc);
                pstmt.executeUpdate();
                pstmt = conn.prepareStatement("DELETE FROM CUSTOMERS WHERE accno=?");
                pstmt.setString(1, acc);
                pstmt.executeUpdate();
               message = "success";
                out.print(message);
            }
            else
            {
                message="fail";
                out.print(message);
            }
        }


       }catch (Exception e){
        out.print(e);
    }
%>


