<%--
  Created by IntelliJ IDEA.
  User: Dhruv
  Date: 24-03-2022
  Time: 20:38
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.sql.*"%>
<%@page import="com.example.testdelete.DatabaseConnection"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Account Details</title>
</head>
<body>
<%
    String sessionid=(String)session.getAttribute("id");
    if(sessionid==null||sessionid.equals("")){
%>
<jsp:forward page="index.html"/>
<%}
    String cus_accno= request.getParameter("accno");
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String cus_aadhar = request.getParameter("aadhar");
    String mobile = request.getParameter("mobile");
    String password = request.getParameter("password");
    String dob = request.getParameter("dob");
    String address=request.getParameter("address");
    String gender= request.getParameter("inlineRadioOptions");
    //  SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
    //java.sql.Date date = formatter.parse(dob);
//               java.util.Date utilDate = new SimpleDateFormat("dd-MM-yyyy").parse(dob);
//                java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
    java.sql.Date sqlDate=java.sql.Date.valueOf(dob);
    //Parsing the given String to Date object
    try {
        //Step 1. Register the Driver
        Connection conn = DatabaseConnection.initializeDatabase();
        //Step 3. Create Statement
        PreparedStatement pstmt = conn.prepareStatement("select count(*) from CUSTOMERS where aadhar=?");
        pstmt.setString(1, cus_aadhar);
        ResultSet rs = pstmt.executeQuery();
        rs.next();
        String countaadhar=rs.getString(1);
        int aadharcount=Integer.parseInt(countaadhar);
        pstmt = conn.prepareStatement("select count(*) from CUSTOMERS where aadhar=? and accno=?");
        pstmt.setString(1, cus_aadhar);
        pstmt.setString(2, cus_accno);
        rs = pstmt.executeQuery();
        rs.next();
        String countaccno=rs.getString(1);
        int account=Integer.parseInt(countaccno);
        //Step 4. Execute Query
        if(aadharcount==0 || account==1){
            //Step 3. Create Statement
            pstmt = conn.prepareStatement("Update CUSTOMERS set firstname=?, lastname=?, aadhar=?, mobile=?, dob=?, address=?,gender=? where accno=" + cus_accno);
            pstmt.setString(1, fname);
            pstmt.setString(2, lname);
            pstmt.setString(3, cus_aadhar);
            pstmt.setString(4, mobile);
            pstmt.setDate(5, sqlDate);

            pstmt.setString(6, address);
            pstmt.setString(7, gender);
            pstmt.executeUpdate();
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Details Successfully Updated');");
            out.println("location='EditAccountDetails.jsp';");
            out.println("</script>");
        } else{
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Aadhar Number is associated with another Account!');");
            out.println("location='http://localhost:8080/Bank/CheckAccount.jsp?accinput="+cus_accno+"';");
            out.println("</script>");
        }
        conn.close();
    } catch (Exception e) {
        out.println(e);
    }
%>
</body>
</html>