/*Procedimiento para llenar tabla dbo.D_orders solo con datos de 2016 y 2017*/
CREATE PROCEDURE dbo.Refresh_Orders

AS
BEGIN

SET NOCOUNT ON;

INSERT INTO DW_BikeStore2.dbo.D_orders (order_id, order_date, store_id)
SELECT order_id, order_date, store_id FROM BikeStores.sales.orders
	WHERE YEAR(order_date) = '2016' or YEAR(order_date) = '2017'
END

GO
EXECUTE dbo.Refresh_Orders

GO

/*Procedimiento para llenar tabla dbo.D_products*/
CREATE PROCEDURE dbo.Refresh_Products

AS
BEGIN

SET NOCOUNT ON;

INSERT INTO dbo.D_products(products_id, product_name, list_price, category_name)
SELECT product_id, product_name, list_price, category_name FROM BikeStores.production.categories pc LEFT OUTER JOIN BikeStores.production.products pp ON pc.category_id = pp.category_id;

END

GO
EXECUTE dbo.Refresh_Orders

GO

/*Procedimiento para llenar tabla dbo.D_store*/
CREATE PROCEDURE dbo.Refresh_Store

AS
BEGIN

SET NOCOUNT ON;

INSERT INTO DW_BikeStore2.dbo.D_store
(store_name, city, street, state)
SELECT store_name, city, street, state FROM BikeStores.sales.stores

END

GO

/*Procedimiento para llenar tabla de hechos dbo.H_venta*/
CREATE PROCEDURE dbo.Refresh_ventas

AS
BEGIN

INSERT INTO dbo.H_venta (order_id, product_id, store_id, quantity, discount)
SELECT soi.order_id, product_id, store_id, quantity, discount FROM BikeStores.sales.orders so LEFT OUTER JOIN BikeStores.sales.order_items soi ON so.order_id = soi.order_id;

END

