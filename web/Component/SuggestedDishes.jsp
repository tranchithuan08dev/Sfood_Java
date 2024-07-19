<%-- 
    Document   : SuggestedDishes
    Created on : Jun 27, 2024, 2:28:43 PM
    Author     : Admin
--%>

<%@page import="filters.ImageHashing"%>
<%@page import="dto.Description"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>  
       
           <% 
                
        ArrayList<Description> list = (ArrayList<Description>) request.getAttribute("ListDescriptionMenu");
        if (list != null) {
            for (Description w : list) {
        %>
        <div class="col-xl-4 text-center">
            <img class="bd-placeholder-img rounded-circle object-fit-cover"
                 width="140"
                 height="140"
                 src="<%= w.getImage()%>"
                 alt="Shoes"/>
            <h2><%= w.getDescriptionName()%></h2>
            
           <p><a class="btn btn-secondary" href="GetDescriptionDetailServlet?detailID=<%= w.getDescriptionId() %>">View details &raquo;</a></p>

        </div>
        <% 
            }
        } 
        %>
        
    </body>
</html>
