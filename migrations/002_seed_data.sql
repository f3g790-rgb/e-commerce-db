-- Organizations
INSERT INTO Organizations (org_name, owner_email, created_at) VALUES
    ('TechVault Inc.',  'owner@techvault.com',    '2023-01-10 09:00:00'),
    ('StyleHouse',      'contact@stylehouse.com', '2023-03-15 11:30:00'),
    ('HomeGoods Co.',   'info@homegoods.com',     '2023-05-20 08:45:00'),
    ('SportsPro',       'sales@sportspro.com',    '2023-07-01 14:00:00'),
    ('BookNook',        'hello@booknook.com',     '2023-09-12 10:15:00');

-- Employees
INSERT INTO Employees (employee_id, ssn, full_name, role, hire_date, org_id) VALUES
    (1, 111223333, 'Alice Johnson', 'Manager',   '2023-02-01', 1),
    (2, 222334444, 'Bob Martinez',  'Sales Rep', '2023-04-10', 2),
    (3, 333445555, 'Carol Lee',     'Support',   '2023-06-15', 3),
    (4, 444556666, 'David Kim',     'Sales Rep', '2023-08-20', 4),
    (5, 555667777, 'Eva Nguyen',    'Manager',   '2023-10-05', 5);

-- Customers
INSERT INTO Customers (name, email, created_at) VALUES
    ('James Wilson',  'james.wilson@email.com',  '2023-11-01 10:00:00'),
    ('Sara Chen',     'sara.chen@email.com',     '2023-11-15 12:30:00'),
    ('Marcus Brown',  'marcus.brown@email.com',  '2023-12-01 09:15:00'),
    ('Lily Patel',    'lily.patel@email.com',    '2024-01-10 14:45:00'),
    ('Tom Garcia',    'tom.garcia@email.com',    '2024-02-05 16:00:00');

-- Categories
INSERT INTO Categories (category_name) VALUES
    ('Electronics'),
    ('Clothing'),
    ('Home & Kitchen'),
    ('Sports & Outdoors'),
    ('Books');

-- Products
INSERT INTO Products (price, name, stock_quantity, org_id, category_id) VALUES
    (89.99,  'Wireless Headphones',     120, 1, 1),
    (109.99, 'Mechanical Keyboard',      85, 1, 1),
    (59.99,  'Men''s Running Jacket',    60, 2, 2),
    (44.99,  'Women''s Yoga Pants',     200, 2, 2),
    (79.99,  'Stainless Steel Pot Set',  40, 3, 3),
    (129.99, 'Air Fryer',                55, 3, 3),
    (34.99,  'Yoga Mat',                150, 4, 4),
    (19.99,  'Resistance Bands Set',    300, 4, 4),
    (29.99,  'The Art of SQL',          500, 5, 5),
    (34.99,  'Clean Code',              420, 5, 5);

-- OrderStatus
INSERT INTO OrderStatus (status_name) VALUES
    ('Pending'),
    ('Processing'),
    ('Shipped'),
    ('Delivered'),
    ('Cancelled');

-- Orders
INSERT INTO Orders (order_date, customer_id, employee_id, status_id) VALUES
    ('2024-03-01 10:30:00', 1, 1, 4),
    ('2024-03-05 14:00:00', 2, 2, 3),
    ('2024-03-10 09:15:00', 3, NULL, 2),
    ('2024-03-12 11:45:00', 4, 3, 1),
    ('2024-03-15 16:30:00', 5, 4, 5);

-- OrderItems
INSERT INTO OrderItems (order_id, product_id, quantity) VALUES
    (1, 1, 2),
    (1, 9, 1),
    (2, 3, 3),
    (2, 7, 1),
    (3, 5, 2),
    (4, 4, 1),
    (5, 2, 1);

-- Reviews
INSERT INTO Reviews (review_id, rating) VALUES
    (1, 5),
    (2, 4),
    (3, 4),
    (4, 5),
    (5, 3);