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
                                        <tr>
                                            <td colspan="4" style="border-top:solid;">Add Subjects </td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td><select name="drpcategory">
                                                    <option value="1">Operating Systems</option>
                                                    <option value="2">Parellel Processing</option>
                                                    <option value="3">Distributed Systems</option>
                                                    <option value="4">SOC</option>
                                                    <option value="5">CN</option>
                                                    <option value="6">Sp</option>
                                                </select>    </td>
                                            <td><input type="text" name="txtsubject"></td>
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
