<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Home Page</title>

    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

</head>

<body>

<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
    <div class="container">
        <a class="navbar-brand" href="#">Welcome user: <%= request.getSession().getAttribute("username") %>
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="home.jsp">Add</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="get.do">Remove</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="gethistory.do">History</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="logout.do">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Page Content -->
<div class="container">
    <br class="row">
    <div class="col-lg-12 text-center">
        <h1 class="mt-5"></h1>
    </div>
    <br>
    <p>This is my sample application for adding, listing and removing records from local database.</p>
    <br>
    <div css="text-align:center">
        <form method="post" action="add.do">
            Name:<br>
            <input type="text" name="name">
            <br>
            Price:<br>
            <input type="number" name="price" min="0" max="1000">
            <br>
            <input type="checkbox" name="producer" checked> is Polish<br>
            <br>
            <input type="submit" value="Add" name="add" class="btn btn-info"/>
        </form>
    </div>
</div>
</div>

<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
