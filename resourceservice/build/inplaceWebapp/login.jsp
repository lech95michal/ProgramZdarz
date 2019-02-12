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
<div class="container">
    <div class="row">
        <div class="col-lg-12 text-center"></div>

        <form method="post" action="login.do">
            <input id="login" style="margin-top: 20px; width: 100%" name="login" type="text" placeholder="Type your name here...">
            <input id="password" style="margin-top: 20px; width: 100%" name="password" type="password" placeholder="Type your password here...">
            <div style="text-align: center"><input style="border-radius: 15px; margin-top: 20px; width: 100%; text-align: center" type="submit" value="Login"></div>
        </form>

    </div>
</div>

<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>


<script>

    document.getElementById('login').addEventListener('input', function () {
        validate()
    });

    document.getElementById('password').addEventListener('input', function () {
        validate()
    })

    function validate() {
        let loginField = document.getElementById('login');
        let loginValid = loginField.value.length >= 5;

        let passwordField = document.getElementById('password');
        let passwordValid = passwordField.value.length >= 5;

        if (loginValid) {
            loginField.style.color = 'black';
        } else {
            loginField.style.color = 'red';
        }

        if (passwordValid) {
            passwordField.style.color = 'black';
        } else {
            passwordField.style.color = 'red';
        }
    }

</script>

</html>
