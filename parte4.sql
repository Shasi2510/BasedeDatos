INSERT INTO Categoria (nombre) VALUES
('Electronicos'),
('Ropa'),
('Hogar'),
('Deportes'),
('Juguetes');

INSERT INTO Producto (nombre, marca, categoria_id, precio_unitario) VALUES
('Televisor', 'Sony', 1, 1000),
('Laptop', 'HP', 1, 800),
('Camisa', 'Zara', 2, 50),
('Pantalon', 'Levis', 2, 70),
('Sarten', 'T-fal', 3, 30),
('Toalla', 'Cannon', 3, 20),
('Pelota', 'Nike', 4, 15),
('Raqueta', 'Wilson', 4, 50),
('Muneca', 'Barbie', 5, 25),
('Carro', 'Hot Wheels', 5, 10);

INSERT INTO Sucursal (nombre, direccion) VALUES
('Sucursal A', 'Calle 1'),
('Sucursal B', 'Calle 2'),
('Sucursal C', 'Calle 3');

INSERT INTO Stock (sucursal_id, producto_id, cantidad) VALUES
(1,	1, 65),
(1,	2, 71),
(1, 3, 8),
(1,	4, 42),
(1,	5, 61),
(1,	6, 14),
(1,	7, 70),
(1,	8, 66),
(1,	9, 13),
(1,	10, 68),
(2,	1, 14),
(2,	2, 67),
(2,	3, 74),
(2,	4, 32),
(2,	5, 75),
(2,	6, 37),
(2,	7, 14),
(2,	8, 42),
(2,	9, 51),
(2,	10,	41),
(3,	1,	59),
(3,	2,	98),
(3,	3,	52),
(3,	4, 85),
(3,	5, 31),
(3,	6, 17),
(3,	7, 13),
(3,	8, 18),
(3,	9, 76),
(3,	10, 1);



INSERT INTO Cliente (nombre, telefono) VALUES
('Juan', '1234567890'),
('Maria', '0987654321'),
('Pedro', '5555555555');

CREATE TABLE Orden (cliente_id, sucursal_id, fecha, total) VALUES
(1,	3,	'2023-06-12' 600),
(2,	1,	'2023-06-12', 705),
(3,	3,	'2023-06-12', 7000),
(2,	3,	'2023-06-12', 12200),
(3,	3,	'2023-06-12', 115),
(1,	1,	'2023-06-12', 690),
(1,	1,	'2023-06-12', 950),
(3,	3,	'2023-06-12', 8050),
(3,	2,	'2023-06-120', 485),
(2,	1,	'2023-06-12', 8725),
(2,	3,	'2023-06-12', 315),
(3,	1,	'2023-06-12', 16110),
(3,	3,	'2023-06-12', 975),
(3,	3,	'2023-06-12', 1490),
(1,	1,	'2023-06-12', 365);



CREATE TABLE Item (orden_id, producto_id, cantidad, monto_venta) VALUES
(1,	9,	7,	100),
(1,	8,	8,	500),
(2,	9,	3,	225),
(2,	5,	9,	240),
(2,	5,	10,	180),
(2,	6,	3,	60),
(3,	1,	9,	7000),
(4,	1,	4,	5000),
(4,	2,	8,	7200),
(5,	6,	2,	100),
(5,	7,	3,	15),
(6,	4,	9,	140),
(6,	9,	4,	250),
(6,	3,	2,	300),
(7,	5,	8,	300),
(7,	9,	6,	250),
(7,	8,	2,	400),
(8,	1,	6,	2000),
(8,	1,	10,	6000),
(8,	3,	2,	50),
(9,	8,	9,	200),
(9,	3,	3,	150),
(9,	7,	2,	105),
(9,	10,	5,	30),
(10, 9,	9,	225),
(10, 1,	7,	8000),
(10, 3,	6,	500),
(11, 7,	5,	90),
(11, 9,	8,	125),
(11, 3,	9,	100),
(12, 2,	7,	7200),
(12, 1,	5,	8000),
(12, 6,	9,	160),
(12, 8,	9,	350),
(12, 8,	4,	400),
(13, 9,	4,	175),
(13, 2,	6,	800),
(14, 1,	5,	1000),
(14, 4,	7, 490),
(15, 9, 6, 125),
(15, 5,	9, 240);


SELECT 
    MIN(precio) AS precio_minimo,
    MAX(precio) AS precio_maximo,
    AVG(precio) AS precio_promedio
FROM productos;


SELECT s.nombre_sucursal, SUM(p.cantidad) AS total_en_stock
FROM Sucursal s
JOIN Producto p ON s.sucursal_id = p.sucursal_id
GROUP BY s.sucursal_id, s.nombre_sucursal;


SELECT c.nombre_cliente, SUM(o.total) AS total_ventas
FROM Cliente c
JOIN Orden v ON c.id = o.cliente_id
GROUP BY c.nombre_cliente;


