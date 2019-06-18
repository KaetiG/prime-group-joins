--Get all customers and their addresses.

SELECT * FROM "customers"
LEFT JOIN "addresses" ON "customers"."id"="addresses"."customer_id";

--Get all orders and their line items (orders, quantity and product).

SELECT "quantity", "description", "orders" FROM "line_items"
LEFT JOIN "products" ON "line_items"."product_id"="products"."id"
FULL JOIN "orders" ON "line_items"."order_id"="orders"."id"
;

--Which warehouses have cheetos?

SELECT "products"."description", "warehouse"."warehouse" FROM "warehouse_product"
LEFT JOIN "products" ON "warehouse_product"."product_id"="products"."id"
LEFT JOIN "warehouse" ON "warehouse_product"."warehouse_id"="warehouse"."id"
WHERE "products"."description" = 'cheetos';

--Which warehouses have diet pepsi?

SELECT "products"."description", "warehouse"."warehouse" FROM "warehouse_product"
LEFT JOIN "products" ON "warehouse_product"."product_id"="products"."id"
LEFT JOIN "warehouse" ON "warehouse_product"."warehouse_id"="warehouse"."id"
WHERE "products"."description" = 'diet pepsi';

--Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.

SELECT COUNT("orders"."id"), "customers"."first_name" 
FROM "customers"
JOIN "addresses" ON "addresses"."customer_id"="customers"."id"
JOIN "orders" ON "orders"."address_id"="addresses"."id"
GROUP BY "customers"."first_name";

--How many customers do we have?

SELECT COUNT(*) FROM "customers";

--How many products do we carry?

SELECT COUNT(*) FROM "products";

--What is the total available on-hand quantity of diet pepsi?

SELECT SUM("warehouse_product"."on_hand") FROM "products"
JOIN "warehouse_product" ON "warehouse_product"."product_id"="products"."id"
WHERE "products"."description"='diet pepsi';
