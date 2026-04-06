package com.foodapp.dao;

import java.util.List;
import com.foodapp.model.Restaurant;

public interface RestaurantDAO {

    boolean insertRestaurant(Restaurant restaurant);
    boolean updateRestaurant(Restaurant restaurant);
    boolean deleteRestaurant(int restaurantId);
    Restaurant getRestaurantById(int restaurantId);
    List<Restaurant> getAllRestaurants();
}