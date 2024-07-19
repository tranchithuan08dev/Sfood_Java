<%-- 
    Document   : Header
    Created on : Jun 27, 2024, 10:53:32 AM
    Author     : Admin
--%>

<%@page import="dto.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container-fluid">
            <div>
                <img
                    class="logo-header"
                    src="https://cms-assets.tutsplus.com/cdn-cgi/image/width=630/uploads/users/1631/posts/32276/image/how%20to%20make%20a%20logo7.jpg"
                    alt="Adidas Logo"
                    />
                <a class="text-decoration-none text-light oswald-bold" href="Home.jsp"
                   >Shoopee Food</a
                >
            </div>

            <button
                class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent"
                aria-expanded="false"
                aria-label="Toggle navigation"
                >
                <span class="navbar-toggler-icon"></span>
            </button>
            <div>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <form action="MainController" method="POST">
                                <input type="hidden" name="action" value="welcome" />
                                <input class="nav-link active text-light raleway-medium"
                                       aria-current="page" type="submit" name="action" value="Trang chủ" />        
                            </form>
                        </li>
                        <li class="nav-item">
                            <form action="MainController" method="POST">
                                <input type="hidden" name="action" value="contactus" />
                                <input class="nav-link text-light raleway-medium" type="submit" name="action" value="Liên Hệ" />
                            </form>
                        </li>

                        <li class="nav-item dropdown">
                            <a
                                class="nav-link dropdown-toggle text-light raleway-medium"
                                href="#"
                                id="navbarDarkDropdownMenuLink"
                                role="button"
                                data-bs-toggle="dropdown"
                                aria-expanded="false"
                                >
                                Gọi món
                            </a>

                            <ul
                                class="dropdown-menu dropdown-menu-dark"
                                aria-labelledby="navbarDarkDropdownMenuLink"
                                >
                                <li>
                                    <a class="dropdown-item text-light raleway-medium" href="OrderHistory.jsp"
                                       >Xem Lịch sử mua hàng
                                    </a>
                                </li>
                                <li>
                                    <a class="dropdown-item text-light raleway-medium" href="GetAllItemServlet"
                                       >Mua hàng</a
                                    >
                                </li>
                                <li>
                                    <a class="dropdown-item raleway-medium" href="LogoutServlet"
                                       >Đăng xuất</a
                                    >
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link disabled">Disabled</a>
                        </li>
                    </ul>
                    <%
                        Account acc = (Account) session.getAttribute("LoginedUser");
                        if (acc == null) {
                    %>
                    <div class="d-flex">
                        <form action="MainController" method="POST">
                            <input  type="hidden" name="action" value="loginHome" />
                            <input class="btn btn-outline-primary raleway-medium "  type="submit" name="action" value="Đăng nhập" />
                        </form>


                        <form action="MainController" method="POST">
                            <input  type="hidden" name="action" value="registerHome" />
                            <input class="btn btn-outline-primary raleway-medium ms-3"  type="submit" name="action" value="Đăng kí" />
                        </form>
                    </div>
                    <%
                    } else {
                    %>
                    <div class="d-flex">
                        <div class=" p-3 shadow-sm">
                            <p class="h6  text-center text-primary"><%= acc.getName()%></p>
                        </div>
                    </div>

                    <%}
                    %>
                </div>
            </div>
        </div>
    </body>
</html>
