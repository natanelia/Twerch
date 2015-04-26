<%--
  Created by IntelliJ IDEA.
  User: Natan Elia
  Date: 4/21/2015
  Time: 7:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        String appName = "Twerch";
        String[][] creator = {
                {"Elvan Owen", "images/Elvan.jpg", "13513082@std.stei.itb.ac.id", "https://www.facebook.com/elvan.owen.9", "https://twitter.com/elvanowen"},
                {"Natan", "images/Natan.jpg", "13513070@std.stei.itb.ac.id", "https://www.facebook.com/natanelia", "http://www.twitter.com/natanelia"},
                {"Vincent Sebastian Th", "images/Vincent.jpg", "13513057@std.stei.itb.ac.id", "https://www.facebook.com/vincent.s.the", "https://twitter.com/vincentsthe"}
        };
    %>
    <title><%=appName%> | Twitter Search</title>
    <meta name="viewport" content="width=device-width">
    <link href="images/favicon.ico" rel="icon" type="image/x-icon">
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/font-awesome.css"/>
    <link rel="stylesheet" href="css/main.css"/>
    <script src="js/jquery-2.1.3.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/twerch.js"></script>
</head>
<body>
<video autoplay id="bgvid" loop>
    <source src="Background.mp4" type="video/mp4">
</video>

<div id="wrap" class="container-fluid">
    <% if (request.getParameter("query") == null) { %>
        <jsp:include page="views/main.jsp"/>
    <%} else {%>
        <jsp:include page="views/result.jsp"/>
    <%}%>
</div>

<div id="about" class="footer">
    <div class="container text-center">
        <p>&copy; 2015 by proud team at <b><%=appName%>
        </b> |
            <a data-toggle="collapse" href="#collapseAbout" aria-expanded="false" aria-controls="collapseAbout">about
                us</a>
        </p>

        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-10">
                <div class="collapse" id="collapseAbout">
                    <div class="well well-lg" style="background-color:rgba(0,0,0,0.3)">
                        <h2><b><%=appName%>
                        </b> Team</h2>

                        <div class="row">
                            <%-- index 0 = nama,
                             index 1 = gambar,
                             index 2 = facebooklink --%>
                            <% for (int i = 0; i < creator.length; i++) { %>
                            <div class="col-md-<%=12/creator.length%>">
                                <div class="thumbnail" style="background-color:inherit">
                                    <img src="<%=creator[i][1]%>" width=200 height=200>

                                    <div class="caption">
                                        <p><%=creator[i][0]%>
                                        </p>
                                        <h4>
                                            <a style="color:#fff" href="mailto:<%=creator[i][2]%>" target="_blank"><i
                                                    class="glyphicon glyphicon-envelope"></i></a>&nbsp;
                                            <a style="color:#fff" href="<%=creator[i][3]%>" target="_blank"><i
                                                    class="fa fa-facebook"></i></a>&nbsp;
                                            <a style="color:#fff" href="<%=creator[i][4]%>" target="_blank"><i
                                                    class="fa fa-twitter"></i></a>
                                        </h4>
                                    </div>
                                </div>
                            </div>
                            <%}%>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-1"></div>
        </div>
    </div>
</div>
</body>
</html>
