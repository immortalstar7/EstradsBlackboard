<%-- 
    Document   : newjsp1
    Created on : Feb 28, 2012, 8:15:29 PM
    Author     : v
--%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bb", "root", "root");
                Statement statement = con.createStatement();


                String email = request.getParameter("email");
                String txtpassword = request.getParameter("txtpassword");
                ResultSet rs = statement.executeQuery("select * from registration where user_email ='"+email+"'");
                out.print("select * from registration where user_email ='"+email+"'");
                rs.next();
                String user_password = rs.getString("user_password");
                if (txtpassword.compareTo(user_password)==0)
                {
                    Statement stmt = con.createStatement();
                    String q = "update registration set user_status = 'y' where user_email='"+email+"'";
                    stmt.executeUpdate(q);
                    response.sendRedirect("user_signup2.jsp");
                    
                } else {
                    out.println("password is not valid");
                }
            } catch (SQLException e) {
                out.println(e);
            } catch (ClassNotFoundException c) {
                out.println(c);
            } catch (NullPointerException n) {
                out.println(n);
            }
        %>
    </body>
</html>