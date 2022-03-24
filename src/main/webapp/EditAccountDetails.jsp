<%--
    Document   : dashboard
    Created on : 22 Mar, 2022, 4:04:30 PM
    Author     : Dhruv
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Edit Account Details</title>
  <link rel="stylesheet" href="dashboard.css">

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<style>
  .search-box {
    width: 350px;
    position: relative;
    display: flex;
    bottom: 0;
    left: 0;
    right: 0;
    margin: auto;
  }

  .search-input {
    width: 100%;
    font-family: 'Montserrat', sans-serif;
    font-size: 16px;
    padding: 15px 45px 15px 15px;
    background-color:#D3D3D3;
    color: #6c6c6c;
    border-radius: 6px;
    border:none;
    transition: all .4s;
  }

  .search-input:focus {
    border:none;
    outline:none;
    box-shadow: 0 1px 12px #b8c6db;
    -moz-box-shadow: 0 1px 12px #b8c6db;
    -webkit-box-shadow: 0 1px 12px #b8c6db;
  }

  .search-btn {
    background-color: transparent;
    font-size: 18px;
    padding: 6px 9px;
    margin-left:-45px;
    border:none;
    color: #89ABE3FF;
    transition: all .4s;
    z-index: 10;
  }

  .search-btn:hover {
    transform: scale(1.2);
    cursor: pointer;
    color: black;
  }

  .search-btn:focus {
    outline:none;
    color:black;
  }

</style>
</head>
<body>
<%

  String sessionid=(String)session.getAttribute("id");

  if(sessionid==null||sessionid.equals("")){
%>
<jsp:forward page="index.html"/>
<%}%>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid ">
    <a class="navbar-brand color-me navsizebar" href="#">Hindustan Bank</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0 nav-fill w-100">
        <li class="nav-item">
          <a class="nav-link color-me navsize" href="dashboard.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active  navsize" aria-current="page"  href="EditAccountDetails.jsp">Edit Account Details</a>
        </li>
        <li class="nav-item">
          <a class="nav-link color-me navsize" href="deposit.jsp">Deposit</a>
        </li>

        <li class="nav-item">
          <a class="nav-link color-me navsize" href="#">Withdraw</a>
        </li>
        <li class="nav-item">
          <a class="nav-link color-me navsize" href="#">View Transactions</a>
        </li>
        <li class="nav-item">
          <a class="nav-link color-me navsize" href="#">Transfer Amount</a>
        </li>
        <li class="nav-item">
          <a class="nav-link color-me navsize" href="logout.jsp">Logout</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<section class=" gradient-custom">
  <div class="container py-5 h-100">
    <div class="row justify-content-center align-items-center h-100">
      <div class="col-12 col-lg-9 col-xl-7">
        <div class="card shadow-2-strong card-registration" style="border-radius: 15px;">
          <div class="card-body p-4 p-md-5">
            <h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Edit Account Details</h3>

            <script src="https://kit.fontawesome.com/d97b87339f.js" crossorigin="anonymous"></script>

            <div class="search-box">
              <form style="display: flex" action="CheckAccount.jsp" method="post">
              <input class="search-input" name="accinput" type="text" placeholder="Enter Account Number" required>
              <button type="submit"class="search-btn"><i class="fas fa-search"></i></button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

</body>
</html>
