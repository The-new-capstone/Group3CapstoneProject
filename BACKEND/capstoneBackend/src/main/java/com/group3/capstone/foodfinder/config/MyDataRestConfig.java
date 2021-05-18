package com.group3.capstone.foodfinder.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.rest.core.config.RepositoryRestConfiguration;
import org.springframework.data.rest.webmvc.config.RepositoryRestConfigurer;
import org.springframework.http.HttpMethod;
import org.springframework.web.servlet.config.annotation.CorsRegistry;

import com.group3.capstone.foodfinder.entity.Country;
import com.group3.capstone.foodfinder.entity.Product;
import com.group3.capstone.foodfinder.entity.ProductCategory;
import com.group3.capstone.foodfinder.entity.State;

import javax.persistence.EntityManager;
import javax.persistence.metamodel.EntityType;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Configuration
public class MyDataRestConfig implements RepositoryRestConfigurer {

	private EntityManager entityManager;

	@Autowired
	public MyDataRestConfig(EntityManager theEntityManager){
		entityManager = theEntityManager;
	}


	@Override
	public void configureRepositoryRestConfiguration(RepositoryRestConfiguration config, CorsRegistry cors) {

		HttpMethod[] theUnsupportedActions = {HttpMethod.POST, HttpMethod.PUT, HttpMethod.DELETE};


		//disable Http Methods

		disableHttpMethods(Product.class,config, theUnsupportedActions);
		disableHttpMethods(ProductCategory.class,config, theUnsupportedActions);
		disableHttpMethods(Country.class,config, theUnsupportedActions);
		disableHttpMethods(State.class,config, theUnsupportedActions);


		exposeIds(config);
	}

	private void disableHttpMethods(Class theClass,RepositoryRestConfiguration config, HttpMethod[] theUnsupportedActions) {
		config.getExposureConfiguration()
		.forDomainType(theClass)
		.withItemExposure((metdata, httpMethods) -> httpMethods.disable(theUnsupportedActions))
		.withCollectionExposure((metdata, httpMethods) -> httpMethods.disable(theUnsupportedActions));
	}

	//call an internal helper method to expose id of the category
	private void exposeIds(RepositoryRestConfiguration config){

		//get a list of all entity calsses from the entity manager
		Set<EntityType<?>> entities = entityManager.getMetamodel().getEntities();

		//creating an array of entity types
		List<Class> entityClasses = new ArrayList<>();

		//get the entity type for the entities
		for(EntityType tempEntityType : entities){
			entityClasses.add(tempEntityType.getJavaType());
		}

		// exposing the entity ids to the array of entity/domain types
		Class[] domainTypes = entityClasses.toArray(new Class[0]);
		config.exposeIdsFor(domainTypes);

	}

}

