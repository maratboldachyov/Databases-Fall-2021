CREATE TABLE customers(
    id INTEGER PRIMARY KEY,
    full_name VARCHAR(50) NOT NULL,
    timestamp TIMESTAMP NOT NULL,
    delivery_address TEXT NOT NULL
);


CREATE TABLE orders(
    code INTEGER PRIMARY KEY,
    customer_id INTEGER REFERENCES  customers(id),
    total_sum DOUBLE PRECISION CHECK (total_sum>0) NOT NULL,
    is_paid BOOLEAN NOT NULL
);

CREATE TABLE  products(
    id varchar PRIMARY KEY,
    name varchar NOT NULL UNIQUE,
    description TEXT,
    price DOUBLE PRECISION CHECK (price > 0) NOT NULL
);

CREATE TABLE order_items(
    order_code INTEGER REFERENCES orders(code),
    product_id VARCHAR REFERENCES products(id),
    quantity INTEGER NOT NULL,
    PRIMARY KEY(order_code, product_id)
);
INSERT INTO products VALUES ('20B123', 'dsjfn', 'adjkgnm', 145);
UPDATE products SET description = 250 WHERE  id = '20B123';
DELETE FROM products WHERE price = 145;