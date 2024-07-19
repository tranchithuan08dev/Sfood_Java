<%-- 
    Document   : ItemsFood
    Created on : Jun 27, 2024, 3:26:05 PM
    Author     : Admin
--%>

<%@page import="filters.ImageHashing"%>
<%@page import="dto.OrderItem"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.OrderItemDAO"%>
<%@page import="dao.OrderItemDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="row gap-4">
            <%

                ArrayList<OrderItem> listFood = (ArrayList<OrderItem>) request.getAttribute("ListFood");

                if (listFood != null) {
                    for (OrderItem item : listFood) {
            %>

            <div class="col-md-4 card card-item" style="width: 18rem">
                <img
                    src="<%= item.getImage()%>"
                    class="card-img-top"
                    alt="..."
                    />
                <div class="card-body">
                    <h5 class="card-title"><%= item.getItemName()%></h5>
                    <p class="card-text">
                        Price:$<%= item.getPrice()%>
                    </p>
                    <div class="d-flex gap-2 align-items-center">
                        <a class="btn btn-secondary" href="GetRecipeItemServlet?itemId=<%= item.getItemId()%>">View details &raquo;</a>
                    </div>
                </div>
            </div>   
            <%
                    }
                }
            %>      
        </div>

    </body>
</html>
