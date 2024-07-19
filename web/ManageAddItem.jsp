<%-- 
    Document   : ManageAddItem
    Created on : Jul 9, 2024, 4:28:08 PM
    Author     : Admin
--%>

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
                    <form action="ManageAddItemServlet">
                        <div class="mb-3">
                            <label class="form-label">Tên Món ăn</label>
                            <input type="text" class="form-control" required name="txtName">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Giá tiền</label>
                            <input type="number" class="form-control" step="0.1" name="price" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Hình ảnh(URL)</label>
                            <input type="text" class="form-control" name="txtimage">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Tên Công thức</label>
                            <input type="text" class="form-control" name="txtRecipe" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Nguyên Liệu</label>
                            <input type="text" class="form-control" name="txtIngredients" required>
                        </div>
                        <select class="form-select" name="txtType">
                            <option selected>Chọn Loại</option>
                            <option value="Food">Thức ăn</option>
                            <option value="Drink">Đồ Uống</option>
                        </select>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
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
