<%@ page import="java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="javazoom.upload.*,java.util.*" %>
<%@ page errorPage="ExceptionHandler.jsp" %>
<%@page  import="javax.servlet.http.HttpSession" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--
Design by Free CSS Templates
http://www.freecsstemplates.org
Released for free under a Creative Commons Attribution 2.5 License

Name       : Simple World 
Description: A two-column, fixed-width design with dark color scheme.
Version    : 1.0
Released   : 20111225

-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Discussions</title>

<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<body>
  <%
if(session.getAttribute("user_id")==null )
{
out.println("<script>parent.location.href='index.jsp'</script>");

}
%>
<div id="wrapper">
	<div id="wrapper2">
		<div id="header" class="container">
			<div id="logo">
                            <img src="images/Logo.jpg" alt="logo"/>
			</div>
			<div id="menu">
				<ul>
                                        <li><a href="admin_discussion.jsp">Discussion</a></li>
					<li><a href="admin_material.jsp">Material</a></li>
					<li><a href="admin_video.jsp">Videos</a></li>
					<li><a href="admin_subject.jsp">Subjects</a></li>
                                        <li><a href="admin_news.jsp">News</a></li>
                                         <li><a href="logout">Logout</a></li>
				</ul>
			</div>
		</div>
		<!-- end #header -->
		<div id="page">
			<div id="content">
				<div class="post">
					<h2 class="title">&nbsp;</h2>
					<div class="entry">
                                            <h1>Data Invalid</h1>
					</div>
				</div>
		  </div>
			<!-- end #content -->
			<div id="sidebar">
				<ul>
					<li>
						<div id="search" >
							<form method="get" action="#">
							</form>
						</div>
						<div style="clear: both;">&nbsp;</div>
					</li>
					<li>
						<h2>&nbsp;</h2>
					</li>
					</ul>
			</div>
			<!-- end #sidebar -->
			<div style="clear: both;">&nbsp;</div>
		</div>
		<!-- end #page -->
		<div id="footer">
			<p>&nbsp;</p>
	  </div>
	</div>
</div>
<!-- end #footer -->
</body>
</html>
