<%-- 
    Document   : ItemsDrinks
    Created on : Jun 27, 2024, 2:30:10 PM
    Author     : Admin
--%>

<%@page import="filters.ImageHashing"%>
<%@page import="dao.OrderItemDAO"%>
<%@page import="dto.OrderItem"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      

      <div class="row gap-4">
          
          <%     
              
            ArrayList<OrderItem> listDrink = (ArrayList<OrderItem>) request.getAttribute("ListDrink");             
          if(listDrink != null){
              for(OrderItem d: listDrink){
              %>
          
          <div class="col-md-4 card card-item" style="width: 18rem">
          <img
            src="<%= d.getImage() %>"
            class="card-img-top"
            alt="..."
            style="object-fit: cover; height: 200px;"
          />
          <div class="card-body">
              <h5 class="card-title"><%= d.getItemName() %></h5>
            <p class="card-text">
             Price:$<%= d.getPrice() %>
            </p>
                <div class="d-flex gap-2 align-items-center">
                           
                            <a class="btn btn-secondary" href="GetRecipeItemServlet?itemId=<%= d.getItemId()%>">View details &raquo;</a>
                        </div>
          </div>
        </div>
             
              
          <%
              }
              }
  
          %>
        
        
        
      </div>

    </body>
</html>
