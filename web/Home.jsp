<%-- 
    Document   : Home
    Created on : Jun 25, 2024, 2:56:06 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
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
        <!-- Content Heading -->
        <div class="content-heading">
            <h1 class="playfair-display-extraboid text-danger">
                GOOD FOOD, GOOD MOOD!
            </h1>
            <p>"Từ nhà bếp của chúng tôi đến trái tim của bạn."</p>
        </div>
        <!-- Content Heading -->
        <!-- Heading -->
        <div
            id="carouselExampleDark"
            class="carousel carousel-dark slide"
            data-bs-ride="carousel"
            >
            <div class="carousel-indicators">
                <button
                    type="button"
                    data-bs-target="#carouselExampleDark"
                    data-bs-slide-to="0"
                    class="active"
                    aria-current="true"
                    aria-label="Slide 1"
                    ></button>
                <button
                    type="button"
                    data-bs-target="#carouselExampleDark"
                    data-bs-slide-to="1"
                    aria-label="Slide 2"
                    ></button>
                <button
                    type="button"
                    data-bs-target="#carouselExampleDark"
                    data-bs-slide-to="2"
                    aria-label="Slide 3"
                    ></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active" data-bs-interval="10000">
                    <img
                        src="https://images.unsplash.com/photo-1594020292985-216a72a2c7ce?q=80&w=2081&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                        class="d-block object-fit-cover w-100"
                        alt="Gỏi cuốn"
                        />
                    <div class="carousel-caption d-none d-md-block text-light">
                        <h5>Gỏi Cuốn</h5>
                        <p>Gỏi cuốn là món ăn Việt Nam gồm tôm, thịt, rau sống, và bún, được cuộn trong bánh tráng.</p>
                    </div>
                </div>
                <div class="carousel-item" data-bs-interval="2000">
                    <img
                        src="https://images.unsplash.com/photo-1597345637412-9fd611e758f3?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                        class="d-block object-fit-cover w-100"
                        alt="Bún bò"
                        />
                    <div class="carousel-caption d-none d-md-block text-light">
                        <h5>Bún Bò</h5>
                        <p>Bún bò là món ăn đặc sản của Huế, gồm bún, thịt bò, chả, và nước dùng đậm đà hương vị.</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img
                        src="https://images.unsplash.com/photo-1582878826629-29b7ad1cdc43?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                        class="d-block object-fit-cover w-100"
                        alt="Shose"
                        />
                    <div class="carousel-caption d-none d-md-block text-light">
                        <h5>Phở Việt Nam</h5>
                        <p>Phở là món ăn truyền thống của Việt Nam, gồm bánh phở, thịt bò hoặc gà, và nước dùng thơm ngon.</p>
                    </div>
                </div>
            </div>
            <button
                class="carousel-control-prev"
                type="button"
                data-bs-target="#carouselExampleDark"
                data-bs-slide="prev"
                >
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button
                class="carousel-control-next"
                type="button"
                data-bs-target="#carouselExampleDark"
                data-bs-slide="next"
                >
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
        <!-- End-Heading -->
        <!-- View Detail -->
        <hr class="featurette-divider" />
        <div class="container marketing p-5">
            <!-- Three columns of text below the carousel -->

            <h2 class="playfair-display-extraboid text-center">Thực đơn & Món ăn</h2>
            <div class="d-flex justify-content-center mb-2">
                <form action="MainController" method="POST">
                        <input type="hidden" name="action" value="getdescription" />
                        <input type="submit" class="btn btn-primary" name="action" value="Hiện Thị Thực Đơn" />
                    </form>
                    
                </div>
            <div class="horizontal-scroll">
                

                <div class="row">       
                    <%@include  file="./Component/SuggestedDishes.jsp" %>
                </div>
                <!-- /.row -->
            </div>
            <!-- /.horizontal-scroll -->

            <!-- End View Detail -->
            <!-- Body -->
            <hr class="featurette-divider" />

            <div
                class="row featurette d-flex justify-content-center align-items-center"
                >
                <div class="col-md-7 order-md-2">
                    <h2 class="featurette-heading">
                        Bước vào Thế Giới Ẩm Thực.
                        <span class="text-muted">Khám Phá Sự Khác Biệt.</span>
                    </h2>
                    <p class="lead">
                        Tìm kiếm chiếc Bánh mì hoàn hảo? Đừng tìm đâu xa. Bộ sưu tập của
                        chúng tôi bao gồm những xu hướng mới nhất và những hương vị cổ điển
                        bất hủ, đảm bảo bạn luôn được thưởng thức những hương vị tuyệt vời
                        nhất. Từ nhân thịt heo thơm ngon đến rau thơm tươi mát và dưa chua
                        giòn rụm, chúng tôi có mọi thứ phù hợp cho mọi khẩu vị. Khám phá bộ
                        sưu tập của chúng tôi ngay hôm nay và cảm nhận sự khác biệt.
                    </p>
                </div>
                <div class="col-md-5 order-md-1">
                    <img
                        class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto"
                        width="500"
                        height="500"
                        src="https://images.pexels.com/photos/1483768/pexels-photo-1483768.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
                        alt="Placeholder: 500x500"
                        />
                </div>
            </div>
            <hr class="featurette-divider" />
            <!-- End Body -->
            <!-- Đồ Uống -->

            <h2 class="text-center">Thực đơn đồ uống</h2>
            
            <div class="d-flex justify-content-center mb-2">
                   
                <form action="MainController" method="POST">
                        <input type="hidden" name="action" value="showdrink"  />
                        <input type="submit" class="btn btn-primary" name="action" value="Hiện Thị Đồ Uống" />
                    </form>
                </div>
            <%@include file="./Component/ItemsDrink.jsp" %>


            <!--END  Đồ Uống -->

            <!-- Giới Thiệu Món Phở -->
            <hr class="featurette-divider" />

            <div
                class="row featurette d-flex justify-content-center align-items-center"
                >
                <div class="col-md-7">
                    <h2 class="featurette-heading">
                        Phở <span class="text-muted">Hương vị tinh túy.</span>
                    </h2>
                    <p class="lead">
                        Phở, món ăn quốc hồn quốc túy của Việt Nam, là sự hòa quyện hoàn hảo
                        giữa hương vị đậm đà của nước dùng, sự mềm mại của bánh phở và hương
                        thơm tươi mát từ các loại rau thơm. Đây là một trải nghiệm ẩm thực
                        tuyệt vời, mang đậm dấu ấn văn hóa Việt, được yêu thích khắp nơi
                        trên thế giới.
                    </p>
                </div>
                <div class="col-md-5">
                    <img
                        class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto"
                        width="500"
                        height="500"
                        src="https://images.pexels.com/photos/6646034/pexels-photo-6646034.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
                        alt="Placeholder: 500x500"
                        />
                </div>
            </div>


            <!-- End Giới Thiệu Phở -->
            <hr class="featurette-divider" />
            <!-- Thưc ăn -->
            <h2 class="playfair-display-extraboid text-center">Thực đơn món ăn</h2>
           
            
            <div class="d-flex justify-content-center mb-2">
                    
                
                <form action="MainController" method="POST">
                        <input type="hidden" name="action" value="showfood"  />
                        <input type="submit" class="btn btn-primary" name="action" value="Hiện Thị Đồ Ăn" />
                    </form>
                </div>

            <form action="GetAllItemServlet">  
                <input type="submit"  class="btn btn-danger" value=">>Mua Hàng>>"/>
            </form>
            <%@include file="./Component/ItemsFood.jsp" %>
            <!-- End Thức ăn -->
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
