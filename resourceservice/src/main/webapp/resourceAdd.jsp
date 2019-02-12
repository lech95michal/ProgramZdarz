<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Add Video</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/simple-sidebar.css" rel="stylesheet">

</head>

<body>

<div id="wrapper" class="toggled">

    <!-- Sidebar -->
    <div id="sidebar-wrapper">
        <ul class="sidebar-nav">
            <li class="sidebar-brand">
                <a href="index.jsp">Welcome Page</a>
            </li>
            <li>
                <form method="post" action="search.do">
                    <input id="search" style="margin-top: 20px; width: 100%" name="search" type="text" placeholder="Search files">
                </form>
            </li>
            <li>
                <a href="resourceAdd.jsp">Add File</a>
            </li>
            <li>
                <a href="resource.do">Manage File</a>
            </li>
            <li>
                <a href="logout.do">Logout</a>
            </li>
        </ul>
    </div>
    <!-- /#sidebar-wrapper -->

    <!-- Page Content -->
    <div id="page-content-wrapper">
        <div class="container-fluid">
            <h1>Add new file</h1>
            <br>
            <form action="add.do" method="post" enctype="multipart/form-data">
                Select a file: <input type="file" name="file"/>
                <br>
                Description: <input type="text" name="description"/>
                <br>
                <input type="submit" value="Upload"/>
            </form>
            <br>

        </div>
    </div>
    <!-- /#page-content-wrapper -->

</div>
<!-- /#wrapper -->

<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Menu Toggle Script -->
<script>
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
</script>

</body>

</html>
