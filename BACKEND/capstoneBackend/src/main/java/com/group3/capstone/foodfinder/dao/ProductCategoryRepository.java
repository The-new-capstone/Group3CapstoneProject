package com.group3.capstone.foodfinder.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.web.bind.annotation.CrossOrigin;

import com.group3.capstone.foodfinder.entity.ProductCategory;



//cross Origin is used to avoid two localhost running in the same environment
//ProductCategory is the entity class
//long is the type of primary key of class ProductCategory
@CrossOrigin
@RepositoryRestResource(collectionResourceRel = "productCategory", path = "product-category")
public interface ProductCategoryRepository extends JpaRepository<ProductCategory,Long> {
}
