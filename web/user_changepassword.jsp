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
        <title>My Profile</title>

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
            if (session.getAttribute("user_id") == null) {
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
                            <h2 class="title"><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Change Password </a></h2>
                            <div class="entry">
                                
                                <%
                                    try {
                                        Class.forName("com.mysql.jdbc.Driver");
                                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bb", "root", "root");
                                        Statement statement = con.createStatement();
                                        String user_id = (String) session.getAttribute("user_id");
                                        String current_password = request.getParameter("current");
                                        String new_password = request.getParameter("new");
                                        String q = "select * from registration where user_id='" + user_id + "' and user_password='" + current_password + "'";
                                        ResultSet rs = statement.executeQuery(q);
                                        if (rs.next()) {
                                            Statement stu = con.createStatement();
                                            q = "update registration set user_password='" + new_password + "' where user_id='" + user_id + "'";
                                            stu.executeUpdate(q);

                                            out.println("Password changed");
                                        }
                                        else{out.println("incorrect current password");}
                                    } catch (SQLException e) {
                                        out.println(e);
                                    } catch (ClassNotFoundException c) {
                                        out.println(c);
                                    } catch (NullPointerException n) {
                                        out.println(n);
                                    }

                                %>

                                <form action="user_changepassword.jsp" method="post">
                                    <table border="0" style='border:solid;' width="100%">
                                        <tr>
                                            <td colspan="2"><b>Change Password</b></td>
                                        </tr>
                                        <tr>
                                            <td>Enter Current Password</td>
                                            <td><input type="password" name="current"></input></td>
                                        </tr>
                                        <tr>
                                            <td>Enter New Password</td>
                                            <td><input type="password" name="new"></input></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2"><input type="submit" value="change"></input></td>
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
                    <p><a href="about.html">About</a> | <a href="feedback.html">Feedback</a> | <a href="tou.html">Terms</a> | <a href="feedback.html">Contact Us</a> | <a href="faq.html">FAQ</a></p>		
                    <p><a href="user_discussion.jsp">Discussion</a> | <a href="user_material.jsp">Material</a> | <a href="user_video.jsp">Videos</a> | <a href="user_subject.jsp">Subjects</a> | <a href="user_news.jsp">News</a>
                    </p>
                </div>
            </div>
        </div>
        <!-- end #footer -->
    </body>
</html>
