package com.foodapp.daoimpl;

import java.sql.*;
import java.util.*;

import com.foodapp.dao.OrdersDAO;
import com.foodapp.model.Orders;
import com.foodapp.util.DBConnection;

public class OrdersDAOImpl implements OrdersDAO {

    @Override
    public int insertOrder(Orders order) {

        int orderId = 0;

        String sql = "INSERT INTO orders(user_Id, restaurant_Id, order_Date, total_Amount, status, payment_Mode) VALUES(?,?,?,?,?,?)";

        try(Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setInt(1, order.getUserId());
            ps.setInt(2, order.getRestaurantId());
            ps.setTimestamp(3, order.getOrderDate());
            ps.setDouble(4, order.getTotalAmount());
            ps.setString(5, order.getStatus());
            ps.setString(6, order.getPaymentMode());

            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                orderId = rs.getInt(1);
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return orderId;
    }
    
    @Override
    public Orders getOrderById(int orderId) {

        String sql = "SELECT * FROM orders WHERE orderId=?";
        Orders order = null;

        try(Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                order = new Orders();

                order.setOrderId(rs.getInt("orderId"));
                order.setUserId(rs.getInt("userId"));
                order.setRestaurantId(rs.getInt("restaurantId"));
                order.setOrderDate(rs.getTimestamp("orderDate"));
                order.setTotalAmount(rs.getDouble("totalAmount"));
                order.setStatus(rs.getString("status"));
                order.setPaymentMode(rs.getString("paymentMode"));
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return order;
    }

    @Override
    public List<Orders> getAllOrders() {

        List<Orders> list = new ArrayList<>();
        String sql = "SELECT * FROM orders";

        try(Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery()) {

            while(rs.next()) {

                Orders order = new Orders();

                order.setOrderId(rs.getInt("orderId"));
                order.setUserId(rs.getInt("userId"));
                order.setRestaurantId(rs.getInt("restaurantId"));
                order.setOrderDate(rs.getTimestamp("orderDate"));
                order.setTotalAmount(rs.getDouble("totalAmount"));
                order.setStatus(rs.getString("status"));
                order.setPaymentMode(rs.getString("paymentMode"));

                list.add(order);
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public boolean updateOrder(Orders order) {

        String sql = "UPDATE orders SET status=?, totalAmount=? WHERE orderId=?";

        try(Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, order.getStatus());
            ps.setDouble(2, order.getTotalAmount());
            ps.setInt(3, order.getOrderId());

            return ps.executeUpdate() > 0;

        } catch(Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public boolean deleteOrder(int orderId) {

        String sql = "DELETE FROM orders WHERE orderId=?";

        try(Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, orderId);

            return ps.executeUpdate() > 0;

        } catch(Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}