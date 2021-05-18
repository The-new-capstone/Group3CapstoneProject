package com.group3.capstone.foodfinder.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group3.capstone.foodfinder.dao.CustomerRepository;
import com.group3.capstone.foodfinder.dto.Purchase;
import com.group3.capstone.foodfinder.dto.PurchaseResponse;
import com.group3.capstone.foodfinder.entity.Customer;
import com.group3.capstone.foodfinder.entity.Order;
import com.group3.capstone.foodfinder.entity.OrderItem;

import javax.transaction.Transactional;
import java.util.Set;
import java.util.UUID;

@Service
public class CheckoutServiceImpl implements CheckoutService{

	private CustomerRepository customerRepository;

	@Autowired
	public CheckoutServiceImpl(CustomerRepository customerRepository){
		this.customerRepository = customerRepository;
	}

	@Override
	@Transactional
	public PurchaseResponse placeOrder(Purchase purchase) {

		//retrieve the order info from dto
		Order order = purchase.getOrder();


		//generate tracking number
		String orderTrackingNumber = generateOrderTrackingNumber();
		order.setOrderTrackingNumber(orderTrackingNumber);

		//populate order with Order items
		Set<OrderItem> orderItems = purchase.getOrderItems();
		orderItems.forEach(item -> order.add(item));

		//populate order with billing Address and shipping Address
		order.setShippingAddress(purchase.getShippingAddress());

		//populate customer with order
		Customer customer = purchase.getCustomer();
		customer.add(order);

		//save to the address
		customerRepository.save(customer);

		//return a response
		return new PurchaseResponse(orderTrackingNumber);
	}

	private String generateOrderTrackingNumber() {

		//generate a random UUID number
		return UUID.randomUUID().toString();
	}
}
