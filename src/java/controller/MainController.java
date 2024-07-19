/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class MainController extends HttpServlet {

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
            String a = request.getParameter("action");
            String url = "";
            if (a == null) {
                a = "welcome";
            }
            switch (a) {
                case "welcome":
                    url = "Home.jsp";
                    break;
                case "contactus":
                    url = "ContactUs.jsp";
                    break;
                case "loginHome":
                    url = "Login.jsp";
                    break;
                case "login":
                    url = "LoginServlet";
                    break;
                case "registerHome":
                    url = "Register.jsp";
                    break;
                case "getdescription":
                    url = "GetDescriptionMenuServlet";
                    break;
                case "showdrink":
                    url = "GetItemDrinkServlet";
                    break;
                case "showfood":
                    url = "GetItemFoodServlet";
                    break;

                case "register":
                    url = "RegisterServlet";
                    break;

                case "search":
                    url = "SearchItemSevrlet";
                    break;
                case "sort":
                    url = "SortItemServlet";
                    break;
                case "add":
                    url = "AddToCartServlet";
                    break;
                case "history":
                    url = "OrderHistoryServlet";
                    break;
                case "manageuser":
                    url = "ManageUser";
                    break;

                case "managerMenu":
                    url = "ManagerGetAllItemServlet";
                    break;
                case "manageAddItem":
                    url = "ManageAddItem.jsp";
                    break;

                case "manageFeedback":
                    url = "ManageGetAllFeedBackServlet";

                    break;
                case "manageOrder":
                    url = "ManageOrder.jsp";
                    break;
                  
                case "manageSearchOrder":
                    url = "ManageSearchOrder.jsp";
                    break;
            }
            request.getRequestDispatcher(url).forward(request, response);
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
