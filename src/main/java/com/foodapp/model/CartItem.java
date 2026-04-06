package com.foodapp.model;

public class CartItem {

    private int id;          // menu item id
    private String name;     // menu item name
    private double price;    // price of item
    private int quantity;    // quantity in cart

    // Constructor
    public CartItem() {}

    public CartItem(int id, String name, double price, int quantity) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
    }

    // Getters & Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    // Optional: calculate total price for this item
    public double getTotalPrice() {
        return price * quantity;
    }
}