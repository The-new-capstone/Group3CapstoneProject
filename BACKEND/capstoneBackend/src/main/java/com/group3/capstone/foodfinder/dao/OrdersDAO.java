package com.group3.capstone.foodfinder.dao;

import java.util.List;

import com.group3.capstone.foodfinder.entity.Order;

//order is the entity class
//long is the type of primary key of class order
public interface OrdersDAO {
	public List<Order> findAll();
}
