package com.foodapp.dao;

import java.util.List;
import com.foodapp.model.Orders;

public interface OrdersDAO {

    int insertOrder(Orders order);
    boolean updateOrder(Orders order);
    boolean deleteOrder(int orderId);
    Orders getOrderById(int orderId);
    List<Orders> getAllOrders();
}