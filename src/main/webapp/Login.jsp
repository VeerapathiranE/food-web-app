<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Login</title>

<style>

body{
    margin:0;
    font-family: Arial, Helvetica, sans-serif;
    background: linear-gradient(135deg,#4facfe,#00f2fe);
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
}

.login-container{
    background:white;
    padding:35px;
    width:350px;
    border-radius:10px;
    box-shadow:0 10px 25px rgba(0,0,0,0.2);
}

.login-container h2{
    text-align:center;
    margin-bottom:20px;
}

.message{
    text-align:center;
    color:red;
    margin-bottom:15px;
    font-weight:bold;
}

.form-group{
    margin-bottom:18px;
}

label{
    font-weight:bold;
    font-size:14px;
}

input{
    width:100%;
    padding:10px;
    margin-top:6px;
    border-radius:5px;
    border:1px solid #ccc;
}

button{
    width:100%;
    padding:12px;
    border:none;
    background:#4facfe;
    color:white;
    font-size:16px;
    border-radius:5px;
    cursor:pointer;
}

button:hover{
    background:#3a8de0;
}

.extra{
    text-align:center;
    margin-top:15px;
    font-size:14px;
}

.extra a{
    text-decoration:none;
    color:#4facfe;
}

</style>

</head>

<body>

<div class="login-container">

<h2>User Login</h2>

<%
String msg = (String)request.getAttribute("msg");
boolean blocked = false;

if(msg != null){
%>

<div class="message">
<%= msg %>
</div>

<%
if(msg.contains("Account Blocked")){
    blocked = true;
}
}

if(!blocked){
%>

<form action="callingLoginServlet" method="post">

<div class="form-group">
<label>Email</label>
<input type="email" name="useremail" required>
</div>

<div class="form-group">
<label>Password</label>
<input type="password" name="password" required>
</div>

<button type="submit">Login</button>

<div class="extra">
<p>Don't have an account? <a href="Register.html">Register</a></p>
</div>

</form>

<%
}
%>

</div>

</body>
</html>
