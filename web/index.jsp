<!--
To change this template, choose Tools | Templates
and open the template in the editor.
-->
<!DOCTYPE html>
<html>
    <head>
        <title>Welcome to Estrad's BlackBoard</title>
        <link href="styles/jquery.datepick.css" rel="stylesheet" type="text/css" media="all" />
        <script type="text/javascript" src="script/jquery-1.7.1.js"></script>
        <script type="text/javascript" src="script/jquery.validate.js"></script>
        <script type="text/javascript" src="script/jquery.datepick.js"></script>
        <link href="style.css" rel="stylesheet" type="text/css" media="screen" />
        <style>
            label.error {
                color: #FF0000;
            }
			a {
			color:#000000;
			}
        </style>
        <script type="text/javascript">
            $(document).ready(function(){
              $('#terms').hide();               
                $("#signupform").validate({
            
                    rules: {
                        fname: {
                            required: true
                        },
                        email: {
                            required: true,
                            email: true
                        },
                        verifyemail: {
                            equalTo: "#email"
                        },
                        bdate: {
                            required: true
                        },
                        terms: {
                            required: true
                        }
                    } 
                 });
                $('#bdate').datepick({dateFormat: 'yyyy-mm-dd'});
            }
        );
        </script>
    </head>

    <body id="index">
        <p align="right" style="margin-right:10%;"><a href="admin_login.html">Admin</a> login</p>
        <form action="user_login" method="post" name="signup1">
            <table width="80%" border="0" align="right" cellpadding="0px" style="margin-right:10%; border-bottom:solid; border-top:solid; border-left:solid; border-right:solid;">
                <tr>
                    <td width="162" rowspan="2"><img src="image/Estrad's Black Board - Logo small.jpg"/></td>
                    <td width="524" rowspan="2">&nbsp;</td>
                    <td width="56"><div align="right"><strong>Email</strong></div></td>
                    <td width="149" align="center"><input type="text" name="txtemail" /></td>
                    <td width="1">&nbsp;</td>
                    <td width="64"><strong>Password</strong></td>
                    <td width="144"><input type="password" name="txtpassword" /></td>
                    <td width="45" rowspan="2" valign="top"><input name="login" type="submit" value="login" /></td>
                </tr>
                <tr>
                    <td height="24" colspan="2"  align="right"><a href="">Forgot your password? </a></td>
                    <td height="24" colspan="3" align="right"><input type="checkbox" name="checkbox2" value="checkbox" />Remember me </td>
                </tr>
            </table>
        </form>

        <br/><br/><br/></br></br>

        <form id="signupform" action="user_registration" method="post" name="SIGNUP">
          <table width="35%" cellpadding="4px" border="0" align="right" style="margin-right:10%; border-bottom:solid; border-top:solid; border-left:solid; border-right:solid;">
            <tr>
              <td width="144"><strong>First Name*</strong></td>
              <td colspan="2"><input type="text" name="fname" /></td>
            </tr>
            <tr>
              <td><strong>Last Name</strong> </td>
              <td colspan="2"><input type="text" name="lname" /></td>
            </tr>
            <tr>
              <td colspan="3"><em>Password will be sent to your email ...! </em></td>
            </tr>
            <tr>
              <td><strong>Email*</strong></td>
              <td colspan="2"><input type="text" name="email" id="email"/></td>
            </tr>
            <tr>
              <td><strong>Re-enter email*</strong></td>
              <td colspan="2"><input type="text" name="verifyemail" /></td>
            </tr>
            <tr>
              <td><strong>Birth-date</strong></td>
              <td colspan="2" align="left"><input type="textfield" name="birthdate" id="bdate"></td>
            </tr>
            <tr>
              <td><strong>Gender</strong></td>
              <td colspan="2"><input name="gender" type="radio" value="male" checked="checked" />
                Male
                  <input name="gender" type="radio" value="female" />
                Female </td>
            </tr>
            <tr>
              <td><strong>Occupation</strong></td>
              <td colspan="2"><input name="occupation" type="radio" value="professional" />
                Professional
                <input name="occupation" type="radio" value="student" checked="checked" />
                Student</td>
            </tr>
            
            <tr>
              <td  align="center">&nbsp;</td>
              <td colspan="2"  align="left"><input type="checkbox" name="terms" value="checkbox" />
                Agree to <a href=""> Terms & Conditions</a> <br>
                <label id="terms" for="terms" class="error">Agree to our terms and conditions</label></td>
            </tr>
            <tr>
              <td colspan="3" align="center"><input name="reset" type="reset" value="Reset" />
                  <input type="submit" value="Submit" name="Submit" /></td>
            </tr>
          </table>
        </form>
        <div id="indexfooter">
<table background="image/bck.jpg" width="100%" border="solid 0.5px">
<td align="center">
<a href="about.html">About</a> | <a href="feedback.html">Feedback</a> | <a href="tou.html">Terms</a> | <a href="contactus.html">Contact Us</a> | <a href="faq.html">FAQ</a></td></table>
</div>
    </body>
</html>