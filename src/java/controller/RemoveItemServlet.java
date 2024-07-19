/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.WeekDAO;
import dto.OrderItem;
import dto.Week;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import javax.persistence.criteria.Order;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class RemoveItemServlet extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            int itemId = Integer.parseInt(request.getParameter("itemId"));
        WeekDAO w = new WeekDAO();
          
        HttpSession session = request.getSession();
        HashMap<OrderItem,Integer> cart = (HashMap<OrderItem,Integer>) session.getAttribute("cart");
        
        int week = w.RemoveWeek(itemId); // Remove item from database
        
        if (cart != null) {
            // Remove item from cart
            Iterator<OrderItem> iterator = cart.keySet().iterator();
            while (iterator.hasNext()) {
                OrderItem item = iterator.next();
                if (item.getItemId() == itemId) {
                    iterator.remove();
                }
            }
            
            if (week >= 1) {
                request.getRequestDispatcher("OrderHistory.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("Error.jsp").forward(request, response);
            }
        } else {
            request.getRequestDispatcher("ShowMenu.jsp").forward(request, response);
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
