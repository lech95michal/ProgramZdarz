<%@ page import="java.util.List" %>
<%@ page import="com.service.model.ClothDb" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Delete Page</title>

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
                <li class="nav-item">
                    <a class="nav-link" href="home.jsp">Add</a>
                </li>
                <li class="nav-item active">
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
    <br>

    <table>

        <%
            List<ClothDb> clothes = (List<ClothDb>) request.getAttribute("clothes");
            for (ClothDb cloth : clothes) {

        %>

        <tr>
            <td>
                <p>Id: <%=cloth.getId()%> Name: <%=cloth.getName()%> Price: <%=cloth.getPrice()%> Is Polish: <%=cloth.isPolish()%>
                <form method="post" action="delete.do">
                    <input hidden="true" name="id" type="number" value="<%=cloth.getId()%>">
                    <input type="submit" value="Delete"/>
                </form>
                </p>
            </td>
        </tr>

        <%
            }
        %>

    </table>



</div>
</div>

<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
