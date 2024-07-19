<%-- 
    Document   : OrderHistory
    Created on : Jul 4, 2024, 1:17:30 PM
    Author     : Admin
--%>

<%@page import="java.util.HashMap"%>
<%@page import="dto.OrderItem"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Order History</title>
        <link rel="stylesheet" href="./CSS/home.css" />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Oswald:wght@700&display=swap"
            rel="stylesheet"
            />
        <link
            href="https://fonts.googleapis.com/css2?family=Oswald:wght@666&family=Raleway:wght@500&display=swap"
            rel="stylesheet"
            />
        <link
            href="https://fonts.googleapis.com/css2?family=Oswald:wght@666&family=Playfair+Display:wght@800&family=Raleway:wght@500&display=swap"
            rel="stylesheet"
            />
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
            crossorigin="anonymous"
            />
    </head>
    <body>
        <!-- Heading -->
        <nav class="navbar navbar-expand-lg bg-black p-4">
            <%@include file="./Component/Header.jsp" %>
        </nav>
        <!-- Heading -->
        <!-- Order History -->
        <div class="container my-5">
            <h1 class="text-center mb-4">View Order</h1>

            <table class="table table-hover table-bordered">
                <thead class="table-dark">
                    <tr>
                        <th scope="col">Thứ tự</th>
                        <th scope="col">Tên Món ăn</th>
                        <th scope="col">Số Lượng</th>
                        <th scope="col">Giá tiền</th>
                         <th scope="col">Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        HashMap<OrderItem, Integer> cart = (HashMap) session.getAttribute("cart");
                        if (cart != null) {
                            int orderNumber = 1;
                            float totalPrice = 0;
                            for (OrderItem item : cart.keySet()) {
                                int quantity = cart.get(item);
                                float totalItemPrice = quantity * item.getPrice();
                                totalPrice += totalItemPrice;
                    %>
                    <tr>
                        <th scope="row"><%= orderNumber%></th>
                        <td><%= item.getItemName()%></td>
                        <td><%= quantity%></td>
                        <td><%= totalItemPrice%></td>
                        <td>
                            <form action="RemoveItemServlet" >
                                <input type="hidden" name="itemId" value="<%= item.getItemId()%>"/>
                                <button type="submit" class="btn btn-danger">Remove</button>
                            </form>
                        </td>
                    </tr>
                    <%
                            orderNumber++;
                        }
                    %>
                    <tr>
                        <th scope="row" colspan="3" class="text-end">Tổng Cộng</th>
                        <td><%= totalPrice%></td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>

            </table>
        </div>
        <!-- Order History END -->
        
           <div class="d-flex justify-content-center align-items-center mb-3">
             <a href="SaveOrderServlet" class="btn btn-primary">Lưu đơn hàng</a>
        </div>
        <!-- Footer -->
        <hr class="featurette-divider" />
        <%@include file="./Component/Footer.jsp" %>
        <!-- End Footer -->

        <script
            src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
            integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
            crossorigin="anonymous"
        ></script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"
        ></script>
    </body>
</html>
