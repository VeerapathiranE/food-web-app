package com.foodapp.daoimpl;

import java.sql.*;
import java.util.*;

import com.foodapp.dao.RestaurantDAO;
import com.foodapp.model.Restaurant;
import com.foodapp.util.DBConnection;

public class RestaurantDAOImpl implements RestaurantDAO {

    @Override
    public boolean insertRestaurant(Restaurant r) {

        String sql = "INSERT INTO restaurant(name,cuisineType,deliveryTime,address,adminUserId,rating,isActive) VALUES(?,?,?,?,?,?,?)";

        try(Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, r.getName());
            ps.setString(2, r.getCuisineType());
            ps.setInt(3, r.getDeliveryTime());
            ps.setString(4, r.getAddress());
            ps.setInt(5, r.getAdminUserId());
            ps.setDouble(6, r.getRating());
            ps.setBoolean(7, r.isActive());

            return ps.executeUpdate() > 0;

        } catch(Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public Restaurant getRestaurantById(int restaurantId) {

        String sql = "SELECT * FROM restaurant WHERE restaurant_id=?";
        Restaurant r = null;

        try(Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, restaurantId);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                r = new Restaurant();

                r.setRestaurantId(rs.getInt("restaurant_id"));
                r.setName(rs.getString("name"));
                r.setCuisineType(rs.getString("cuisine_type"));
                r.setDeliveryTime(rs.getInt("delivery_time"));
                r.setAddress(rs.getString("address"));
                r.setAdminUserId(rs.getInt("admin_user_id"));
                r.setRating(rs.getDouble("rating"));
                r.setActive(rs.getBoolean("is_active"));
                r.setImageUrl(rs.getString("image_path")); // <-- important
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return r;
    }

    @Override
    public List<Restaurant> getAllRestaurants() {

        List<Restaurant> list = new ArrayList<>();
        String sql = "SELECT * FROM restaurant";

        try(Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery()) {

            while(rs.next()) {

                Restaurant r = new Restaurant();

                r.setRestaurantId(rs.getInt("restaurant_id"));
                r.setName(rs.getString("name"));
                r.setCuisineType(rs.getString("cuisine_type"));
                r.setDeliveryTime(rs.getInt("delivery_time"));
                r.setAddress(rs.getString("address"));
                r.setAdminUserId(rs.getInt("admin_user_id"));
                r.setRating(rs.getDouble("rating"));
                r.setActive(rs.getBoolean("is_active"));
                r.setImageUrl(rs.getString("image_path")); // <-- this fixes the image issue

                list.add(r);
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public boolean updateRestaurant(Restaurant r) {

        String sql = "UPDATE restaurant SET name=?, address=?, rating=? WHERE restaurantId=?";

        try(Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, r.getName());
            ps.setString(2, r.getAddress());
            ps.setDouble(3, r.getRating());
            ps.setInt(4, r.getRestaurantId());

            return ps.executeUpdate() > 0;

        } catch(Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public boolean deleteRestaurant(int restaurantId) {

        String sql = "DELETE FROM restaurant WHERE restaurantId=?";

        try(Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, restaurantId);

            return ps.executeUpdate() > 0;

        } catch(Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}