<%-- 
    Document   : create_account
    Created on : 22 Mar, 2022, 7:27:28 PM
    Author     : Dhruv
--%>
<%@page import="java.sql.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>

<%@page import="java.io.PrintWriter"%>

<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.example.testdelete.DatabaseConnection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Create Account</title>
</head>
<body>
<%

    String sessionid = (String) session.getAttribute("id");

    if (sessionid == null || sessionid.equals("")) {
%>
<jsp:forward page="index.html"/>
<%}%>
<%
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String aadhar = request.getParameter("aadhar");
    String mobile = request.getParameter("mobile");
    String dob = request.getParameter("dob");
    String address=request.getParameter("address");
    String gender= request.getParameter("inlineRadioOptions");
    //  SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
    //java.sql.Date date = formatter.parse(dob);
//               java.util.Date utilDate = new SimpleDateFormat("dd-MM-yyyy").parse(dob);
//                java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());

    java.sql.Date sqlDate=java.sql.Date.valueOf(dob);

    Date acdate = Calendar.getInstance().getTime();
    DateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
    String accno = dateFormat.format(acdate);
    //Parsing the given String to Date object

    try {

        //Step 1. Register the Driver
        Connection conn = DatabaseConnection.initializeDatabase();

        //Step 3. Create Statement
        PreparedStatement pstmt = conn.prepareStatement("Select * from CUSTOMERS where aadhar=?");
        pstmt.setString(1, aadhar);

        //Step 4. Execute Query
        ResultSet rs = pstmt.executeQuery();

        if (rs.next()) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Account Already Exist');");
            out.println("location='dashboard.jsp';");
            out.println("</script>");


        }
        else
        {
            pstmt=conn.prepareStatement("Insert into CUSTOMERS (accno,firstname,lastname,aadhar,mobile,dob,address,gender) values(?,?,?,?,?,?,?,?)");
            pstmt.setString(1,accno);
            pstmt.setString(2,fname);
            pstmt.setString(3,lname);
            pstmt.setString(4,aadhar);
            pstmt.setString(5,mobile);
            pstmt.setDate(6,sqlDate);

            pstmt.setString(7,address);
            pstmt.setString(8,gender);
            pstmt.executeQuery();

            pstmt=conn.prepareStatement("Insert into BALANCE (accno,balance) values(?,?)");
            pstmt.setString(1,accno);
            pstmt.setInt(2,0);
            pstmt.executeQuery();
            String str="Account Created Successfully!\\nGenerated Account Number is: ";
            String mes=str.concat(accno);
            %>

           <script>

                   alert("<%=mes%>");
               window.location.href = "http://localhost:8080/Bank/dashboard.jsp";
            </script>

<%
        }
        conn.close();
    } catch (Exception e) {
        out.println(e);

    }
%>
</body>
</html>
