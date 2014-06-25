/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package login;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

/**
 *
 * @author v
 */
public class user_login extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bb", "root", "root");
            Statement statement = con.createStatement();
            HttpSession session = request.getSession(true);
            String email = request.getParameter("txtemail");
            String password = request.getParameter("txtpassword");
            ResultSet rs = statement.executeQuery("select * from registration where user_email = '" + email + "'");
            if(rs.next())
            {
            String rpassword = rs.getString("user_password");
            String user_id = rs.getString("user_id");
            if (password.equals(rpassword)) {
                response.sendRedirect("user_discussion.jsp");
                session.setAttribute("user_id",user_id);
            }
            else{
                out.println("<input type='hidden' name='wrongpassword'>");
                response.sendRedirect("login.html");
            }
            }
            else
            {
                response.sendRedirect("index.jsp");
            
            }


        } catch (SQLException e) {
            out.println(e);
        } catch (ClassNotFoundException c) {
            out.println(c);
        } catch (NullPointerException n) {
            out.println(n);
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
