/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

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
 * @author Dhruv
 */
public class user_discussion extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
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
            String[] distitle = request.getParameterValues("txttitle");
            String[] disdetail = request.getParameterValues("txtdetail");
            String q;
            boolean flag;

            String tempuser_id = (String) session.getAttribute("user_id");

            Statement stu = con.createStatement();
            ResultSet rsu = stu.executeQuery("select * from registration where user_id=" + tempuser_id);
            rsu.next();

            String postedby = rsu.getString(2) + " " + rsu.getString(3);


            flag = false;
            for (int i = 0; i < distitle.length; i++) {
                if (distitle[i].compareTo("") == 0) {
                    flag = true;
                }
            }

            if (flag == true) {
                response.sendRedirect("user_validation.jsp");
            }
            for (int i = 0; i < distitle.length; i++) {
                q = "insert into details_master(discussion_title, discussion_details, discussion_postedby) VALUES ('" + distitle[i] + "','" + disdetail[i] + "','" +postedby+"')";
                statement.execute(q);
            }
            response.sendRedirect("user_insert.jsp");

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
     * Handles the HTTP
     * <code>GET</code> method.
     *
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
     * Handles the HTTP
     * <code>POST</code> method.
     *
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
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
