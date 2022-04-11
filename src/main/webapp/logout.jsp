<%--
  Created by IntelliJ IDEA.
  User: Dhruv
  Date: 23-03-2022
  Time: 21:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Logout</title>

    <SCRIPT type="text/javascript">
        window.history.forward();

    </SCRIPT>
</head>
<body>

<%

    session=request.getSession();
    session.setAttribute("id","");
    session.invalidate(); %> <!-- HERE WE ARE INVALIDATE THE SESSION, SO THAT NO VALUES WILL BE PRESENT IN SESSION -->
<jsp:forward page="index.html"/>
</body>
</html>
