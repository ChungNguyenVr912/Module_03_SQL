CREATE SCHEMA shopee_practice;
USE shopee_practice;
CREATE TABLE `user`(
    id int PRIMARY KEY AUTO_INCREMENT,
    user_name varchar(50) NOT NULL ,
    gender varchar(10),
    phone_number int(12)
);
CREATE TABLE address(
    id int PRIMARY KEY AUTO_INCREMENT,
    number varchar(10),
    street varchar(50),
    district varchar(50),
    city varchar(50),
    user_id int,
    FOREIGN KEY (user_id) REFERENCES user(id)
);
CREATE TABLE cart(
    id int PRIMARY KEY AUTO_INCREMENT,
    user_id int,
    FOREIGN KEY (user_id) REFERENCES user(id)
);
CREATE TABLE category(
    id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(255)
);
CREATE TABLE products(
    id int PRIMARY KEY AUTO_INCREMENT,
    product_name varchar(255),
    price float,
    category_id int,
    FOREIGN KEY (category_id) REFERENCES category(id)
);
CREATE TABLE variant(
    id int PRIMARY KEY AUTO_INCREMENT,
    color varchar(50),
    size varchar(10),
    product_id int,
    FOREIGN KEY (product_id) REFERENCES products(id)
);
CREATE TABLE cart_line(
    id int PRIMARY KEY AUTO_INCREMENT,
    cart_id int,
    product_id int,
    quantity int,
    FOREIGN KEY (cart_id) REFERENCES cart(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);
ALTER TABLE cart
ADD UNIQUE user_id (user_id);