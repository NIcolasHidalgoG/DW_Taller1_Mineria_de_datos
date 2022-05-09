CREATE PROCEDURE dbo.UpdateOrders

AS
BEGIN

SET NOCOUNT ON;

INSERT INTO DW_BikeStore2.dbo.D_orders
(order_id, order_date, store_id)

SELECT order_id, order_date, store_id FROM BikeStores.sales.orders


END

GO

SET IDENTITY_INSERT D_orders ON;
GO

DELETE FROM DW_BikeStore2.dbo.H_venta;

EXECUTE dbo.UpdateOrders
SELECT * FROM DW_BikeStore2.dbo.H_venta; 
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