USE sql_view_index_stored_procedure;
EXPLAIN
SELECT *
FROM customers
WHERE customerName = 'Land of Toys Inc.';
SELECT *
FROM customers
WHERE customerName = 'Land of Toys Inc.';
ALTER TABLE customers
    ADD INDEX idx_customersName (customerName);
EXPLAIN
SELECT *
FROM customers
WHERE contactFirstName = 'Jean'
   OR contactFirstName = 'King';
ALTER TABLE customers
    ADD INDEX idx_fullName (contactFirstName, contactLastName);
ALTER TABLE customers
    DROP INDEX idx_fullName;
CREATE VIEW orders_sample AS
SELECT orders.orderNumber, customerName, productName, quantityOrdered, priceEach, status
FROM orders
         JOIN customers c ON c.customerNumber = orders.customerNumber
         JOIN orderdetails o ON orders.orderNumber = o.orderNumber
         JOIN products p ON o.productCode = p.productCode
WHERE priceEach > 100;
SELECT *
FROM orders_sample;
ALTER VIEW orders_sample AS
    SELECT orders.orderNumber, customerName, productName, quantityOrdered, priceEach, status
    FROM orders
             JOIN customers c ON c.customerNumber = orders.customerNumber
             JOIN orderdetails o ON orders.orderNumber = o.orderNumber
             JOIN products p ON o.productCode = p.productCode
    WHERE priceEach > 150;
DROP VIEW orders_sample;

ALTER VIEW order_total_price AS
    SELECT orders.orderNumber, customerName, SUM(quantityOrdered * priceEach) AS total_bill, status
    FROM orders
             JOIN customers c ON c.customerNumber = orders.customerNumber
             JOIN orderdetails o ON orders.orderNumber = o.orderNumber
             JOIN products p ON o.productCode = p.productCode
    GROUP BY orders.orderNumber, customerName, status;
SELECT *
FROM order_total_price;

DELIMITER //
DROP PROCEDURE IF EXISTS `findAllCustomers`;
CREATE PROCEDURE findAllCustomers()
BEGIN
    SELECT * FROM customers WHERE customerNumber < 200;
END //
CALL findAllCustomers();
CREATE PROCEDURE getCustomerByID(IN customerNum int)
BEGIN
    SELECT * FROM customers WHERE customerNumber = customerNum;
END //
CALL getCustomerByID(175);
DELIMITER //

CREATE PROCEDURE GetCustomersCountByCity(
    IN in_city VARCHAR(50),
    OUT total INT
)

BEGIN

    SELECT COUNT(customerNumber)

    INTO total

    FROM customers

    WHERE city = in_city;

END//
CALL GetCustomersCountByCity('NYC', @total);
SELECT @total;

CREATE PROCEDURE SetCounter(
    INOUT counter INT,
    IN increment INT
)

BEGIN

    SET counter = counter + increment;

END//

SET @counter = 1;
CALL SetCounter(@counter,1);
CALL SetCounter(@counter,3);
CALL SetCounter(@counter,5);
SELECT @counter;