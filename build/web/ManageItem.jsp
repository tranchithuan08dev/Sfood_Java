<%-- 
    Document   : ManageItem
    Created on : Jul 9, 2024, 1:05:25 PM
    Author     : Admin
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dto.OrderItem"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Item Page</title>
        <link rel="stylesheet" href="./CSS/slidebar.css"/>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
            crossorigin="anonymous"
            />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    </head>
    <body>
        <div class="container-fluid">

            <div class="row flex-nowrap">
                <!-- SlidesBar -->
                <%@include file="./Component/SlideBar.jsp" %>
                <!-- SlidesBar END-->


                <div class="col py-5 ">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Tên Món Ăn</th>
                                <th scope="col">Giá</th>
                                <th scope="col">Loại</th>
                                <th scope="col">Hành Động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% 
                                ArrayList<OrderItem> list = (ArrayList<OrderItem>) request.getAttribute("listItem");
                                if (list != null) {
                                    for (OrderItem d : list) {
                            %>

                            <tr>
                                <th scope="row"><%= d.getItemId()%></th>
                                <td><%= d.getItemName()%></td>
                                <td>$<%= d.getPrice()%></td>
                                <td><%= d.getType()%></td>
                                <td>
                                    <div class="d-flex">
                                        <form action="ManagerRemoveItemServlet" class="me-2">
                                            <input type="hidden" name="itemId" value="<%= d.getItemId()%>"/>
                                            <button type="submit" class="btn btn-danger" onclick="return window.confirm('Bạn có chắc chắn muốn xóa tài khoản này không?')">Remove</button>
                                        </form>

                                        <button type="submit" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#updateModal<%= d.getItemId()%>">Update</button>

                                    </div>
                                </td>

                            </tr>

                            <!-- Modal -->
                        <div class="modal fade" id="updateModal<%= d.getItemId()%>" tabindex="-1" aria-labelledby="updateModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="updateModalLabel">Update Item</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form action="ManagerUpdateItemServlet">
                                            <input type="hidden" name="itemId" value="<%= d.getItemId()%>" />
                                            <div class="mb-3">
                                                <label for="price" class="form-label">Giá tiền mới</label>
                                                <input type="number" class="form-control" name="price" step="0.1" required>
                                            </div>
                                            <button type="submit" class="btn btn-primary">Update</button>
                                        </form>

                                    </div>
                                </div>
                            </div>
                        </div>


                        <%
                                }
                            }%>
                        </tbody>
                    </table>
                    <p class="text-primary bg-light p-3">${requestScope.MessUpdate}</p>
                </div>
            </div>
        </div>


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
