<%-- 
    Document   : FeedBack
    Created on : Jul 10, 2024, 1:16:52 PM
    Author     : Admin
--%>




<%@page import="dto.ContactUs"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
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
                                <th scope="col">Tên Khách Hàng</th>
                                <th scope="col">Email</th>
                                <th scope="col">Điện thoại</th>
                                <th scope="col">Lời Yêu cầu</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                ArrayList<ContactUs> list = ( ArrayList<ContactUs>) request.getAttribute("listFeedBack");
                                if(list != null){
                                    for(ContactUs d :  list){
                                        %>
                             <tr>
                                <th scope="row"><%= d.getFeedBackID() %></th>
                                <td><%= d.getFullName()%></td>
                                <td><%= d.getEmail()%></td>
                                <td><%= d.getPhone()%></td>
                                  <td><%= d.getRequire()%></td>
                            </tr>
                            
                            <%
                                    }
                                }
                            %>
               
                        </tbody>
                    </table>
                 
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

