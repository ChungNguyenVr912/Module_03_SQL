USE sales_management;
INSERT INTO customer(name, age)
VALUES ('Minh Quan', 10),
       ('Ngoc Anh', 20),
       ('Hong Ha', 50);
INSERT INTO `order`(customerID, orderdate, totalprice)
VALUES (1, '2006-3-21', NULL),
       (2, '2006-3-23', NULL),
       (1, '2006-3-16', NULL);
INSERT INTO product(name, price)
VALUES ('May giat', 3),
       ('Tu lanh', 5),
       ('Dieu hoa', 7),
       ('Quat', 1),
       ('Bep dien', 2);
INSERT INTO order_detail(orderID, productID, quantity)
VALUES (1, 1, 3),
       (1, 3, 7),
       (1, 4, 2),
       (2, 1, 1),
       (3, 1, 8),
       (2, 5, 4),
       (2, 3, 3);
SELECT o.id, c.name, orderdate, SUM(price * order_detail.quantity)
FROM order_detail
         JOIN product p ON order_detail.productID = p.id
         JOIN `order` o ON o.id = order_detail.orderID
         JOIN customer c ON c.id = o.customerID
GROUP BY o.id;
UPDATE `order` o
JOIN (
    SELECT order_detail.orderID, SUM(product.price * order_detail.quantity) AS total
    FROM order_detail
    JOIN product ON order_detail.productID = product.id
    GROUP BY order_detail.orderID
) AS subquery ON o.id = subquery.orderID
SET o.totalprice = subquery.total;
