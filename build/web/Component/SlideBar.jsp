<%-- 
    Document   : SlideBar
    Created on : Jul 9, 2024, 12:10:58 PM
    Author     : Admin
--%>

<%@page import="dto.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Slide Bar Page</title>
    </head>
    <body>
        <div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0 bgslide-bar" >
            <div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white min-vh-100">
                <a href="DashBoard.jsp" class="d-flex align-items-center pb-3 mb-md-0 me-md-auto text-white text-decoration-none">
                    <span class="fs-5 d-none d-sm-inline">Dash Board</span>
                </a>
                <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start" id="menu">
                    <li class="nav-item">
                        <a href="DashBoard.jsp" class="nav-link align-middle px-0">
                            <i class="fs-4 bi-house"></i> <span class="ms-1 d-none d-sm-inline">Home</span>
                        </a>
                    </li>
                    <li>
                        <form action="MainController" method="POST" class="d-inline">
                            <input type="hidden" name="action" value="manageuser" />
                            <button type="submit" class="btn nav-link px-0 align-middle">
                                <i class="fs-4 bi-speedometer2"></i>
                                <span class="ms-1 d-none d-sm-inline">Quản Lý Người Dùng</span>
                            </button>
                        </form>
                    </li>
                    <li>
                        <form action="MainController" method="POST" class="d-inline">
                            <input type="hidden" name="action" value="managerMenu" />
                            <button type="submit" class="btn nav-link px-0 align-middle">
                                <i class="fs-4 bi-table"></i>
                                <span class="ms-1 d-none d-sm-inline">Quản Lý Thực Đơn</span>
                            </button>
                        </form>
                    </li>
                    <li>
                        <form action="MainController" method="POST" class="d-inline">
                            <input type="hidden" name="action" value="manageAddItem" />
                            <button type="submit" class="btn nav-link px-0 align-middle">
                                <i class="fs-4 bi-plus-square"></i>
                                <span class="ms-1 d-none d-sm-inline">Thêm Thực Đơn</span>
                            </button>
                        </form>
                    </li>
                    <li>
                        <form action="MainController" method="POST" class="d-inline">
                            <input type="hidden" name="action" value="manageFeedback" />
                            <button type="submit" class="btn nav-link px-0 align-middle">
                                <i class="fs-4 bi-envelope-open"></i>
                                <span class="ms-1 d-none d-sm-inline">Xem FeedBack</span>
                            </button>
                        </form>
                    </li>
                    <li>
                        <form action="MainController" method="POST" class="d-inline">
                            <input type="hidden" name="action" value="manageOrder" />
                            <button type="submit" class="btn nav-link px-0 align-middle">
                                <i class="fs-4 bi-box-seam"></i>
                                <span class="ms-1 d-none d-sm-inline">Quản Lý Đơn Hàng</span>
                            </button>
                        </form>
                    </li>
                    <li>

                        <form action="MainController" method="POST" class="d-inline">
                            <input type="hidden" name="action" value="manageSearchOrder" />
                            <button type="submit" class="btn nav-link px-0 align-middle">
                                <i class="fs-4 bi-box-seam"></i>
                                <span class="ms-1 d-none d-sm-inline">Tìm kiếm Đơn Hàng</span>
                            </button>
                        </form>
                    </li>   
                </ul>
                <hr>

                <div class="dropdown pb-4">
                    <% Account acc = (Account) session.getAttribute("LoginedUser");
                        if (acc != null) {
                    %>
                    <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                        <img src="https://github.com/mdo.png" alt="hugenerd" width="30" height="30" class="rounded-circle">
                        <span class="d-none d-sm-inline mx-1"><%= acc.getName()%></span>
                    </a>
                    <%
                        }
                    %>
                    <ul class="dropdown-menu dropdown-menu-dark text-small shadow" aria-labelledby="dropdownUser1">
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="LogoutServlet">Đăng xuất</a></li>
                    </ul>
                </div>

            </div>
        </div>
    </body>
</html>
