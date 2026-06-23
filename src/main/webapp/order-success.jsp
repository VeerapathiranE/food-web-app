<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<title>Order Success</title>

<style>
body {
    font-family: Arial;
    background:#f4f4f4;
    display:flex;
    justify-content:center;
    align-items:center;
    height:100vh;
    margin:0;
}

/* CARD */
.success-card {
    background:white;
    padding:40px;
    border-radius:12px;
    text-align:center;
    box-shadow:0 4px 15px rgba(0,0,0,0.1);
    width:400px;
}

/* ICON */
.icon {
    font-size:60px;
    color:#28a745;
}

/* TEXT */
.title {
    font-size:24px;
    font-weight:bold;
    margin-top:15px;
}

.subtitle {
    color:gray;
    margin-top:10px;
}

/* BUTTON */
.btn {
    display:inline-block;
    margin-top:25px;
    padding:12px 25px;
    background:#fc8019;
    color:white;
    text-decoration:none;
    border-radius:6px;
    font-weight:bold;
}
</style>

</head>

<body>

<div class="success-card">

    <div class="icon">✔</div>

    <div class="title">Order Placed Successfully!</div>

    <div class="subtitle">
        Thank you for your order 😊 <br>
        Your food is being prepared.
    </div>

    <a href="restaurants" class="btn">Back to Home</a>

</div>

</body>
</html>