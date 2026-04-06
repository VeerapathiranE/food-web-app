<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.foodapp.model.Restaurant" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FoodApp - Restaurants</title>
    <style>
        body { margin: 0; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #f8f8f8; }
        
        /* Header */
        .header {
            background-color: #fff; padding: 10px 50px; display: flex; align-items: center; justify-content: space-between; box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .logo { font-size: 1.8em; font-weight: bold; color: #fc8019; text-decoration: none; }
        .nav { display: flex; gap: 20px; align-items: center; }
        .nav a { text-decoration: none; color: #333; font-weight: bold; }
        .nav a:hover { color: #fc8019; }
        .search-bar { padding: 6px 10px; border-radius: 20px; border: 1px solid #ccc; width: 300px; }
        .login-btn { background-color: #fc8019; color: white; border: none; padding: 6px 16px; border-radius: 20px; cursor: pointer; font-weight: bold; }
        .login-btn:hover { background-color: #e06d00; }

        /* Container */
        .container { width: 90%; margin: 30px auto; display: grid; grid-template-columns: repeat(auto-fill, minmax(280px, 1fr)); gap: 20px; }

        /* Restaurant Card */
        .restaurant-card {
            background: #fff; border-radius: 10px; overflow: hidden; box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            transition: transform 0.2s, box-shadow 0.2s;
        }
        .restaurant-card:hover { transform: scale(1.03); box-shadow: 0 5px 20px rgba(0,0,0,0.2); }
        .restaurant-image { width: 100%; height: 180px; object-fit: cover; }
        .restaurant-info { padding: 12px 15px; }
        .restaurant-name { font-size: 1.2em; font-weight: bold; margin: 0 0 5px 0; }
        .restaurant-cuisine { color: #555; font-size: 0.95em; margin-bottom: 8px; }
        .restaurant-rating {
            background-color: #48c479; color: white; padding: 3px 7px; border-radius: 5px; font-weight: bold;
            display: inline-block; font-size: 0.85em; margin-bottom: 5px;
        }
        .restaurant-delivery { font-size: 0.85em; color: #777; margin-left: 10px; }
        .restaurant-address { color: #777; font-size: 0.85em; margin-bottom: 8px; }
        .order-btn { background-color: #fc8019; color: white; border: none; padding: 6px 12px; border-radius: 20px; cursor: pointer; font-weight: bold; font-size: 0.9em; }
        .order-btn:hover { background-color: #e06d00; }

        /* Footer */
        .footer { text-align: center; padding: 15px 0; background-color: #fff; margin-top: 30px; color: #777; font-size: 0.9em; }
    </style>
</head>
<body>
    <!-- Header -->
    <div class="header">
        <a href="#" class="logo">FoodApp</a>
        <input type="text" placeholder="Search for restaurants or dishes..." class="search-bar">
        <div class="nav">
        
            <a href="cart.jsp" >Help</a>
            <a href="cart.jsp" >Cart</a>
			<a href="Login.jsp" class="login-btn">Sign in</a>
        </div>
    </div>

    <!-- Restaurant Grid -->
    <div class="container">
        <%
            List<Restaurant> restaurants = (List<Restaurant>) request.getAttribute("restaurants");
            if (restaurants != null && !restaurants.isEmpty()) {
                for (Restaurant r : restaurants) {
        %>
        
        <a href="menu?restaurantId=<%= r.getRestaurantId() %>" style="text-decoration:none; color:inherit;">
        
        <div class="restaurant-card">
            <img src="<%= r.getImageUrl() != null ? r.getImageUrl() : "images/default.jpg" %>" alt="<%= r.getName() %>" class="restaurant-image">
            <div class="restaurant-info">
                <p class="restaurant-name"><%= r.getName() %></p>
                <p class="restaurant-cuisine"><%= r.getCuisineType() %></p>
                <span class="restaurant-rating"><%= r.getRating() %> ★</span>
                <span class="restaurant-delivery"><%= r.getDeliveryTime() %> mins</span>
                <p class="restaurant-address"><%= r.getAddress() %></p>
                <button class="order-btn">Order Now</button>
            </div>
        </div>
        </a>
        <% 
                }
            } else { 
        %>
            <p>No restaurants available right now.</p>
        <% } %>
    </div>

    <!-- Footer -->
    <div class="footer">
        &copy; 2026 FoodApp. All rights reserved.
    </div>
</body>
</html>