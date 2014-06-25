<%@ page import="java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="javazoom.upload.*,java.util.*" %>
<%@ page errorPage="ExceptionHandler.jsp" %>
<%@page  import="javax.servlet.http.HttpSession" %>
<%
        String postedby;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bb", "root", "root");
        Statement statement = con.createStatement();
        String tempuser_id = (String) session.getAttribute("user_id");

        Statement stu = con.createStatement();
        ResultSet rsu = stu.executeQuery("select * from registration where user_id=" + tempuser_id);
        rsu.next();

 postedby= rsu.getString(2) + " " + rsu.getString(3);


%>
<div id="menu">
    </br><p align="right"><a href="user_profile.jsp" style="text-decoration: underline;"><%=postedby%> </a></p>
<ul>  

    <li><a href="user_discussion.jsp">Discussion</a></li>
    <li><a href="user_material.jsp">Material</a></li>
    <li><a href="user_video.jsp">Videos</a></li>
    <li><a href="user_subject.jsp">Subjects</a></li>
    <li><a href="user_news.jsp">News</a></li>
    <li><a href="logout">Logout</a></li>
</ul>
</div>
<%

    } catch (SQLException e) {
        out.println(e);
    } catch (ClassNotFoundException c) {
        out.println(c);
    } catch (NullPointerException n) {
        out.println(n);
    }
%>