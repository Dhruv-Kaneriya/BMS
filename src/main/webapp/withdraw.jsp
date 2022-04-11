<%--
  Created by IntelliJ IDEA.
  User: juzarbharmal
  Date: 24/03/22
  Time: 8:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String sessionid=(String)session.getAttribute("id");
    if(sessionid==null||sessionid.equals("")){
%>
<jsp:forward page="index.html"/>
<%}%>


<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>Withdraw</title>
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
                        <h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Withdraw Form</h3>

                        <form name="withdraw_form" action="withdraw_money.jsp">

                            <div class="row">
                                <div class="col-md-6 mb-4">
                                    <div class="form-outline">
                                        <label  class="form-label" for="accountno">Account Number</label>
                                        <input type="text" pattern="[0-9]{14,14}" title="14-Digit Account Number" class="form-control form-control-lg"  id="accountno" name="accountno" required autocomplete="off" />

                                    </div>
                                </div>
                                <div class="col-md-6 mb-4">
                                    <div class="form-outline">
                                        <label  class="form-label" for="amount">Amount</label>
                                        <input type="text" pattern="^[0-9]+(\.[0-9]{1,2})?$" title="Amount should be in range of 0-9 and followed by zero or more digit upto 2 decimal places" class="form-control form-control-lg"  id="amount" name="amount" required autocomplete="off" />

                                    </div>
                                </div>
                            </div>



                            <div class="mt-4 pt-2">
                                <input class="btn btn-primary btn-lg" type="submit" value="Submit" />
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

</body>
</html>

