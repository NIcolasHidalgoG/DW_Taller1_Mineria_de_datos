CREATE PROCEDURE dbo.Refresh_Orders

AS
BEGIN

SET NOCOUNT ON;

INSERT INTO DW_BikeStore.dbo.D_orders
(order_id, order_date)

SELECT order_id, order_date FROM BikeStores.sales.orders


END

GO

CREATE PROCEDURE dbo.Refresh_Products

AS
BEGIN

SET NOCOUNT ON;

INSERT INTO DW_BikeStore.dbo.D_products
(products_id, product_name, list_price)

SELECT product_id, product_name, list_price FROM BikeStores.production.products

END

GO

CREATE PROCEDURE dbo.Refresh_Store

AS
BEGIN

SET NOCOUNT ON;

INSERT INTO DW_BikeStore.dbo.D_store
(store_name, city, street, state)

SELECT store_name, city, street, state FROM BikeStores.sales.stores

END