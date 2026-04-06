<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.foodapp.model.Cart, com.foodapp.model.CartItem" %>

<html>
<head>
<title>Your Cart</title>

<style>
body {
    font-family: Arial;
    background:#f4f4f4;
}

/* HEADER */
.header {
    background:#fc8019;
    color:white;
    padding:15px;
    text-align:center;
    font-size:22px;
}

/* CONTAINER */
.container {
    width:70%;
    margin:30px auto;
}

/* CARD */
.card {
    display:flex;
    justify-content:space-between;
    align-items:center;
    background:white;
    padding:15px;
    margin-bottom:15px;
    border-radius:10px;
    box-shadow:0 2px 10px rgba(0,0,0,0.1);
}

/* ITEM */
.item-name {
    font-size:18px;
    font-weight:bold;
}

.price {
    color:#fc8019;
}

/* QTY */
.qty {
    display:flex;
    align-items:center;
    gap:10px;
}

.btn {
    padding:6px 12px;
    border:none;
    background:#fc8019;
    color:white;
    cursor:pointer;
    border-radius:5px;
}

/* TOTAL */
.total {
    text-align:right;
    font-size:22px;
    font-weight:bold;
    margin-top:20px;
}

/* ACTIONS */
.actions {
    display:flex;
    justify-content:space-between;
    margin-top:20px;
}

.actions a, .actions button {
    text-decoration:none;
    padding:10px 15px;
    background:#fc8019;
    color:white;
    border:none;
    border-radius:5px;
    cursor:pointer;
}

/* CLEAR BUTTON */
.clear {
    background:red;
}
</style>

</head>

<body>

<div class="header">Your Cart</div>

<div class="container">

<%
Cart cart = (Cart) session.getAttribute("cart");

if(cart == null || cart.getAllItems().isEmpty()){
%>

<h2>Your cart is empty 😔</h2>

<!-- ✅ FIXED 404 -->
<a href="restaurants">Go to Restaurants</a>

<%
} else {
%>

<%
for(CartItem item : cart.getAllItems()){
%>

<div class="card">

    <div>
        <div class="item-name"><%= item.getName() %></div>
        <div class="price">₹ <%= item.getPrice() %></div>
    </div>

    <div class="qty">

        <!-- MINUS -->
        <form action="cart" method="post">
            <input type="hidden" name="action" value="decrease">
            <input type="hidden" name="id" value="<%= item.getId() %>">
            <button class="btn">-</button>
        </form>

        <span><%= item.getQuantity() %></span>

        <!-- PLUS -->
        <form action="cart" method="post">
            <input type="hidden" name="action" value="increase">
            <input type="hidden" name="id" value="<%= item.getId() %>">
            <button class="btn">+</button>
        </form>

    </div>

</div>

<%
}
%>
 
<div class="total">
    Total: ₹ <%= cart.getTotal() %>
</div>

<div class="actions">

    <!-- ADD MORE -->
    <a href="menu?restaurantId=<%= session.getAttribute("restaurantId") %>">
        Add More Items
    </a>

    <!-- CLEAR CART -->
    <form action="cart" method="post">
        <input type="hidden" name="action" value="clear">
        <button class="clear">Clear Cart</button>
    </form>

</div>


<%
}
%>

</div>

<a href="checkout.jsp">Proceed to Checkout</a>


</body>
</html>