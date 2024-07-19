<%-- 
    Document   : DashBoard
    Created on : Jul 8, 2024, 3:47:10 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DashBoard Page</title>
           <link rel="stylesheet" href="./CSS/slidebar.css"/>
           <link rel="stylesheet" href="./CSS/dashbroad.css"/>
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
                <div class="col py-5 bg-image">
                    <div class="content text-center text-white py-5">
                        <h3 class="display-5 fw-bold text-white">
                            <i class="bi bi-person-circle"></i> Welcome Admin
                        </h3>
                        <p class="lead mt-3">
                          Sfood là trang web hàng đầu về ẩm thực, nơi bạn có thể tìm thấy mọi thông tin về các món ăn ngon và dinh dưỡng. Chúng tôi cung cấp các công thức nấu ăn chi tiết, các bài viết hướng dẫn về dinh dưỡng và sức khỏe,
                          cùng với những mẹo nhỏ để làm cho bữa ăn của bạn trở nên đặc biệt hơn.
                        </p>
                        <ul class="list-unstyled text-start mt-4">
                            <li class="mb-2">
                                <h5 class="text-success">
                                    <i class="bi bi-check-circle"></i> Công Thức Nấu Ăn
                                </h5> 
                                <p>Hàng ngàn công thức nấu ăn phong phú từ khắp nơi trên thế giới, được sắp xếp theo từng loại món ăn và dịp lễ.</p>
                            </li>
                            <li class="mb-2">
                                <h5 class="text-success">
                                    <i class="bi bi-check-circle"></i> Đặt Món Ăn
                                </h5> 
                                <p>Dịch vụ đặt món ăn trực tuyến tiện lợi, giúp bạn thưởng thức những món ăn ngon mà không cần phải ra ngoài.</p>
                            </li>
                            <li class="mb-2">
                                <h5 class="text-success">
                                    <i class="bi bi-check-circle"></i> Thực Đơn Hàng Tuần
                                </h5> 
                                <p>Gợi ý thực đơn hàng tuần giúp bạn dễ dàng lên kế hoạch bữa ăn dinh dưỡng và tiết kiệm thời gian.</p>
                            </li>
                        </ul>
                    </div>
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
