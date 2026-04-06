<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Checkout</title>

<style>
body {
    font-family: Arial;
    background:#f4f4f4;
}

.header {
    background:#fc8019;
    color:white;
    padding:15px;
    text-align:center;
    font-size:22px;
}

.container {
    width:40%;
    margin:40px auto;
    background:white;
    padding:25px;
    border-radius:10px;
    box-shadow:0 2px 10px rgba(0,0,0,0.2);
}

input, select {
    width:100%;
    padding:10px;
    margin:10px 0;
    border-radius:5px;
    border:1px solid #ccc;
}

button {
    width:100%;
    padding:12px;
    background:#fc8019;
    color:white;
    border:none;
    border-radius:5px;
    font-size:16px;
    cursor:pointer;
}

button:hover {
    background:#e66a00;
}
</style>

</head>

<body>



<div class="header">Checkout</div>

<div class="container">

<%
Object user = session.getAttribute("user");
%>

<%
if(user != null){
%> 

<form action="CheckoutServlet" method="post">

    <label>Delivery Address</label>
    <input type="text" name="address" required>

    <label>Payment Method</label>
    <select name="payment">
        <option value="COD">Cash on Delivery</option>
        <option value="UPI">UPI</option>
    </select>

    <button type="submit">Place Order</button>

</form>

</div>

</body>
</html>

<%
} else {
    response.sendRedirect("Login.jsp");
}
%>