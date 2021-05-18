package com.group3.capstone.foodfinder.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.web.bind.annotation.CrossOrigin;

import com.group3.capstone.foodfinder.entity.Country;

//country is the entity class
//integer is the type of primary key of class Country
@CrossOrigin
@RepositoryRestResource(collectionResourceRel = "countries", path="countries")
public interface CountryRepository extends JpaRepository<Country, Integer> {
}
