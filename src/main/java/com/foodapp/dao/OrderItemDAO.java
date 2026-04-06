package com.foodapp.dao;

import java.util.List;
import com.foodapp.model.OrderItem;

public interface OrderItemDAO {

    boolean insertOrderItem(OrderItem item);
    boolean updateOrderItem(OrderItem item);
    boolean deleteOrderItem(int orderItemId);
    OrderItem getOrderItemById(int orderItemId);
    List<OrderItem> getAllOrderItems();
}