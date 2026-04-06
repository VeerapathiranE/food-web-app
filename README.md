# 🍔 Food Ordering Web Application

## 📌 Overview

This is a full-stack **Food Ordering Web Application** developed using **Java (JSP & Servlets)**. The application allows users to browse food items, add them to a cart, and place orders seamlessly. It follows a clean **DAO (Data Access Object) architecture** to maintain proper separation between business logic and database operations.

---

## 🚀 Features

### 👤 User Module

* User registration and login authentication
* Session management for secure access
* Browse available food items
* Add to cart and place orders

### 🛒 Cart & Order Management

* Add/remove items from cart
* Dynamic total price calculation
* Order placement and storage in database

### 🗄️ Database Management

* Structured relational database using **MySQL**
* Tables for Users, Food Items, Orders
* Efficient CRUD operations using **JDBC**

---

## 🛠️ Tech Stack

* **Frontend:** HTML, CSS
* **Backend:** Java (JSP, Servlets)
* **Database:** MySQL
* **Architecture:** DAO Design Pattern
* **IDE:** Eclipse (Dynamic Web Project)
* **Server:** Apache Tomcat

---

## 🧩 Project Structure

```
FoodApp/
│
├── src/
│   ├── dao/               # DAO interfaces
│   ├── daoimp/            # DAO implementations
│   ├── model/             # Java Beans / Entities
|   |── servlet            # Servlets (Request handling) 
│   └── util/              # DB Connection utility
│
├── WebContent/
│   ├── css/               # Stylesheets
│   ├── images/            # Images
│   ├── jsp/               # JSP pages
│   └── index.jsp          # Entry point
│
└── web.xml                # Deployment descriptor
```

---

## ⚙️ How It Works

1. User registers and logs into the application
2. Server validates credentials using **Servlets + JDBC**
3. User browses food items (fetched from database)
4. Items added to cart (session-based tracking)
5. Order is placed and stored in database
6. Response displayed using JSP

---

## ▶️ How to Run Locally

1. Install **Apache Tomcat**
2. Import project into **Eclipse**
3. Configure Tomcat server in Eclipse
4. Run project on server
5. Open browser:

```
http://localhost:8080/FoodApp
```

---

## 💡 Highlights

* Clean **MVC-like architecture using DAO pattern**
* Efficient database interaction with JDBC
* Proper session handling for user experience
* Scalable structure for future enhancements

---

## 🔗 Future Enhancements

* Payment gateway integration
* Admin dashboard
* Search & filter functionality
* REST API integration using Spring Boot

---

## 👨‍💻 Author

**Veera Pathiran**
Aspiring Full Stack Developer

---
