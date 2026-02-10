ALTER TABLE product
    ADD COLUMN IF NOT EXISTS price double precision;

ALTER TABLE orders
    ADD COLUMN IF NOT EXISTS date_created date default current_date;

UPDATE product p
SET price = pi.price
FROM product_info pi
WHERE pi.product_id = p.id;

UPDATE orders o
SET date_created = od.date_created
FROM orders_date od
WHERE od.order_id = o.id;

ALTER TABLE product ADD CONSTRAINT product_pkey PRIMARY KEY (id);
ALTER TABLE orders ADD CONSTRAINT orders_pkey PRIMARY KEY (id);

ALTER TABLE order_product
    ADD CONSTRAINT fk_order_product_order
    FOREIGN KEY (order_id) REFERENCES orders(id);

ALTER TABLE order_product
    ADD CONSTRAINT fk_order_product_product
    FOREIGN KEY (product_id) REFERENCES product(id);

DROP TABLE IF EXISTS product_info;
DROP TABLE IF EXISTS orders_date;
