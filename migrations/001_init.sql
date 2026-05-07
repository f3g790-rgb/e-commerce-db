DROP TABLE IF EXISTS Reviews CASCADE;
DROP TABLE IF EXISTS OrderItems CASCADE;
DROP TABLE IF EXISTS Orders CASCADE;
DROP TABLE IF EXISTS OrderStatus CASCADE;
DROP TABLE IF EXISTS Products CASCADE;
DROP TABLE IF EXISTS Categories CASCADE;
DROP TABLE IF EXISTS Customers CASCADE;
DROP TABLE IF EXISTS Employees CASCADE;
DROP TABLE IF EXISTS Organizations CASCADE;


CREATE TABLE Organizations (
    org_id      SERIAL PRIMARY KEY,
    org_name    VARCHAR(255) NOT NULL UNIQUE,
    owner_email VARCHAR(255),
    created_at  TIMESTAMP
);


CREATE TABLE Employees (
    employee_id INTEGER NOT NULL,
    ssn         INTEGER NOT NULL UNIQUE CHECK (ssn BETWEEN 100000000 AND 999999999),
    full_name   VARCHAR(255),
    role        VARCHAR(255),
    salary      DECIMAL DEFAULT 0 CHECK (salary >= 0),
    hire_date   TIMESTAMP,
    org_id      INTEGER NOT NULL,
    PRIMARY KEY (employee_id, ssn),
    UNIQUE (employee_id),
    CONSTRAINT fk_employees_org FOREIGN KEY (org_id) REFERENCES Organizations(org_id)
);


CREATE TABLE Customers (
    customer_id SERIAL PRIMARY KEY,
    name        VARCHAR(255),
    email       VARCHAR(255) NOT NULL UNIQUE,
    created_at  TIMESTAMP
);

CREATE TABLE Categories (
    category_id   SERIAL PRIMARY KEY,
    category_name VARCHAR(255)
);


CREATE TABLE Products (
    product_id     SERIAL PRIMARY KEY,
    price          DECIMAL NOT NULL CHECK (price > 0),
    name           VARCHAR(255),
    stock_quantity INTEGER,
    org_id         INTEGER NOT NULL,
    category_id    INTEGER,
    CONSTRAINT fk_products_org      FOREIGN KEY (org_id)      REFERENCES Organizations(org_id),
    CONSTRAINT fk_products_category FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);


CREATE TABLE OrderStatus (
    status_id   SERIAL PRIMARY KEY,
    status_name VARCHAR(255) NOT NULL UNIQUE CHECK (status_name IN ('PENDING', 'PROCESSING', 'CANCEL', 'COMPLETED'))
);


CREATE TABLE Orders (
    order_id    SERIAL PRIMARY KEY,
    order_date  TIMESTAMP,
    customer_id INTEGER NOT NULL,
    employee_id INTEGER,
    status_id   INTEGER,
    CONSTRAINT fk_orders_customer FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    CONSTRAINT fk_orders_employee FOREIGN KEY (employee_id) REFERENCES Employees(employee_id),
    CONSTRAINT fk_orders_status   FOREIGN KEY (status_id)   REFERENCES OrderStatus(status_id)
);

CREATE TABLE OrderItems (
    order_id   INTEGER,
    product_id INTEGER,
    quantity   INTEGER DEFAULT 1,
    CONSTRAINT fk_orderitems_order   FOREIGN KEY (order_id)   REFERENCES Orders(order_id),
    CONSTRAINT fk_orderitems_product FOREIGN KEY (product_id) REFERENCES Products(product_id)
);


CREATE TABLE Reviews (
    review_id   INTEGER PRIMARY KEY,
    rating      INTEGER,
    customer_id INTEGER,
    product_id  INTEGER,
    CONSTRAINT fk_reviews_customer FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    CONSTRAINT fk_reviews_product  FOREIGN KEY (product_id)  REFERENCES Products(product_id)
);