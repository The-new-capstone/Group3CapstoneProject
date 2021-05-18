package com.group3.capstone.foodfinder.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name="address")
@Setter
@Getter
public class Address {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private Long id;

	@Column(name="street")
	private String street;

	@Column(name="city")
	private String city;

	@Column(name="country")
	private String country;

	@Column(name="zip_code")
	private String zipCode;

	//One to one mapping to Order table
	@OneToOne
	@PrimaryKeyJoinColumn
	private Order order;

}
