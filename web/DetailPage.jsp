<%-- 
    Document   : DetailPage
    Created on : Jul 4, 2024, 5:05:57 PM
    Author     : Admin
--%>

<%@page import="dto.DescriptionDetail"%>
<%@page import="filters.ImageHashing"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./CSS/home.css" />
        <!-- Bootstrap CSS v5.2.1 -->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
            crossorigin="anonymous"
            />
    </head>
    <body>
         <!-- Heading -->
        <nav class="navbar navbar-expand-lg bg-black p-4">
            <%@include file="./Component/Header.jsp" %>
        </nav>
        <!-- Heading -->
        <!-- Conent -->
    <main>
      <!-- Item Detail -->
      <%  
         
          DescriptionDetail itemDetail = (DescriptionDetail) request.getAttribute("Detail");
      if(itemDetail != null){
          %>
      
      
        <section class="py-5">
        <div class="container px-4 px-lg-5 my-5">
          <div class="row gx-4 gx-lg-5 align-items-center">
            <div class="col-md-6">
              <img
                class="card-img-top mb-5 mb-md-0"
                src="<%= (itemDetail.getImage()) %>"
                alt="..."
              />
            </div>
            <div class="col-md-6">
              <h1 class="display-5 fw-bolder"><%= itemDetail.getDescriptionName()%></h1>
              
              <p class="lead">
                  <%= itemDetail.getDescriptionNameDetail()%>
              </p>
              
            </div>
          </div>
        </div>
      </section>
      
      
      <%
      }
      %>
    
      <!-- End Item Detail -->
    </main>
    <!-- End Content -->
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
