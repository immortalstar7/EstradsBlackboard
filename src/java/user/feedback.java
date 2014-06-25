/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Dhruv
 */
public class feedback extends HttpServlet {

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
            String user_id = (String) session.getAttribute("user_id");
            String feed_subject = request.getParameter("feed_subject");
            String feed_findus = request.getParameter("feed_findus");
            String feed_often = request.getParameter("feed_often");
            String feed_navigation = request.getParameter("feed_navigation");
            String feed_contentquality = request.getParameter("feed_contentquality");
            String feed_favourite = request.getParameter("feed_favourite");
            String feed_other = request.getParameter("feed_other");
            
            int i = statement.executeUpdate("INSERT INTO feedback "
                        + "(user_id,feed_subject,feed_findus,feed_often,feed_navigation,feed_contentquality,feed_favourite,feed_other)"
                        + "VALUES"
                        + "('" + user_id + "','" + feed_subject + "','" + feed_findus + "','" + feed_often + "','" + feed_navigation +"','"+ feed_contentquality +"','"+feed_favourite+ "','" + feed_other +"')");
            if(i>0)
            {
                out.println("inserted successfully");
            }
            else
            {
                out.println("failed");
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
