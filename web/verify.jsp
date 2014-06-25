<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="temp.SendingEmail" %>
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.http.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <title>Verification</title>
        <style type="text/css">
            <!--
            .style2 {
                font-size: 24px;
                color: #000000;
            }
            .style3 {font-weight: bold; font-size: 36px;}
            -->
        </style>
    </head>

    <body>
        <br/><br/><br/><br/>
        <h3 align="center">Password is sent to your email</h3>
        <form action="verify2.jsp" method="post" name="email">
            <table cellpadding="4px" width="572" border="0" align="center"  style="border-bottom:solid; border-top:solid; border-left:solid; border-right:solid;">
                <tr>
                    <td colspan="3" align="center" class="style3" style="border-bottom:solid;">Check your email </td> 
                </tr>
                <tr>
                    <td width="240"><span class="style2">Enter your password : </span></td>
                    <td width="154">
                        <input type="hidden" name="email" value="<%=request.getParameter("email")%>" />
                        <input type="password" name="txtpassword" /></td>
                    <td width="156">&nbsp;</td>
                </tr>
                <tr>
                    <td height="75" colspan="3" align="center">   <input type="submit" name="Submit" value="Enter into Estrads Blackboard" /></td>
                </tr>
            </table>
        </form>
    </body>
</html>
