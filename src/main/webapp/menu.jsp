<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.foodapp.model.Menu" %>

<html>
<head>
<title>Menu</title>
<style>
body { font-family: Arial; background:#f8f8f8; }

.container {
    display:grid;
    grid-template-columns: repeat(auto-fill, minmax(250px,1fr));
    gap:20px;
    padding:30px;
}

.card {
    background:#fff;
    padding:15px;
    border-radius:10px;
    box-shadow:0 2px 10px rgba(0,0,0,0.1);
}

.card img {
    width:100%;
    height:150px;
    object-fit:cover;
    border-radius:8px;
}

.name { font-weight:bold; font-size:18px; }
.price { color:#fc8019; font-weight:bold; }

.btn {
    background:#fc8019;
    color:white;
    border:none;
    padding:8px;
    border-radius:5px;
    cursor:pointer;
}
</style>
</head>

<body>

<h2 style="text-align:center;">Menu Items</h2>

<div class="container">

<%
List<Menu> menus = (List<Menu>) request.getAttribute("menus");

if(menus != null && !menus.isEmpty()){
    for(Menu m : menus){
%>

<div class="card">
    <img src="<%= m.getImagePath() %>">
    <p class="name"><%= m.getItemName() %></p>
    <p><%= m.getDescription() %></p>
    <p class="price">₹ <%= m.getPrice() %></p>

    <!-- Updated form to send data to CartServlet -->
    <form action="cart" method="post">
        <input type="hidden" name="menuId" value="<%= m.getMenuId() %>">
        <input type="hidden" name="name" value="<%= m.getItemName() %>">
        <input type="hidden" name="price" value="<%= m.getPrice() %>">
        <input type="hidden" name="restaurantId" value="<%= m.getRestaurantId() %>">
        <button type="submit" class="btn">Add to Cart</button>
    </form>

</div>

<% }} else { %>
<p>No menu available</p>
<% } %>

</div>

</body>
</html>