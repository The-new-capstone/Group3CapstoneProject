package com.group3.capstone.foodfinder.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.web.bind.annotation.CrossOrigin;

import com.group3.capstone.foodfinder.entity.State;

import java.util.List;

//cross Origin is used to avoid two localhost running in the same environment
//State is the entity class
//long is the type of primary key of class state
@CrossOrigin
@RepositoryRestResource
public interface StateRepository extends JpaRepository<State,Integer> {
	List<State> findByCountryCode(@Param("code") String code);
}