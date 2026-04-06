package com.foodapp.dao;

import java.util.List;
import com.foodapp.model.Menu;

public interface MenuDAO {

    boolean insertMenu(Menu menu);
    List<Menu> getMenuByRestaurantId(int restaurantId);
    boolean updateMenu(Menu menu);
    boolean deleteMenu(int menuId);
    Menu getMenuById(int menuId);
    List<Menu> getAllMenus();
}