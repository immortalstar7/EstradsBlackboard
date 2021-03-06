<%@ page import="java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="javazoom.upload.*,java.util.*" %>
<%@ page errorPage="ExceptionHandler.jsp" %>
<%@page  import="javax.servlet.http.HttpSession" %>
<%@page import="java.lang.String;" %>

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
      <jsp:useBean id="upBean" scope="page" class="javazoom.upload.UploadBean" >

        <jsp:setProperty name="upBean" property="parser" value="<%= MultipartFormDataRequest.CFUPARSER%>"/>
        <jsp:setProperty name="upBean" property="parsertmpdir" value="c:/temp"/>
        <jsp:setProperty name="upBean" property="overwritepolicy" value="nametimestamp" />
    </jsp:useBean>

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
					<h2 class="title">&nbsp;</h2>
					<div class="entry">
						<form action="admin_addmaterial.jsp" method="post" name="upForm" enctype="multipart/form-data">
        
    <h3>Add Material:</h3>
                                                            <table width="100%" border="0" cellspacing="2" cellpadding="7px" align="center" style="border:solid">
           
        <%
            if (MultipartFormDataRequest.isMultipartFormData(request)) {
                // Uses MultipartFormDataRequest to parse the HTTP request.
                MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);
                String todo = null;
                if (mrequest != null) {
                    todo = mrequest.getParameter("todo");
                }
                if ((todo != null) && (todo.equalsIgnoreCase("upload"))) {
                    Hashtable files = mrequest.getFiles();
                    if ((files != null) && (!files.isEmpty())) {
                        //String sfile = "uplodfile";
                           upBean.setFolderstore("C:/Users/Dhruv/.netbeans/7.1.1/config/GF3/domain1/docroot/mat");
                          
                        UploadFile file = (UploadFile) files.get("uploadfile");
                        if (file != null) {
                            out.println("<li>Form fields : uploadfile" + "<BR> Uploaded file : " + file.getFileName() + " (" + file.getFileSize() + " bytes)" + "<BR> Content Type : " + file.getContentType());
                        }
                        // Uses the bean now to store specified by jsp:setProperty at the top.
                        upBean.store(mrequest, "uploadfile");

                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bb", "root", "root");
                            Statement statement = con.createStatement();
                            String mat_title = mrequest.getParameter("mat_title");
                            String subject_id = mrequest.getParameter("drpcategory");
                            
                              String q = "INSERT INTO material_master (mat_title,mat_file,mat_postby,subject_id) VALUES('" + mat_title + "','" + file.getFileName() + "','admin','"+ subject_id + "')";
                           // out.print(q);
                              statement.executeUpdate(q);
                        } catch (SQLException e) {
                            out.println(e);
                        } catch (ClassNotFoundException c) {
                            out.println(c);
                        } catch (NullPointerException n) {
                            out.println(n);
                        }
                    } else {
                        out.println("<li>No uploaded files");
                    }

                } else {
                    out.println("<BR> todo=" + todo);
                }
            }
        %>

            <input type="hidden" name="todo" value="upload">

            <table border="1">
                <tr>
                    <td><label>Title <br/><input type="text" name="mat_title"></input> </label></td>
                    <td><label> Select File <br/> 
                            <input type="file" name="uploadfile">
                        </label></td>
                    <td><label> Select Subject <br/>
                           <%
                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bb", "root", "root");
                            Statement stfill = con.createStatement();

                            ResultSet rsfill = stfill.executeQuery("select * from course_master");
                           out.print("<select name='drpcategory'>");
                                   
                                    while(rsfill.next()){
                                    out.print("<option  value = '" + rsfill.getString(1)+ "'>" + rsfill.getString(3)  +"</option>");
                                                                         }
                           out.print("</select>");
                           
                                                             }
                         catch (SQLException e) {
                            out.println(e);
                        } catch (ClassNotFoundException c) {
                            out.println(c);
                        } catch (NullPointerException n) {
                            out.println(n);
                        }
                    %>
                  
                        </label></td>
                   
                </tr>
                <tr>
                    <td colspan="3" align="right"><input type="submit" value="Upload"/></td>
                </tr>
            </table>   
        </form>
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
			<p><a href="admin_discussion.jsp">Discussion</a> | <a href="admin_material.jsp">Material</a> | <a href="admin_video.jsp">Videos</a> | <a href="admin_subject.jsp">Subjects</a> | <a href="admin_news.jsp">News</a></p>
	  </div>
	</div>
</div>
<!-- end #footer -->
</body>
</html>