<%-- 
    Document   : ManageUser
    Created on : Jul 9, 2024, 12:16:18 PM
    Author     : Admin
--%>

<%@page import="dto.Account"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage User Page</title>
        <link rel="stylesheet" href="./CSS/slidebar.css"/>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
            crossorigin="anonymous"
            />
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
                                <th scope="col">Họ Và Tên</th>
                                <th scope="col">Email</th>
                                <th scope="col">Số Điện Thoại</th>
                                <th scope="col">Địa Chỉ</th>
                                <th scope="col">Hành Động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% ArrayList<Account> list = (ArrayList<Account>) request.getAttribute("ListUser");
                                if (list != null) {
                                    for (Account d : list) {
                            %>

                            <tr>
                                <th scope="row"><%= d.getUserId()%></th>
                                <td><%= d.getName()%></td>
                                <td><%= d.getEmail()%></td>
                                <td><%= d.getPhone()%></td>
                                <td><%= d.getAddress()%></td>
                                <td>
                            <form action="ManageRemoveUserServlet" >
                                <input type="hidden" name="UserId" value="<%= d.getUserId() %>"/>
                                <button type="submit" class="btn btn-danger"  onclick="return window.confirm('Bạn có chắc chắn muốn xóa tài khoản này không?')">Remove</button>
                            </form>
                        </td>
                            </tr>

                            <%
              }
          }%>
                        </tbody>
                    </table>
                <p class="text-primary bg-light p-3">${requestScope.Mess}</p>
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
