package com.foodapp.daoimpl;

import java.sql.*;
import java.util.*;

import com.foodapp.dao.MenuDAO;
import com.foodapp.model.Menu;
import com.foodapp.util.DBConnection;

public class MenuDAOImpl implements MenuDAO {

    @Override
    public boolean insertMenu(Menu menu) {

        String sql = "INSERT INTO menu(restaurantId,itemName,description,price,isAvailable) VALUES(?,?,?,?,?)";

        try(Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, menu.getRestaurantId());
            ps.setString(2, menu.getItemName());
            ps.setString(3, menu.getDescription());
            ps.setDouble(4, menu.getPrice());
            ps.setBoolean(5, menu.isAvailable());

            return ps.executeUpdate() > 0;

        } catch(Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public Menu getMenuById(int menuId) {

        String sql = "SELECT * FROM menu WHERE menuId=?";
        Menu m = null;

        try(Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, menuId);
            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                m = new Menu();
                m.setMenuId(rs.getInt("menuId"));
                m.setRestaurantId(rs.getInt("restaurantId"));
                m.setItemName(rs.getString("itemName"));
                m.setDescription(rs.getString("description"));
                m.setPrice(rs.getDouble("price"));
                m.setAvailable(rs.getBoolean("isAvailable"));
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return m;
    }
    
    
    @Override
    public List<Menu> getMenuByRestaurantId(int restaurantId) {

        List<Menu> list = new ArrayList<>();

        String sql = "SELECT * FROM menu WHERE restaurant_id=?";

        try(Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, restaurantId);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {

                Menu m = new Menu();

                m.setMenuId(rs.getInt("menu_id"));
                m.setRestaurantId(rs.getInt("restaurant_id"));
                m.setItemName(rs.getString("item_name"));
                m.setDescription(rs.getString("description"));
                m.setPrice(rs.getDouble("price"));
                m.setAvailable(rs.getBoolean("is_available"));
                m.setImagePath(rs.getString("image_path"));

                list.add(m);
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public List<Menu> getAllMenus() {

        List<Menu> list = new ArrayList<>();
        String sql = "SELECT * FROM menu";

        try(Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery()) {

            while(rs.next()) {

                Menu m = new Menu();
                m.setMenuId(rs.getInt("menuId"));
                m.setRestaurantId(rs.getInt("restaurantId"));
                m.setItemName(rs.getString("itemName"));
                m.setDescription(rs.getString("description"));
                m.setPrice(rs.getDouble("price"));
                m.setAvailable(rs.getBoolean("isAvailable"));

                list.add(m);
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public boolean updateMenu(Menu menu) {

        String sql = "UPDATE menu SET itemName=?, price=?, isAvailable=? WHERE menuId=?";

        try(Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, menu.getItemName());
            ps.setDouble(2, menu.getPrice());
            ps.setBoolean(3, menu.isAvailable());
            ps.setInt(4, menu.getMenuId());

            return ps.executeUpdate() > 0;

        } catch(Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public boolean deleteMenu(int menuId) {

        String sql = "DELETE FROM menu WHERE menuId=?";

        try(Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, menuId);
            return ps.executeUpdate() > 0;

        } catch(Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}