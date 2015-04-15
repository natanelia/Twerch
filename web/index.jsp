<%--
  Created by IntelliJ IDEA.
  User: Natan Elia
  Date: 4/13/2015
  Time: 10:41 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        String appName="Twerch";
        String[][] creator = {
                {"Natan","images/Natan.jpg","13513070@std.stei.itb.ac.id","http://www.facebook.com/natanelia","http://www.twitter.com/natanelia"},
                {"Elvan Owen","images/Elvan.jpg","13513070@std.stei.itb.ac.id","http://www.facebook.com/elvanowen","http://www.twitter.com/elvanowen"},
                {"Vincent Sebastian Th","images/Vincent.jpg","13513070@std.stei.itb.ac.id","http://www.facebook.com/vincentth","http://www.twitter.com/vincentth"}
        };
    %>
    <title><%=appName%> | Twitter Search</title>
    <meta name="viewport" content="width=device-width">
    <link rel="stylesheet" href="styles/bootstrap.min.css" />
    <link rel="stylesheet" href="styles/font-awesome.css" />
    <link rel="stylesheet" href="styles/main.css" />
    <script src="js/jquery-2.1.3.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
<video autoplay id="bgvid" loop>
    <source src="Background.mp4" type="video/mp4">
</video>

<div id="wrap" class="container-fluid">
    <jsp:include page="views/main.jsp"/>
</div>

<div id="about" class="footer">
    <div class="container text-center">
        <p>&copy; 2015 by proud team at <b><%=appName%></b> |
            <a data-toggle="collapse" href="#collapseAbout" aria-expanded="false" aria-controls="collapseAbout">about us</a>
        </p>
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-10">
                <div class="collapse" id="collapseAbout">
                    <div class="well well-lg" style="background-color:rgba(0,0,0,0.2)">
                        <h2><b><%=appName%></b> kita keren.</h2>
                        <div class="row">
                            <%-- index 0 = nama,
                             index 1 = gambar,
                             index 2 = facebooklink --%>
                            <% for (int i=0;i<creator.length;i++) { %>
                            <div class="col-md-<%=12/creator.length%>">
                                <div class="thumbnail" style="background-color:inherit">
                                    <img src="<%=creator[i][1]%>" width=200 height=200>
                                    <div class="caption">
                                        <p><%=creator[i][0]%></p>
                                        <h4>
                                            <a style="color:#fff" href="mailto:<%=creator[i][2]%>" target="_blank"><i class="glyphicon glyphicon-envelope"></i></a>&nbsp;
                                            <a style="color:#fff" href="<%=creator[i][3]%>" target="_blank"><i class="fa fa-facebook"></i></a>&nbsp;
                                            <a style="color:#fff" href="<%=creator[i][4]%>" target="_blank"><i class="fa fa-twitter"></i></a>
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
