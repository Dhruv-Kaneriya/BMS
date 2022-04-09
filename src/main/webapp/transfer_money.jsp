<%@ page import="java.sql.Connection" %>
<%@ page import="com.example.testdelete.DatabaseConnection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.PreparedStatement" %><%--
  Created by IntelliJ IDEA.
  User: juzarbharmal
  Date: 24/03/22
  Time: 7:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.util.UUID" %>
<%@ page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
<head>
    <title>Transfer Amount</title>
</head>
<body>
<%
    String fromaccountno = request.getParameter("fromaccountno");
    String toaccountno=request.getParameter("toaccountno");
    String amount = request.getParameter("amount");
    String transactionType = request.getParameter("transactionType");

    try {
        int acc1=0;
        int acc2=0;
        Connection conn = DatabaseConnection.initializeDatabase();
        conn.setAutoCommit(false);
        PreparedStatement pstm=conn.prepareStatement("Select * from CUSTOMERS where accno=?");
        pstm.setString(1,fromaccountno);
     ResultSet rs=pstm.executeQuery();
        if(rs.next()){
            acc1=1;
        }
        pstm.setString(1,toaccountno);
        rs= pstm.executeQuery();
        if(rs.next()){acc2=1;}


        if(acc1==1 && acc2==1){

           pstm= conn.prepareStatement("SELECT * from BALANCE where accno=?");
           pstm.setString(1,fromaccountno);
           rs = pstm.executeQuery();
           if(rs.next()){
            if(rs.getFloat(1)>=Float.parseFloat(amount))
            {
            pstm=conn.prepareStatement("UPDATE BALANCE SET BALANCE=BALANCE+? WHERE ACCNO=?");

            pstm.setFloat(1, Float.parseFloat(amount));
            pstm.setString(2,toaccountno);
            int status1 = pstm.executeUpdate();
            pstm=conn.prepareStatement("UPDATE BALANCE SET BALANCE=BALANCE-? WHERE ACCNO=?");

            pstm.setFloat(1, Float.parseFloat(amount));
            pstm.setString(2,fromaccountno);
            int status2 = pstm.executeUpdate();
            pstm = conn.prepareStatement("Insert into TRANSACTIONS (TRANSACTION_FROM,TRANSACTION_TYPE,TRANSACTION_TO,TRANSACTION_ID,TRANSACTION_AMOUNT) values(?,?,?,?,?)");
            pstm.setString(1,fromaccountno);
            pstm.setString(2,transactionType);
            pstm.setString(3,toaccountno);
            String rand_int1 = UUID.randomUUID().toString();
            pstm.setString(4, (rand_int1));
            pstm.setFloat(5,Float.parseFloat(amount));
            pstm.executeQuery();

            if(status1 == 1 && status2==1) {
                conn.commit();

%>
<script>
    alert("Money Transferred Successfully");
    window.location.href = "http://localhost:8080/Bank/transfer.jsp";

</script>
<%
}else{
    conn.rollback();

%>
<script>alert("An Error Occurred while transferring the amount");
window.location.href = "http://localhost:8080/Bank/transfer.jsp";</script>
<%
    }
}else{
                %>
                 <script>
                alert("Insufficient Balance");
        window.location.href = "http://localhost:8080/Bank/transfer.jsp";

        </script>
           <% }
}
           }
            else
{
%>
<script>
    alert("Verify Account Numbers Again!");
    window.location.href = "http://localhost:8080/Bank/transfer.jsp";</script>

<%
        }

    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
    }
%>

</body>
</html>
