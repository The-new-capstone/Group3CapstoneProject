package com.group3.capstone.foodfinder.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.group3.capstone.foodfinder.dto.Purchase;
import com.group3.capstone.foodfinder.dto.PurchaseResponse;
import com.group3.capstone.foodfinder.service.CheckoutService;

@CrossOrigin //annotation used to communicate between two different ports
@RestController
@RequestMapping("/api/checkout")
public class CheckoutController {

	private CheckoutService checkoutService;

	@Autowired
	public CheckoutController(CheckoutService checkoutService){
		this.checkoutService = checkoutService;
	}
	//Save order details
	@PostMapping("/purchase")
	public PurchaseResponse placeOrder(@RequestBody Purchase purchase){
		PurchaseResponse purchaseResponse = checkoutService.placeOrder(purchase);
		return purchaseResponse;
	}
}
