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
			 <%@include file="user_header.jsp" %>
		</div>
		<!-- end #header -->
		<div id="page">
			<div id="content">
				<div class="post">
					<h3 class="title">Discussion in Detail</h3>
					<div class="entry">
           <form action="admin_discussion" method="post">
                                    <table width="100%" border="0" cellspacing="2" cellpadding="7px" align="center" style="border:solid">
                                        <%
                                            try {
                                                Class.forName("com.mysql.jdbc.Driver");
                                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bb", "root", "root");
                                                Statement statement = con.createStatement();
                                                //            HttpSession session = request.getSession(true);

                                                String did = request.getParameter("did");
                                                ResultSet rs = statement.executeQuery("select * from details_master where discussion_id=" + did);
                                                while (rs.next()) {
                                                    out.print("<tr><td colspan='2'><b>");
                                                    out.print(rs.getString(2) + "</b></td></tr>");
                                                    out.print("<tr><td colspan='2'>");
                                                    out.print(rs.getString(3));
                                                    out.print("<tr><td width='66%'>Posted By: " + rs.getString(4));
                                                    out.print("<td>Dated : " + rs.getString(5));

                                                }
                                            } catch (SQLException e) {
                                                out.println(e);
                                            } catch (ClassNotFoundException c) {
                                                out.println(c);
                                            } catch (NullPointerException n) {
                                                out.println(n);
                                            }

                                        %>
                                    </table>
                                </form>
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
			<p><a href="about.html">About</a> | <a href="feedback.html">Feedback</a> | <a href="tou.html">Terms</a> | <a href="feedback.html">Contact Us</a> | <a href="faq.html">FAQ</a></p>		
                    <p><a href="user_discussion.jsp">Discussion</a> | <a href="user_material.jsp">Material</a> | <a href="user_video.jsp">Videos</a> | <a href="user_subject.jsp">Subjects</a> | <a href="user_news.jsp">News</a>
			</p>
	  </div>
	</div>
</div>
<!-- end #footer -->
</body>
</html>
