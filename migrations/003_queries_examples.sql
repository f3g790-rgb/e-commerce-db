-- TRIGGER: Decrease stock by quantity when a product is added to an order
CREATE OR REPLACE FUNCTION decrease_stock_on_order()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE Products SET stock_quantity = stock_quantity - NEW.quantity WHERE product_id = NEW.product_id;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trg_decrease_stock
AFTER INSERT ON OrderItems
FOR EACH ROW EXECUTE FUNCTION decrease_stock_on_order();

-- Check stock before
SELECT product_id, name, stock_quantity FROM Products WHERE product_id = 3;

-- Fire the trigger
INSERT INTO OrderItems (order_id, product_id, quantity) VALUES (3, 3, 5);

-- Check stock after, drop by 5
SELECT product_id, name, stock_quantity FROM Products WHERE product_id = 3;

-- VIEW: Orders with customer name and status
CREATE OR REPLACE VIEW vw_order_summary AS
SELECT o.order_id, c.name AS customer_name, os.status_name, o.order_date
FROM Orders o
JOIN Customers c    ON c.customer_id = o.customer_id
JOIN OrderStatus os ON os.status_id  = o.status_id;
SELECT * FROM vw_order_summary;

-- READ 1: All products with category and seller
SELECT p.name, p.price, p.stock_quantity, cat.category_name, org.org_name AS seller
FROM Products p
JOIN Categories cat    ON cat.category_id = p.category_id
JOIN Organizations org ON org.org_id      = p.org_id;

-- READ 2: All orders with customer name and status
SELECT o.order_id, c.name AS customer_name, os.status_name, o.order_date
FROM Orders o
JOIN Customers c    ON c.customer_id = o.customer_id
JOIN OrderStatus os ON os.status_id  = o.status_id;

-- READ 3: Products in each order
SELECT o.order_id, p.name AS product_name, p.price
FROM OrderItems oi
JOIN Orders o   ON o.order_id   = oi.order_id
JOIN Products p ON p.product_id = oi.product_id;

-- READ 4: All reviews with rating
SELECT r.review_id, r.rating FROM Reviews r;

-- READ 5: All employees and their organization
SELECT e.full_name, e.role, org.org_name
FROM Employees e
JOIN Organizations org ON org.org_id = e.org_id;

-- READ 6: All products under a specific category
SELECT p.name, p.price, p.stock_quantity
FROM Products p
JOIN Categories cat ON cat.category_id = p.category_id
WHERE cat.category_name = 'Electronics';

-- UPDATE 1: Update customer name
UPDATE Customers SET name = 'James A. Wilson' WHERE customer_id = 1;
SELECT * FROM Customers WHERE customer_id = 1;

-- UPDATE 2: Update product price
UPDATE Products SET price = 74.99 WHERE product_id = 1;
SELECT product_id, name, price FROM Products WHERE product_id = 1;

-- UPDATE 3: Restock a product
UPDATE Products SET stock_quantity = stock_quantity + 50 WHERE product_id = 5;
SELECT product_id, name, stock_quantity FROM Products WHERE product_id = 5;

-- UPDATE 4: Change order status
UPDATE Orders SET status_id = 2 WHERE order_id = 4;
SELECT o.order_id, os.status_name FROM Orders o JOIN OrderStatus os ON os.status_id = o.status_id WHERE o.order_id = 4;

-- UPDATE 5: Assign employee to an order
UPDATE Orders SET employee_id = 5 WHERE order_id = 3;
SELECT order_id, employee_id FROM Orders WHERE order_id = 3;

-- UPDATE 6: Update employee role
UPDATE Employees SET role = 'Senior Manager' WHERE employee_id = 1;
SELECT employee_id, full_name, role FROM Employees WHERE employee_id = 1;

-- DELETE 1: Remove order items from a cancelled order
DELETE FROM OrderItems WHERE order_id = 5;
SELECT * FROM OrderItems WHERE order_id = 5;

-- DELETE 2: Remove the cancelled order
DELETE FROM Orders WHERE order_id = 5;
SELECT * FROM Orders WHERE order_id = 5;

-- DELETE 3: Remove a review
DELETE FROM Reviews WHERE review_id = 5;
SELECT * FROM Reviews;

-- DELETE 4: Remove a discontinued product
DELETE FROM Products WHERE product_id = 2;
SELECT product_id, name FROM Products;

-- DELETE 5: Remove an employee who left
DELETE FROM Employees WHERE employee_id = 4 AND ssn = 444556666;
SELECT employee_id, full_name FROM Employees;

-- DELETE 6: Remove a customer account
DELETE FROM Customers WHERE customer_id = 5;
SELECT * FROM Customers;