<%-- 
    Document   : ShowMenu
    Created on : Jul 1, 2024, 3:08:15 PM
    Author     : Admin
--%>

<%@page import="filters.ImageHashing"%>
<%@page import="dto.OrderItem"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Show Menu Page</title>
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
        <%--Header--%>
        <nav class="navbar navbar-expand-lg bg-black p-4">
            <%@include file="./Component/Header.jsp" %>
        </nav>
        <%--Header END--%>

        <div class="content-heading">
            <h1 class="playfair-display-extraboid text-danger">
                Xem thực đơn
            </h1>
            <p>"Từ nhà bếp của chúng tôi đến trái tim của bạn."</p>
        </div>

        <%--Search--%>
    <div class="input-group w-75 mb-3 ms-5 d-flex justify-content-between">
    <div>
        <form action="MainController" method="POST" class="d-flex">
            <input type="hidden" name="action" value="search"  />
            <input
                type="search"
                class="form-control rounded"
                placeholder="Tìm Kiếm"
                aria-label="Search"
                name="txtsearch"
                aria-describedby="search-addon"
            />
            <button
                type="submit"
                class="btn btn-outline-primary"
                data-mdb-ripple-init
            >
                Search
            </button>
        </form>
    </div>
    <div>
       <form action="MainController" method="POST" class="d-flex">
           <input type="hidden" name="action" value="sort"  />
    <select class="form-select ms-2" aria-label="Default select" name="txtSort">
        <option selected>Sắp xếp theo giá</option>
        <option value="1">Giảm Dần</option>
        <option value="2">Tăng Dần</option>
    </select>
    <button type="submit" class="btn btn-outline-primary ms-2">sort </button>
</form>

    </div>
</div>


        <%--Search END--%>
        <%--Show MENU --%>
        <div class="container marketing p-5"> 

            <div class="row gap-4">
                <%
                    ArrayList<OrderItem> listAllItem = (ArrayList<OrderItem>) request.getAttribute("listAllItem");
                    if (listAllItem != null) {
                        for (OrderItem d : listAllItem) {%>
                <div class="col-md-4 card card-item" style="width: 18rem">
                    <img
                        src="<%= d.getImage()%>"
                        class="card-img-top"
                        alt="<%= d.getItemName()%>"  style="object-fit: cover; height: 200px;"
                        />
                    <div class="card-body">
                        <h5 class="card-title"><%= d.getItemName()%></h5>
                        <p class="card-text">
                            Price: $<%= d.getPrice()%>
                        </p>
                        <div class="d-flex gap-2 align-items-center">
                            <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModal<%= d.getItemId()%>">
                                Buy
                            </button>
                            <a class="btn btn-secondary" href="GetRecipeItemServlet?itemId=<%= d.getItemId()%>">View details &raquo;</a>
                        </div>

                    </div>
                </div>
                <%--Show Modal  --%>
                <div class="modal fade" id="exampleModal<%= d.getItemId()%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Hãy nhập thông tin </h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form action="MainController" method="POST">
                                    <input type="hidden" name="action" value="add">
                                    <input type="hidden" name="itemid" value="<%= d.getItemId()%>">
                                    <div class="mb-3">
                                        <label  class="form-label">Nhập tên tuần bạn muốn đặt hàng: </label>
                                        <input type="text" class="form-control" name="txtName" >
                                    </div>
                                    <div class="mb-3">
                                        <label  class="form-label">Miêu tả thực đơn  của bạn</label>
                                        <textarea class="form-control" rows="3" name="txtDescription"></textarea>
                                    </div>

                                    <div class="mb-3">
                                        <label  class="form-label">Số Lượng</label>
                                        <input class="form-control text-center me-3" type="number"
                                               value="1" style="max-width: 3rem" name="txtquantity"
                                               min="1" />
                                    </div>

                                    <div class="mb-3 row gx-3">
                                        <div class="col">
                                            <div class="form-check">
                                                <select class="form-select" name="txtday">
                                                    <option selected>Chọn Ngày</option>
                                                    <option value="Monday">Thứ Hai</option>
                                                    <option value="Tuesday">Thứ Ba</option>
                                                    <option value="Wednesday">Thứ Tư</option>
                                                    <option value="Thursday">Thứ Năm</option>
                                                    <option value="Friday">Thứ Sáu</option>
                                                    <option value="Saturday">Thứ Bảy</option>
                                                    <option value="Sunday">Chủ Nhật</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col">
                                            <div class="form-check" >
                                                <select class="form-select" name="txtweek">
                                                    <option selected>Chọn Tuần</option>
                                                    <option value="Week1">Tuần 1</option>
                                                    <option value="Week2">Tuần 2</option>
                                                    <option value="Week3">Tuần 3</option>
                                                    <option value="Week4">Tuần 4</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col">
                                            <div class="form-check" >
                                                <select class="form-select" name="txttype">
                                                    <option selected>Chọn Loại</option>
                                                    <option value="vegetarian">Đồ Chay</option>
                                                    <option value="vegan">Thuần Chay</option>
                                                    <option value="special dietary">Đồ ăn đặt biệt</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        <button class="btn btn-primary" type="submit">Submit</button>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>
                </div>

                <%--Show Modal END  --%> 

                <%
                        }
                    }%>


            </div>  

        </div>
        <%--Show MENU END --%>
        <div class="d-flex justify-content-center align-items-center mb-3">
            <a href="ViewOrder.jsp" class="btn btn-primary">Xem Đơn Mua Hàng</a>
        </div>

        <%--Footer--%>
        <%@include file="./Component/Footer.jsp" %>
        <%--Footer End--%>
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
