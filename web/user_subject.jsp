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
        <script type="text/javascript" src="script/jquery-1.7.1.js"></script>
        <script type="text/javascript" src="script/jquery.table.addrow.js"></script>
   <script type="text/javascript">
	    (function($){
                $(document).ready(function(){
                    $(".addRow").btnAddRow({maxRow:3});
                    $(".delRow").btnDelRow();
                });
            })(jQuery);
        </script>
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
                                <h2 class="title"><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Subjects </a></h2>
                            <div class="entry">
                                <form action="admin_subject" method="post">
                                    <table width="569" border="0" cellspacing="2" cellpadding="9px" align="center" style="border:solid; azimuth:center; ">
                                        <tr>
                                            <td colspan="4">Subjects available: </td>
                                        </tr>
                                        <tr style="border-bottom: solid;">
                                            <td width="100" ><b>No.</b> </td>
                                            <td width="173"><b>Category</b></td>
                                            <td width="159"><b>Name</b></td>
                                            <td width="99"><b>&nbsp;</b></td>
                                        </tr>
                                        <%
                                            try {
                                                Class.forName("com.mysql.jdbc.Driver");
                                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bb", "root", "root");
                                                Statement statement = con.createStatement();
                                                //            HttpSession session = request.getSession(true);
                                                //                   String email = request.getParameter("txtemail");
                                                //                 String password = request.getParameter("txtpassword");
                                                ResultSet rs = statement.executeQuery("select * from course_master");
                                                int k = 1;
                                                while (rs.next()) {
                                                    out.print("<tr><td>" + k + "</td>");
                                                    out.print("<td>" + rs.getString(2) + "</td><td>" + rs.getString(3) + "</td>");
                                                    k++;
                                                    //                          out.print("<tr><td>Posted By: "+rs.getString(4));
                                                    //                        out.print("<td>Dated : "+rs.getString(5));

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
						<h2>News</h2>
					</li>
                                        <%
                                         try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bb", "root", "root");
                Statement statement = con.createStatement();
                //            HttpSession session = request.getSession(true);
                //String email = request.getParameter("txtemail");
                //String password = request.getParameter("txtpassword");
                ResultSet rs11 = statement.executeQuery("select * from news_master");
                String title="";
                while (rs11.next()) {
                   title = title + "<br/>" + "<a href='user_news_detail.jsp?news_id=" + rs11.getString(1)   + "'>" + rs11.getString(2) + "</a>";

                }
                
                out.print("<marquee direction='down' scrolldelay='100'>" + title + "</marquee>");
                
            } catch (SQLException e) {
                out.println(e);
            } catch (ClassNotFoundException c) {
                out.println(c);
            } catch (NullPointerException n) {
                out.println(n);
            }

                                        %>
                                    
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
