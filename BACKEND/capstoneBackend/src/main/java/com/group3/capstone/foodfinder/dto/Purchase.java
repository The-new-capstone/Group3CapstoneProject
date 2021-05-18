package com.group3.capstone.foodfinder.dto;

import lombok.Data;

import java.util.Set;

import com.group3.capstone.foodfinder.entity.Address;
import com.group3.capstone.foodfinder.entity.Customer;
import com.group3.capstone.foodfinder.entity.Order;
import com.group3.capstone.foodfinder.entity.OrderItem;

@Data
public class Purchase {

    private Customer customer;

    private Address shippingAddress;

    private Order order;

    private Set<OrderItem> orderItems;
}
