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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
<%--<%--%>

<%--  String sessionid=(String)session.getAttribute("id");--%>

<%--  if(sessionid==null||sessionid.equals("")){--%>
<%--%>--%>
<%--<jsp:forward page="index.html"/>--%>
<%--<%}%>--%>

<jsp:include page="navbar.jsp" />

<section class=" gradient-custom">
  <div class="container py-5 h-100">
    <div class="row justify-content-center align-items-center h-100">
      <div class="col-12 col-lg-9 col-xl-7">
        <div class="card shadow-2-strong card-registration" style="border-radius: 15px;">
          <div class="card-body p-4 p-md-5">
            <h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Edit Account Details</h3>

            <script src="https://kit.fontawesome.com/d97b87339f.js" crossorigin="anonymous"></script>

            <div class="search-box">
              <form style="display: flex" id="idForm" name="form"  method="post">
              <input class="search-input" id="search_btn" name="accinput" pattern="[0-9]{14,14}"  title="14-digit Account Number" type="text" placeholder="Enter Account Number" required>
              <button type="submit" class="search-btn"><i class="fas fa-search"></i></button>
              </form>
            </div>
          </div>

          <div id="display_block"  class="p-4 p-md-5" style="display: none; ">
            <div style="display: flex"> <p>Name : </p> <p id="first_name"></p></div>
           <div style="display: flex"><p>Balance Available : </p><p id="balance"></p></div>

            <button class="btn btn-primary" id="edit_btn" > Edit Account </button>
            <button class="btn btn-danger" id="delete_btn"> Delete Account </button>
          </div>
        </div>

      </div>
    </div>
  </div>
</section>
<script>

        $("#edit_btn").click(function (e){
          let search_btn = document.getElementById("search_btn");

          let acc = search_btn.value;

          window.location.href = "http://localhost:8080/Bank/CheckAccount.jsp?accinput=" + acc;


})
        $("#delete_btn").click(function (e){
          let search_btn = document.getElementById("search_btn");
          let acc = search_btn.value;
          let display_block = document.getElementById("display_block");

          $.ajax({
            type: "POST",
            url: "DeleteAccount.jsp",
            data: {'accinput' : acc}, // serializes the form's elements.
            success: function(data)
            {
              //Insert Condition If balance
              console.log(data);
              console.log(data.type)
              const dataArray = data.split(",");
              let firstName = dataArray[0];
              console.log(firstName);
              if(data === 'success'){
                console.log("hey")

              }
              if(data === "success"){
              display_block.style.display = "none";
              alert("Account Deletation Success");}
            }
          });        })

        $("#idForm").submit(function(e) {
        let first_name = document.getElementById("first_name");
        let balance_name = document.getElementById("balance");
        let display_block = document.getElementById("display_block");
        e.preventDefault(); // avoid to execute the actual submit of the form.

        var form = $(this);

        $.ajax({
        type: "POST",
        url: "fetch_EditAccount.jsp",
        data: form.serialize(), // serializes the form's elements.
        success: function(data)
        {
          const dataArray = data.split(",");
          let firstName = dataArray[0].trim();
          let balance = dataArray[1].trim();
console.log(firstName);
           if(firstName=="0")
           {
             display_block.style.display = "none";
             alert("No Account Found!");
           }
           else {
            display_block.style.display = "block";
            first_name.textContent = firstName;
            balance_name.textContent = balance;
           }
        }
        });

        });
</script>
</body>


</html>
