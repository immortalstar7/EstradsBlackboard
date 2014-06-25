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
        <title>News</title>

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
                            <h2 class="title"><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; News </a></h2>
                            <div class="entry">
                                <form action="admin_news" method="post">
                                    <table width="569" border="0" cellspacing="2" cellpadding="9px" align="center" style="border:solid; azimuth:center; ">
                                        <tr>
                                            <td colspan="4">  </td>
                                        </tr>
                                        <tr style="border-bottom: solid;">
                                            <td width="100" ><b>No.</b> </td>
                                            <td width="173"><b>Title</b></td>
                                            <td width="159"><b>Date</b></td>
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
                                                String news_id = request.getParameter("news_id");
                                                Statement st1 = con.createStatement();

                                                String q1 = "delete from news_master where news_id= " + news_id;
                                                st1.executeUpdate(q1);


                                                ResultSet rs = statement.executeQuery("select * from news_master");


                                                int k = 1;
                                                while (rs.next()) {
                                                    out.print("<tr><td>" + k + "</td>");
                                                    out.print("<td>" + rs.getString(2) + "</td><td>" + rs.getString(3) + "</td>");
                                                    k++;

                                                    //                                                                   out.print("<tr><td>Posted By: "+rs.getString(4));
                                                    out.print("<td><a href='admin_news.jsp?news_id=" + rs.getString("news_id") + "'>Delete</a>");

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
                                            <td colspan="4" style="border-top:solid;">Add News </td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td  valign="top">News title<br/><input type="text" name="news_title"></input>    </td>
                                            <td  valign="top">News Details<br/><textarea name="news_details"></textarea></td>
                                            <td><input type="button" name="Submit" value="Delete Subject" class="delRow"/></td>
                                        </tr>
                                        <tr>
                                            <td colspan="4" align="right"><input class="addRow" type="button" name="Submit2" value="Add Another Subject" /></td>
                                        </tr>
                                        <tr>
                                            <td colspan="4" align="right"><input type="submit" name="Submit23" value="Submit" /></td>
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
