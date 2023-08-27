SELECT Categoria, AVG(precio_unitario) AS precio_promedio
FROM Producto
GROUP BY Categoria;



SELECT Categoria, SUM(cantidad) AS cantidad_total_en_stock
FROM Producto
GROUP BY Categoria;



SELECT Sucursal, SUM(total) AS total_ventas
FROM Orden
GROUP BY Sucursal;


SELECT cliente_id, SUM(total) AS total_compras
FROM orden
GROUP BY cliente_id
ORDER BY total_compras DESC
LIMIT 1;
