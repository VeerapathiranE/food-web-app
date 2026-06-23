# 🍔 Food Ordering Web Application

A full-stack Food Ordering Web Application built using Java JSP, Servlets, JDBC, and MySQL. The application allows users to browse restaurants, select food items, manage their cart, and place orders through a simple and user-friendly interface.

---

# 📖 Project Overview

Online food ordering has become an important part of daily life. This project simulates a real-world food ordering platform where users can:

* Create an account and log in
* Browse available restaurants
* View restaurant menus
* Add food items to a cart
* Manage cart quantities
* Proceed to checkout
* Place orders successfully

The application follows the DAO (Data Access Object) Design Pattern to maintain a clean separation between database operations and business logic.

---

# ✨ Features

## 👤 User Authentication

* User Registration
* User Login
* Session Management
* Secure User Access

## 🍽️ Restaurant & Menu Management

* View Available Restaurants
* Browse Restaurant Menus
* Display Food Items with Details

## 🛒 Cart Management

* Add Items to Cart
* Increase/Decrease Quantity
* Dynamic Price Calculation
* Add More Items
* Clear Cart

## 📦 Order Management

* Checkout Process
* Delivery Address Entry
* Cash on Delivery Option
* Order Confirmation Page
* Order Details Stored in Database

## 🗄️ Database Integration

* MySQL Database
* JDBC Connectivity
* CRUD Operations
* Order Persistence
* User Data Management

---

# 🛠️ Technology Stack

| Layer           | Technology         |
| --------------- | ------------------ |
| Frontend        | HTML, CSS, JSP     |
| Backend         | Java Servlets      |
| Database        | MySQL              |
| Database Access | JDBC               |
| Architecture    | DAO Design Pattern |
| Server          | Apache Tomcat      |
| IDE             | Eclipse            |

---

# 🏗️ Project Architecture

The project follows a layered architecture:

* Presentation Layer (JSP Pages)
* Controller Layer (Servlets)
* Business Logic Layer
* DAO Layer
* MySQL Database Layer

This structure improves maintainability, readability, and scalability.

---

# 🔄 Application Flow

1. User opens the application.
2. User registers or logs in.
3. User browses restaurants.
4. User selects food items.
5. User adds items to the cart.
6. User reviews the cart.
7. User proceeds to checkout.
8. User enters delivery details.
9. User places the order.
10. Order details are stored in the MySQL database.
11. Order success page is displayed.

---

# 📂 Project Structure

```text
FoodApp
│
├── src/main/java
│   ├── dao
│   ├── daoimp
│   ├── model
│   ├── servlet
│   └── util
│
├── src/main/webapp
│   ├── css
│   ├── images
│   ├── jsp
│   └── WEB-INF
│
├── Food-app.sql
│
└── README.md
```

---

# ⚙️ Database Setup

The repository includes:

```text
Food-app.sql
```

This SQL file contains the required database structure for running the application.

## Steps

1. Open MySQL Workbench.
2. Create a database.
3. Import the `Food-app.sql` file.
4. Execute the SQL script.
5. Verify that all required tables are created.

---

# ▶️ How to Run the Project

## Prerequisites

* Java JDK
* Eclipse IDE
* Apache Tomcat
* MySQL Server
* MySQL Workbench

## Setup Steps

1. Clone the repository.
2. Import the project into Eclipse.
3. Configure Apache Tomcat.
4. Import the provided SQL file into MySQL.
5. Update database credentials in the DBConnection class if required.
6. Run the project on Tomcat.
7. Open:

```text
http://localhost:8080/FoodApp
```

---

# 🎯 Learning Outcomes

Through this project, I gained practical experience in:

* Java Web Development
* JSP and Servlets
* JDBC Connectivity
* Session Management
* DAO Design Pattern
* Database Design
* Full-Stack Application Development

---

# 🚀 Future Enhancements

* Online Payment Gateway Integration
* Admin Dashboard
* Order Tracking System
* Search and Filter Functionality
* Email Notifications
* Spring Boot Migration
* REST API Development

---

# 👨‍💻 Author

Veerapathiran

Java Full Stack Developer
