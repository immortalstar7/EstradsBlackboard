<%@ page session="true" %>
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
<script type="text/javascript" src="script/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="script/jquery.table.addrow.js"></script>
<script type="text/javascript">
	    (function($){
                $(document).ready(function(){
                    $(".addRow").btnAddRow();
                    $(".delRow").btnDelRow();
                });
            })(jQuery);
        </script>

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
					    <h3 class="title"><a href="#">Discussion </a></h3>
					<div class="entry">
							<form action="admin_discussion" method="post">
    <table width="645" border="0" cellspacing="2" cellpadding="7px" align="center" style="border:solid">
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bb", "root", "root");
                Statement statement = con.createStatement();
                //            HttpSession session = request.getSession(true);
                String email = request.getParameter("txtemail");
                String password = request.getParameter("txtpassword");
                ResultSet rs = statement.executeQuery("select * from details_master");
                while (rs.next()) {
                    out.print("<tr><td colspan='2'>");
                    out.print("<a href='admindiscussiondetail.jsp?did=" + rs.getString(1) + "'>" + rs.getString(2) + "</a>");
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

        <tr>
            <td colspan="2" style="border-top:solid;">Add Discussions: </td>
        </tr>
        <tr>
            <td colspan="2"><p>
                    Title:
                    <input type="text" name="txttitle">
                </p>
                <textarea name="txtdetail" rows="4" cols="50"></textarea>
                <p> Posted by: Admin</p><p align="right">  <input type="button" name="Submit" value="Delete Discussion" class="delRow" /></p></td>
        </tr>
        <tr>
            <td colspan="2" align="right"><input type="button" name="Submit22" value="add another discussion" class="addRow" /></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td width="115" align="right" valign="bottom"><input type="submit" name="Submit3" value="Submit" /></td>
        </tr>
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
			<p><a href="admin_discussion.jsp">Discussion</a> | <a href="admin_material.jsp">Material</a> | <a href="admin_video.jsp">Videos</a> | <a href="admin_subject.jsp">Subjects</a> | <a href="admin_news.jsp">News</a>
			</p>
	  </div>
	</div>
</div>
<!-- end #footer -->
</body>
</html>
