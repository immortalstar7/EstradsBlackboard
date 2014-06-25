<%-- 
    Document   : checksession
    Created on : Mar 5, 2012, 9:10:51 AM
    Author     : Dhruv
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@page contentType="text/html" pageEncoding="UTF-8"%>

       <%@ page language="java" import="java.sql.*"%>
<%
if(session.getAttribute("user_id")== null )
{
out.println("<script>parent.location.href='index.jsp'</script>");

}
%>
