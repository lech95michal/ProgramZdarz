<%@ page import="java.util.List" %>
<%@ page import="com.service.Resource" %>
<%@ page import="com.service.model.ResourceDb" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Video List</title>

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
                    <input id="search" style="margin-top: 20px; width: 100%" name="search" type="text"
                           placeholder="Search files">
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
            <h1>File Manager</h1>
            <br>
            <table>
                <%
                    List<ResourceDb> resources = (List<ResourceDb>) request.getAttribute("search");
                    if (resources.size() != 0) {
                        for (ResourceDb resource : resources) {

                %>
                <tr>
                    <td>
                        <%
                            if (resource.getTitle().contains(".mp4")) {
                        %>
                        <video width="300" height="200" controls>
                            <source src="<%=resource.getServerPath()%>" type="video/mp4">
                        </video>


                        <%
                            }
                            if (resource.getTitle().contains(".jpg") || resource.getTitle().contains(".png")) {
                        %>

                        <img src="<%=resource.getServerPath()%>" width="300" height="200">

                        <%
                            }
                            if (resource.getTitle().contains(".txt")) {
                        %>

                        <iframe src="<%=resource.getServerPath()%>" frameborder="0" width="300" height="200"></iframe>


                        <%
                            }
                            if (resource.getTitle().contains(".mp3")) {
                        %>

                        <audio controls>
                            <source src="<%=resource.getServerPath()%>" type="audio/mpeg">
                        </audio>

                        <%
                            }
                            if (resource.getTitle().contains(".zip")) {
                        %>

                        <p>This is .zip file: <%=resource.getTitle()%>
                        </p>

                        <%
                            }
                        %>
                    </td>
                    <td>
                        <p>Description: <%=resource.getDescription()%>
                        </p>
                    </td>
                    <td>
                        <form method="post" action="download.do">
                            <input hidden="true" name="path" type="text" value="<%=resource.getResourcePath()%>">
                            <input hidden="true" name="videoname" type="text" value="<%=resource.getTitle()%>">
                            <input type="submit" value="Download"/>
                        </form>
                    </td>
                    <td>
                        <form method="post" action="remove.do">
                            <input hidden="true" name="path" type="text" value="<%=resource.getResourcePath()%>">
                            <input hidden="true" name="videoname" type="text" value="<%=resource.getTitle()%>">
                            <input hidden="true" name="id" type="text" value="<%=resource.getId()%>">
                            <input type="submit" value="Delete"/>
                        </form>
                    </td>
                </tr>

                <%
                    }
                } else {

                %>

                <h3>Result list is empty.</h3>

                <%
                    }
                %>

            </table>
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
    $("#menu-toggle").click(function (e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
</script>

</body>

</html>
