package com.group3.capstone.foodfinder.service;

import com.group3.capstone.foodfinder.dto.Purchase;
import com.group3.capstone.foodfinder.dto.PurchaseResponse;

public interface CheckoutService {

    PurchaseResponse placeOrder(Purchase purchase);

}
