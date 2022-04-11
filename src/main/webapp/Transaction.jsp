<%@ page import="java.sql.Connection" %>
<%@ page import="com.example.testdelete.DatabaseConnection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: juzarbharmal
  Date: 24/03/22
  Time: 7:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%--%>
<%--    String sessionid=(String)session.getAttribute("id");--%>
<%--    if(sessionid==null||sessionid.equals("")){--%>
<%--%>--%>
<%--<jsp:forward page="index.html"/>--%>
<%--<%}%>--%>


<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>Deposit</title>
    <link rel="stylesheet" href="dashboard.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</head>

<body>
<jsp:include page="navbar.jsp"/>

<section class=" gradient-custom">
    <div class="container py-5 h-100">
        <div class="row justify-content-center align-items-center h-100">
            <div class="col-12 col-lg-9 col-xl-7">
                <div class="card shadow-2-strong card-registration" style="border-radius: 15px;">
                    <div class="card-body p-4 p-md-5">
                        <h3 class="mb-4 pb-2 pb-md-0 mb-md-5">View Transaction</h3>

                        <table class="table">
                            <thead>
                            <tr>
                                <th scope="col">Transaction From</th>
                                <th scope="col">Transaction To</th>
                                <th scope="col">Transaction Type</th>
                                <th scope="col">Transaction Amount</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                int pageNo;
                                if(request.getParameter("page") == null){
                                    pageNo = 0;
                                }else{
                                    pageNo = Integer.parseInt(request.getParameter("page"));
                                }
                                Connection conn = null;
                                try {
                                    conn = DatabaseConnection.initializeDatabase();
                                    PreparedStatement pstm=conn.prepareStatement("select * \n" +
                                            "                   from ( select a.*, rownum rnum\n" +
                                            "                            from ( Select * from TRANSACTIONS ORDER BY TRANSACTION_ID ) a\n" +
                                            "                           where rownum <= ? )\n" +
                                            "                  where rnum >= ?");

                                    pstm.setString(1,(String.valueOf(pageNo + 5) ));
                                    pstm.setString(2,(String.valueOf(pageNo + 1) ));
                                    ResultSet rs = pstm.executeQuery();
                                    while(rs.next()){
                           %>
                            <tr>
                                <th><%=rs.getString(1)%></th>
                                <td><%=rs.getString(3)%></td>
                                <td><%=rs.getString(2)%></td>
                                <td><%=rs.getString(5)%></td>
                            </tr>
                           <%
                                    }

                                } catch (SQLException | ClassNotFoundException e) {
                                    e.printStackTrace();
                                }

                            %>


                            </tbody>

                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-center">
                             <%
                                 assert conn != null;
                                 double no_page = 0;
                                 try {
                                     conn = DatabaseConnection.initializeDatabase();
                                     PreparedStatement pstm=conn.prepareStatement("select num_rows from all_tables where table_name = 'TRANSACTIONS'");
                                    ResultSet rs = pstm.executeQuery();

                                    if(rs.next()){
                                         no_page = Double.parseDouble(rs.getString(1));
                                         no_page = Math.ceil(no_page/5);
                                    }

                                    } catch (SQLException | ClassNotFoundException e) {
                                     e.printStackTrace();
                                 }

                                 for (int i=0;i<no_page;i++){
                           %>
                                    <li class="page-item"><a class="page-link" href="Transaction.jsp?page=<%=i*5%>"><%=i+1%></a></li>

                                    <%
                                 };
                             %>
                                </ul>
                            </nav>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

</body>
</html>
