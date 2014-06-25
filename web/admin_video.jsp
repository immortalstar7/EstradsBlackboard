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
                                <h2 class="title"><a href="#"> Videos </a></h2>
                            <div class="entry">
                              
                      <p align="left"><a href="admin_addvideo.jsp">Add new Video</a> </p> 
                <form method="post">
                    <%
                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bb", "root", "root");
                            Statement statement = con.createStatement();
                            Statement stfill = con.createStatement();

                            ResultSet rsfill = stfill.executeQuery("select * from course_master");
                    %>
                    <table width="70%" border="0" cellspacing="2" cellpadding="7" style="border:solid;">
                        <tr>
                            <td colspan="3"><b>Search Video</b> </td>
                        </tr>
                        <tr>
                            <td width="144">Course Name </td>
                            <td width="144"><select name="drpcategory">
                                    <%
                                        while (rsfill.next()) {
                                            out.print("<option  value = '" + rsfill.getString(1) + "'>" + rsfill.getString(3) + "</option>");
                                        }
                                    %>
                                </select>  </td>
                            <td width="56"><input type="submit" name="Submit" value="Search"></td>
                        </tr>
                    </table>
                </form>
                </br>
                <table width="100%" border="1" cellspacing="2" cellpadding="4" style="border: solid;">
                    <%                                    String drpcategory = request.getParameter("drpcategory");
                            ResultSet rs = statement.executeQuery("select * from video_master where subject_id = " + drpcategory);
                            while (rs.next()) {
                                out.print("<tr><td colspan='2'>");
                                out.print(rs.getString(2));
                                out.print("<td rowspan='2' valign='bottom'><a href='/vid/" + rs.getString("vid_file") + "'> View </a>");
                                out.print("<tr><td>Posted By :");
                                out.print(rs.getString(4));
                                out.print("<td>Dated at :" + rs.getString(5));
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
