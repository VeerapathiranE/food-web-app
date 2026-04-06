<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.foodapp.model.Cart, com.foodapp.model.CartItem" %>
<html>
<head>
    <title>Session Cart Viewer</title>
    <style>
        body { font-family: Arial; background:#f8f8f8; padding:30px; }
        table { border-collapse: collapse; width: 60%; margin: auto; background:#fff; }
        th, td { border: 1px solid #ccc; padding: 10px; text-align: center; }
        th { background: #fc8019; color: white; }
        h2 { text-align:center; }
    </style>
</head>
<body>

<h2>Current Session Cart</h2>

<%
    // Get cart from session
    Cart cart = (Cart) session.getAttribute("cart");

    if(cart != null && !cart.getAllItems().isEmpty()) {
%>
    <table>
        <tr>
            <th>Menu ID</th>
            <th>Item Name</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Total</th>
        </tr>
        <%
            for(CartItem item : cart.getAllItems()) {
        %>
        <tr>
            <td><%= item.getId() %></td>
            <td><%= item.getName() %></td>
            <td>₹ <%= item.getPrice() %></td>
            <td><%= item.getQuantity() %></td>
            <td>₹ <%= item.getTotalPrice() %></td>
        </tr>
        <% } %>
        <tr>
            <td colspan="4" style="text-align:right; font-weight:bold;">Grand Total</td>
            <td>₹ <%= cart.getTotal() %></td>
        </tr>
    </table>
<% 
    } else { 
%>
    <p style="text-align:center;">Cart is empty</p>
<% } %>

</body>
</html>