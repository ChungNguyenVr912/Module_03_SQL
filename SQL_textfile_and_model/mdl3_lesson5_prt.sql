USE practice_lesson5;
DROP TABLE IF EXISTS `products`;
CREATE TABLE products
(
    id                  int AUTO_INCREMENT PRIMARY KEY,
    product_code        varchar(50)  NOT NULL,
    product_name        varchar(255) NOT NULL,
    product_price       float,
    product_amount      int,
    product_description text,
    product_status      varchar(10)
);
INSERT INTO products(product_code, product_name, product_price, product_amount, product_description, product_status)
VALUES ('P001', 'iPhone 12 Pro', 1299.99, 10, 'Flagship smartphone by Apple', 'Active'),
       ('P002', 'Samsung Galaxy S21', 1099.99, 15, 'Premium Android smartphone', 'Active'),
       ('P003', 'Sony PlayStation 5', 499.99, 5, 'Next-gen gaming console', 'Active'),
       ('P004', 'Dell XPS 13', 1399.99, 8, 'High-performance laptop', 'Active'),
       ('P005', 'Canon EOS R5', 3899.99, 3, 'Professional mirrorless camera', 'Active'),
       ('P006', 'Nike Air Force 1', 99.99, 20, 'Classic athletic shoes', 'Active'),
       ('P007', 'Fitbit Versa 3', 229.99, 12, 'Fitness smartwatch', 'Active'),
       ('P008', 'Amazon Echo Dot', 49.99, 25, 'Smart speaker with Alexa', 'Active'),
       ('P009', 'Nintendo Switch', 299.99, 7, 'Hybrid gaming console', 'Active'),
       ('P010', 'LG OLED CX', 1799.99, 4, 'Premium OLED TV', 'Active'),
       ('P011', 'Bose QuietComfort 35 II', 349.99, 10, 'Wireless noise-canceling headphones', 'Active'),
       ('P012', 'Apple iPad Pro', 999.99, 6, 'Powerful tablet for productivity', 'Active'),
       ('P013', 'Samsung QLED Q90T', 1999.99, 3, 'High-end QLED TV', 'Active'),
       ('P014', 'Microsoft Surface Laptop 4', 1299.99, 9, 'Premium Windows laptop', 'Active'),
       ('P015', 'GoPro Hero 9 Black', 449.99, 15, 'Action camera for capturing adventures', 'Active'),
       ('P016', 'Sony WH-1000XM4', 349.99, 8, 'Wireless noise-canceling headphones', 'Active'),
       ('P017', 'HP Spectre x360', 1299.99, 6, 'Convertible laptop with sleek design', 'Active'),
       ('P018', 'Canon EOS 90D', 1199.99, 4, 'Advanced DSLR camera', 'Active'),
       ('P019', 'Apple Watch Series 6', 399.99, 12, 'Feature-rich smartwatch', 'Active'),
       ('P020', 'Lenovo ThinkPad X1 Carbon', 1599.99, 7, 'Premium business laptop', 'Active');

EXPLAIN
SELECT *
FROM products
WHERE product_code = 'P009';

ALTER TABLE products
    ADD UNIQUE INDEX idx_productCode (product_code);

EXPLAIN
SELECT *
FROM products
WHERE product_name = 'Canon EOS 90D'
  AND product_price > 1000;
ALTER TABLE products
    ADD INDEX idx_name_price (product_name, product_price);
CREATE VIEW product_info AS
SELECT product_code, product_name, product_price, product_status
FROM products;
SELECT *
FROM product_info;
DROP VIEW product_info;

DELIMITER //
CREATE PROCEDURE getAllProduct()
BEGIN
    SELECT product_code, product_name, product_price, product_status
    FROM products;
END //

CREATE PROCEDURE addNewProduct(
    IN productCode varchar(50),
    productName varchar(255),
    productPrice float,
    productAmount int,
    productDescription text
)
BEGIN
    INSERT INTO products(product_code, product_name, product_price, product_amount, product_description, product_status)
    VALUES (productCode, productName, productPrice, productAmount, productDescription, 'Active');
END //

CREATE PROCEDURE editProductByID(
    IN productID int,
    newName varchar(255),
    newPrice float,
    newAmount int
)
BEGIN
    UPDATE products
    SET product_name = newName,
        product_price = newPrice,
        product_amount = newAmount
    WHERE id = productID;
END //

CREATE PROCEDURE deleteProductByID(
    IN productID int
)
BEGIN
    DELETE FROM products WHERE id = productID;
END //
DELIMITER ;

CALL getAllProduct;
CALL deleteProductByID(1);
CALL editProductByID(2,'Samsung Galaxy S22', 1199.98,21);
CALL addNewProduct('P021', 'IPorn69', 969.6,69,'ehehe');