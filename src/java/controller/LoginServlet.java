/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.AccountDAO;
import dto.Account;
import filters.PasswordHashing;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class LoginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            PasswordHashing ph = new PasswordHashing();
            /* TODO output your page here. You may use following sample code. */
            String email = request.getParameter("txtEmail");
            String password = request.getParameter("txtPassword");
            password = ph.doHashing(password);
            int checkRole = Integer.parseInt(request.getParameter("txtRole"));//1 2
            String role = "";
            if (email != null && password != null) {
                AccountDAO d = new AccountDAO();
                if (checkRole == 1) {
                    role = "Staff";
                } else {
                    role = "Customer";
                }
                Account acc = d.getAccount(email, password, role);
                if (acc != null) {
                    HttpSession session = request.getSession();
                    session.setAttribute("LoginedUser", acc);
                    if (role.equalsIgnoreCase("Staff")) {
                        request.getRequestDispatcher("DashBoard.jsp").forward(request, response);
                    }
                        request.getRequestDispatcher("Home.jsp").forward(request, response);
                } else {
                    String msg = "Xin lỗi vui lòng nhập lại!!!!";
                    request.setAttribute("Error", msg);
                    request.getRequestDispatcher("Login.jsp").forward(request, response);
                }
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
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
     * Handles the HTTP <code>POST</code> method.
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
