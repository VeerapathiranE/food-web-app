package com.foodapp.model;

import java.util.*;

public class Cart {

    // HashMap to store cart items
    private Map<Integer, CartItem> items;

    public Cart() {
        items = new HashMap<>();
    }

    // Add item to cart
    public void addItem(CartItem item) {
        if(items.containsKey(item.getId())) {
            // If already exists, increase quantity
            CartItem existing = items.get(item.getId());
            existing.setQuantity(existing.getQuantity() + item.getQuantity());
        } else {
            items.put(item.getId(), item);
        }
    }
    
    public Map<Integer, CartItem> getItems() {
        return items;
    }

    // Remove item from cart
    public void removeItem(int id) {
        items.remove(id);
    }

    // Update quantity
    public void updateItemQuantity(int id, int quantity) {
        if(items.containsKey(id)) {
            CartItem item = items.get(id);
            item.setQuantity(quantity);
        }
    }

    // Get all items
    public Collection<CartItem> getAllItems() {
        return items.values();
    }

    // Get total cart value
    public double getTotal() {
        double total = 0;
        for(CartItem item : items.values()) {
            total += item.getTotalPrice();
        }
        return total;
    }

    // Get item count
    public int getItemCount() {
        return items.size();
    }

    // Clear cart
    public void clear() {
        items.clear();
    }
}