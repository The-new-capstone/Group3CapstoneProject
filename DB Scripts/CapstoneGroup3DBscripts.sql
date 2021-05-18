-- -----------------------------------------------------
-- Creating database
-- -----------------------------------------------------

CREATE DATABASE `foodfinder`;
USE `foodfinder` ;


-- -----------------------------------------------------
-- Creating table address
-- -----------------------------------------------------
CREATE TABLE `address` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
)  AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Creating table customer
-- -----------------------------------------------------
CREATE TABLE `customer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Creating table orders
-- -----------------------------------------------------
CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_tracking_number` varchar(255) DEFAULT NULL,
  `total_price` decimal(19,2) DEFAULT NULL,
  `total_quantity` int DEFAULT NULL,
  `billing_address_id` bigint DEFAULT NULL,
  `customer_id` bigint DEFAULT NULL,
  `shipping_address_id` bigint DEFAULT NULL,
  `status` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_billing_address_id` (`billing_address_id`),
  UNIQUE KEY `UK_shipping_address_id` (`shipping_address_id`),
  KEY `K_customer_id` (`customer_id`),
  CONSTRAINT `FK_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `FK_billing_address_id` FOREIGN KEY (`billing_address_id`) REFERENCES `address` (`id`),
  CONSTRAINT `FK_shipping_address_id` FOREIGN KEY (`shipping_address_id`) REFERENCES `address` (`id`)
)  AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Creating table order_item
-- -----------------------------------------------------
CREATE TABLE `order_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image_url` varchar(255) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `unit_price` decimal(19,2) DEFAULT NULL,
  `order_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `K_order_id` (`order_id`),
  CONSTRAINT `FK_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `FK_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
)  AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Creating table Restaurant
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `foodfinder`.`restaurant` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
  AUTO_INCREMENT = 1;

-- -----------------------------------------------------
-- Creating table product
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `foodfinder`.`product` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `sku` VARCHAR(255) DEFAULT NULL,
  `name` VARCHAR(255) DEFAULT NULL,
  `description` VARCHAR(255) DEFAULT NULL,
  `unit_price` DECIMAL(13,2) DEFAULT NULL,
  `image_url` VARCHAR(255) DEFAULT NULL,
  `active` BIT DEFAULT 1,
  `units_in_stock` INT(11) DEFAULT NULL,
   `date_created` DATETIME(6) DEFAULT NULL,
  `last_updated` DATETIME(6) DEFAULT NULL,
  `category_id` BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_category` (`category_id`),
  CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `restaurant` (`id`)
) 
AUTO_INCREMENT = 1;

-- -----------------------------------------------------
-- Creating table country
-- -----------------------------------------------------
CREATE TABLE `country` (
  `id` smallint unsigned NOT NULL,
  `code` varchar(2) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ;

-- -----------------------------------------------------
-- Creating table state
-- -----------------------------------------------------
CREATE TABLE `state` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `country_id` smallint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_country` (`country_id`),
  CONSTRAINT `fk_country` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`)
)  AUTO_INCREMENT=1;

-- -----------------------------------------------------
-- Inserting into Restaurant
-- -----------------------------------------------------

INSERT INTO restaurant(category_name)VALUES ('Chicken Hut');
INSERT INTO restaurant(category_name)VALUES ('Blue Plate');
INSERT INTO restaurant(category_name)VALUES ('Mamas Kitchen');
INSERT INTO restaurant(category_name)VALUES ('Coffee Bloom');

-- -----------------------------------------------------
-- Add sample data --- (sku --> stock keeping unit)
-- item lists
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Inserting into product 
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Restaurant Chicken Hut
-- -----------------------------------------------------

INSERT INTO product(sku, name, description, image_url, active, units_in_stock,
unit_price, category_id,date_created)
VALUES ('Chicken Hut-1000', 'Chicken Biryani', 'contains fresh chicken and authentic spices',
'assets/images/products/chickenHut/chickenbiryani.png'
,1,100,120,1, NOW());

INSERT INTO product(sku, name, description, image_url, active, units_in_stock,
unit_price, category_id,date_created)
VALUES ('Chicken Hut-1001', 'Chicken Fry', 'contains fresh chicken and authentic spices',
'assets/images/products/chickenHut/chickenfry.png'
,1,100,100,1, NOW());

INSERT INTO product(sku, name, description, image_url, active, units_in_stock,
unit_price, category_id,date_created)
VALUES ('Chicken Hut-1002', 'Tandori Chicken', 'contains fresh chicken and special tandori masala',
'assets/images/products/chickenHut/tandori chicken.png'
,1,150,110,1, NOW());

INSERT INTO product(sku, name, description, image_url, active, units_in_stock,
unit_price, category_id,date_created)
VALUES ('Chicken Hut-1003', 'Chicken Soup', 'contains fresh shredded chicken and richness of soup',
'assets/images/products/chickenHut/chicken soup.png'
,1,80,70,1, NOW());

INSERT INTO product(sku, name, description, image_url, active, units_in_stock,
unit_price, category_id,date_created)
VALUES ('Chicken Hut-1004', 'Fish Fry', 'Fish in the hands of a skilled cook can become an inexhaustible source of gustatory pleasures ',
'assets/images/products/chickenHut/fish fry.png'
,1,100,100,1, NOW());

INSERT INTO product(sku, name, description, image_url, active, units_in_stock,
unit_price, category_id,date_created)
VALUES ('Chicken Hut-1005', 'Chicken Fried Rice', 'a nicely cooked Fried-rice with tender chicken ',
'assets/images/products/chickenHut/chicken fried rice.png'
,1,120,100,1, NOW());

INSERT INTO product(sku, name, description, image_url, active, units_in_stock,
unit_price, category_id,date_created)
VALUES ('Chicken Hut-1006', 'Fried Chicken', 'a nicely cooked tender chicken with great flavours from our kitchen',
'assets/images/products/chickenHut/fried chicken.png'
,1,180,100,1, NOW());

-- -----------------------------------------------------
-- Restaurant Blue Plate
-- -----------------------------------------------------

INSERT INTO product(sku, name, description, image_url, active, units_in_stock,
unit_price, category_id,date_created)
VALUES ('Blue Plate-1000', 'Pasta', 'Pasta with melted cheese is the one thing you could eat over and over again',
'assets/images/products/blue plate/pasta.png'
,1,100,100,2, NOW());

INSERT INTO product(sku, name, description, image_url, active, units_in_stock,
unit_price, category_id,date_created)
VALUES ('Blue Plate-1001', 'French fries', 'Happier than a seagull with a French fry. French fries and tasty vibes. ',
'assets/images/products/blue plate/french fries.png'
,1,50,150,2, NOW());

INSERT INTO product(sku, name, description, image_url, active, units_in_stock,
unit_price, category_id,date_created)
VALUES ('Blue Plate-1002', 'Veg Pizza', 'A well-balanced meal is a slice in both hands.',
'assets/images/products/blue plate/veg pizza.png'
,1,140,90,2, NOW());

INSERT INTO product(sku, name, description, image_url, active, units_in_stock,
unit_price, category_id,date_created)
VALUES ('Blue Plate-1003', 'Coke', 'contains 286 calories per 100 gram',
'assets/images/products/blue plate/coke.png'
,1,60,30,2, NOW());

INSERT INTO product(sku, name, description, image_url, active, units_in_stock,
unit_price, category_id,date_created)
VALUES ('Blue Plate-1004', 'Ice cream', 'You cant buy happiness, but you can buy ice cream and that is pretty much the same thing.',
'assets/images/products/blue plate/ice cream.png'
,1,70,130,2, NOW());

INSERT INTO product(sku, name, description, image_url, active, units_in_stock,
unit_price, category_id,date_created)
VALUES ('Blue Plate-1005', 'falooda', 'a gem among Indian recipes made with milk, falooda sev, falooda seeds, rose syrup & ice cream',
'assets/images/products/blue plate/faluda.png'
,1,120,80,2, NOW());




-- -----------------------------------------------------
-- Restaurant Mamas Kitchen
-- -----------------------------------------------------

INSERT INTO product(sku, name, description, image_url, active, units_in_stock,
unit_price, category_id,date_created)
VALUES ('Mamas Kitchen-1000', 'Dosa', 'Crispy, savory and slightly sour, dosa is the South Indian counterpart to crepes.',
'assets/images/products/mamas kitchen/dosa.png'
,1,50,70,3, NOW());

INSERT INTO product(sku, name, description, image_url, active, units_in_stock,
unit_price, category_id,date_created)
VALUES ('Mamas Kitchen-1001', 'Idli', 'May the goodness of idlis always make us happy.',
'assets/images/products/mamas kitchen/idly.png'
,1,40,60,3, NOW());

INSERT INTO product(sku, name, description, image_url, active, units_in_stock,
unit_price, category_id,date_created)
VALUES ('Mamas Kitchen-1002', 'Upma', 'Nostalgic memories rush back with renewed vigour whenever we think about our favourite breakfast dish, Upma! you can recollect the tempting aroma of upma being prepared which is as soothing as my mothers gentle touch.',
'assets/images/products/mamas kitchen/upma.png'
,1,30,25,3, NOW());

INSERT INTO product(sku, name, description, image_url, active, units_in_stock,
unit_price, category_id,date_created)
VALUES ('Mamas Kitchen-1003', 'Idiyappam', 'If idlis are the first love of Maduraiites, idiyappams are not far behind. Reminding us the goodness of mom food',
'assets/images/products/mamas kitchen/idiyappam.png'
,1,20,50,3, NOW());

INSERT INTO product(sku, name, description, image_url, active, units_in_stock,
unit_price, category_id,date_created)
VALUES ('Mamas Kitchen-1004', 'Parotta', 'It is always warm, like trust us when we say this that there are no cold parottas',
'assets/images/products/mamas kitchen/parota.png'
,1,50,7,3, NOW());

INSERT INTO product(sku, name, description, image_url, active, units_in_stock,
unit_price, category_id,date_created)
VALUES ('Mamas Kitchen-1005', 'Meals', 'If you dont Love south Indian cuisine, you are either an alien or your taste buds are spoiled.',
'assets/images/products/mamas kitchen/meals.png'
,1,90,70,3, NOW());

INSERT INTO product(sku, name, description, image_url, active, units_in_stock,
unit_price, category_id,date_created)
VALUES ('Mamas Kitchen-1006', 'Mini Meals', 'From the south to your mouth. We put the coconut in curry. Because vegetables are the key',
'assets/images/products/mamas kitchen/mini meals.png'
,1,80,50,3, NOW());

INSERT INTO product(sku, name, description, image_url, active, units_in_stock,
unit_price, category_id,date_created)
VALUES ('Mamas Kitchen-1007', 'Pongal', 'With love and care from moms kitchen to you. Delicious Pongal with richness of south indian flavours',
'assets/images/products/mamas kitchen/pongal.png'
,1,50,45,3, NOW());

INSERT INTO product(sku, name, description, image_url, active, units_in_stock,
unit_price, category_id,date_created)
VALUES ('Mamas Kitchen-1008', 'Poori', 'Love pooris. Love watching them puff up as they fry. And love to see us sitting at the table enjoying lunch. And laugh at that moment when poking the poori releases the heat. . . .',
'assets/images/products/mamas kitchen/pori.png'
,1,40,7,3, NOW());

INSERT INTO product(sku, name, description, image_url, active, units_in_stock,
unit_price, category_id,date_created)
VALUES ('Mamas Kitchen-1009', 'Ice cream', 'You cant buy happiness, but you can buy ice cream and that is pretty much the same thing.',
'assets/images/products/mamas kitchen/vanila ice cream.png'
,1,100,60,3, NOW());

INSERT INTO product(sku, name, description, image_url, active, units_in_stock,
unit_price, category_id,date_created)
VALUES ('Mamas Kitchen-1010', 'Coke', 'contains 297 calories per 100 gram',
'assets/images/products/mamas kitchen/coke.png'
,1,50,7,3, NOW());


-- -----------------------------------------------------
-- Restaurant Coffee Bloom
-- -----------------------------------------------------

INSERT INTO product(sku, name, description, image_url, active, units_in_stock,
unit_price, category_id,date_created)
VALUES ('Coffee Bloom-1001', 'Cold Coffee', 'We love you a latte. Please try our new cold coffee',
'assets/images/products/coffee bloom/cold coffee.png'
,1,75,25,4, NOW());

INSERT INTO product(sku, name, description, image_url, active, units_in_stock,
unit_price, category_id,date_created)
VALUES ('Coffee Bloom-1002', 'Vanila Shake', 'When life gets tough, shake it.',
'assets/images/products/coffee bloom/vanila shake.png'
,1,100,40,4, NOW());

INSERT INTO product(sku, name, description, image_url, active, units_in_stock,
unit_price, category_id,date_created)
VALUES ('Coffee Bloom-1003', 'Strawberry Shake', 'When life gives you strawberries and ice cream, make milkshakes. How do you make a milkshake? well we will do it for you ',
'assets/images/products/coffee bloom/strawberry shake.png'
,1,110,50,4, NOW());

INSERT INTO product(sku, name, description, image_url, active, units_in_stock,
unit_price, category_id,date_created)
VALUES ('Coffee Bloom-1004', 'Ice Cream', 'You cant buy happiness, but you can buy ice cream and that is pretty much the same thing',
'assets/images/products/coffee bloom/ice cream.png'
,1,30,45,4, NOW());

INSERT INTO product(sku, name, description, image_url, active, units_in_stock,
unit_price, category_id,date_created)
VALUES ('Coffee Bloom-1005', 'Falooda', 'a gem among Indian recipes made with milk, falooda sev, falooda seeds, rose syrup & ice cream',
'assets/images/products/coffee bloom/faluda.png'
,1,160,40,4, NOW());

INSERT INTO product(sku, name, description, image_url, active, units_in_stock,
unit_price, category_id,date_created)
VALUES ('Coffee Bloom-1006', 'Coke', 'contains 175 calories per 100 gram',
'assets/images/products/coffee bloom/coke.png'
,1,100,100,4, NOW());

INSERT INTO product(sku, name, description, image_url, active, units_in_stock,
unit_price, category_id,date_created)
VALUES ('Coffee Bloom-1007', 'Cappuccino', 'For anyone worn down, The Impossible Will Take a Little While is a bracing double cappuccino.',
'assets/images/products/coffee bloom/cappuccino.png'
,1,120,45,4, NOW());

INSERT INTO product(sku, name, description, image_url, active, units_in_stock,
unit_price, category_id,date_created)
VALUES ('Coffee Bloom-1008', 'Iced Coffee', 'It’s almost summer, even if it might not feel like it where you are. Summer means iced beverages, so we decided that you would taste iced coffees ',
'assets/images/products/coffee bloom/iced coffee.png'
,1,100,30,4, NOW());

-- -----------------------------------------------------
-- Inserting into country
-- -----------------------------------------------------
INSERT INTO `country` VALUES 
(1,'IN','India'),(2,'UK','UK'),(3,'US','US'),(4,'Denmark','Denmark'),(5,'AUS','Australia');

-- -----------------------------------------------------
-- Inserting into state
-- -----------------------------------------------------
INSERT INTO `state` VALUES 
(1,'Karnataka',1),(2,'Maharashtra',1),(3,'Tamil Nadu',1),(4,'West Bengal',1),(5,'Delhi',1);

