<%--
  Created by IntelliJ IDEA.
  User: juzarbharmal
  Date: 24/03/22
  Time: 7:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>

<% String uri = request.getRequestURI(); %>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid ">
        <a class="navbar-brand color-me navsizebar" href="#">Hindustan Bank</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-lg-0 nav-fill w-100">
                <li class="nav-item">
                    <a class="nav-link color-me <% if(uri.equals("/Bank/dashboard.jsp")){ %> active <% } %> navsize" aria-current="page" href="dashboard.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link color-me <% if(uri.equals("/Bank/EditAccountDetails.jsp")){ %> active <% } %> navsize" href="EditAccountDetails.jsp">Edit Account Detail</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link color-me <% if(uri.equals("/Bank/deposit.jsp")){ %> active <% } %> navsize" href="deposit.jsp">Deposit</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link color-me<% if(uri.equals("/Bank/withdraw.jsp")){ %> active <% } %> navsize" href="withdraw.jsp">Withdraw</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link color-me <% if(uri.equals("/Bank/#.jsp")){ %> active <% } %> navsize" href="#">View Transactions</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link color-me <% if(uri.equals("/Bank/#.jsp")){ %> active <% } %> navsize" href="#">Transfer Amount</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link color-me <% if(uri.equals("/Bank/#.jsp")){ %> active <% } %> navsize" href="logout.jsp">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
