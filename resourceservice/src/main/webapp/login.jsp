<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Login Page</title>

    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

</head>

<body>

<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
    <div class="container">
        <div class="collapse navbar-collapse" id="navbarResponsive">
        </div>
    </div>
</nav>

<!-- Page Content -->
<center>
    <div width="30" align="center" class="container">

        <form align="center" method="post" action="login.do">
            <input id="login" style="margin-top: 20px; width: 30%" name="login" type="text" placeholder="Type your name here...">
            <br>
            <input id="password" style="margin-top: 20px; width: 30%" name="password" type="password" placeholder="Type your password here...">
            <div style="text-align: center"><input style="border-radius: 15px; margin-top: 20px; width: 30%; text-align: center" type="submit" value="Login"></div>
        </form>

    </div>
</center>


<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>
