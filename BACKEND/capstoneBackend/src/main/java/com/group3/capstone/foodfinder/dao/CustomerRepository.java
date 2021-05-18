package com.group3.capstone.foodfinder.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.group3.capstone.foodfinder.entity.Customer;
//customer is the entity class
//long is the type of primary key of class customer
public interface CustomerRepository extends JpaRepository<Customer, Long> {



}
