package com.group3.capstone.foodfinder.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name="state")
@Data
public class State {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;

	@Column(name="name")
	private String name;

	//many to one mapping to country
	@ManyToOne
	@JoinColumn(name="country_id")
	private Country country;
}
