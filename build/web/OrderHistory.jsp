<%-- 
    Document   : OrderHistory
    Created on : Jul 17, 2024, 12:28:23 AM
    Author     : Admin
--%>


<%@page import="dto.OrderDetail"%>
<%@page import="java.util.ArrayList"%>
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
            <h1 class="text-center mb-4">Order History</h1>
           
               <div class="d-flex justify-content-center">
            <form action="MainController" method="POST" class="d-flex">
                <input type="hidden" name="action" value="history" />
                <select class="form-select" name="txtweek" id="txtweek">
                    <option selected>Chọn Tuần</option>
                    <option value="Week1">Tuần 1</option>
                    <option value="Week2">Tuần 2</option>
                    <option value="Week3">Tuần 3</option>
                    <option value="Week4">Tuần 4</option>
                </select>
                <button type="submit" class="btn btn-primary">Chọn</button>
            </form>
        </div>
           
            
            <table class="table table-hover table-bordered">
                <thead class="table-dark">
                    <tr>
                        <th scope="col">Thứ tự</th>
                        <th scope="col">Ngày tháng</th>
                        <th scope="col">Tên Món ăn</th>
                        <th scope="col">Giá </th>
                        <th scope="col">Ngày</th>
                        <th scope="col">Tuần</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        int row = 1;
                        ArrayList<OrderDetail> list = (ArrayList<OrderDetail>) request.getAttribute("ListHistory");
                        if (list != null) {
                            for (OrderDetail item : list) {
                    %>
                    <tr>
                        <th scope="row"><%= row%></th>
                        <td><%= item.getDate()%></td>
                        <td><%= item.getItemname()%></td>
                        <td><%= item.getPrice()%></td>
                        <td><%= item.getDayName()%></td>
                        <td><%= item.getWeek()%></td>
                    </tr>
                    <% row++;
                            }
                        }
                    %>


                </tbody>

            </table>
        </div>
        <!-- Order History END -->

       
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
