/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.OrderItemDAO;
import dao.WeekDAO;
import dto.OrderItem;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class AddToCartServlet extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            int ItemId = Integer.parseInt(request.getParameter("itemid"));
            int quantity = Integer.parseInt(request.getParameter("txtquantity"));
            String nameWeek = request.getParameter("txtName");
            String descriptionWeek = request.getParameter("txtDescription");
            String day = request.getParameter("txtday");
            String week = request.getParameter("txtweek");
            String type = request.getParameter("txttype");
            
            WeekDAO w = new WeekDAO();

            OrderItemDAO d = new OrderItemDAO();
            OrderItem t = d.getItem(ItemId);

            HttpSession session = request.getSession();
            HashMap<OrderItem, Integer> cart = (HashMap<OrderItem, Integer>) session.getAttribute("cart");

            if (cart == null) {
                cart = new HashMap<>();
                cart.put(t, quantity);
            } else {
                OrderItem find = null;
                for (OrderItem tmp : cart.keySet()) {
                    if (ItemId == tmp.getItemId()) {
                        find = tmp;
                        break;
                    }
                }
                if (find != null) {
                    cart.put(find, cart.get(find) + quantity);
                } else {
                    cart.put(t, quantity);
                }
            }
            int rs = w.InsertWeek(nameWeek, day, descriptionWeek, week, type, cart);
            if (rs > 0) {
                session.setAttribute("cart", cart);
                request.getRequestDispatcher("GetAllItemServlet").forward(request, response);
            } else {
                request.getRequestDispatcher("Error.jsp").forward(request, response);
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
