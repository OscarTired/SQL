    create table FABRICANTES(
    codigo int,
    nombre varchar(100),
    primary key(codigo)
    );
    
    create table ARTICULOS(
    codigo int,
    nombre varchar(100),
    precio int,
    fabricante int,
    primary key(codigo),
    FOREIGN key(fabricante) REFERENCES FABRICANTES(codigo)
    );
    
    insert into fabricantes values(1, 'LG');
    insert into fabricantes values(2, 'DELL');
    insert into fabricantes values(3, 'Lenovo');
    insert into fabricantes values(4, 'HP');
    insert into fabricantes values(5, 'Logitech');
    insert into fabricantes values(6, 'Samung');
    insert into fabricantes values(7, 'Kingstone');
    insert into fabricantes values(8, 'Epson');
    insert into fabricantes values(9, 'Seagate');
    insert into fabricantes values(10, 'Toshiba');
    
    
    insert into articulos values(1, 'Disco Duro de 1TB', 200, 9);
    insert into articulos values(2, 'Monito 21', 350, 6);
    insert into articulos values(3, 'Monitor 29', 900, 1);
    insert into articulos values(4, 'DDR4 16GB', 250, 7);
    insert into articulos values(5, 'Mouse Gamer', 100, 2);
    insert into articulos values(6, 'Parlante 500W', 200, 6);
    insert into articulos values(7, 'Microfono', 50, 5);
    insert into articulos values(8, 'Laptop Core i5', 2500, 3);
    insert into articulos values(9, 'Impresora L330', 600, 8);
    insert into articulos values(10, 'Impresora', 1900, 4);
    insert into articulos values(11, 'Laptop AMD', 3000, 2);
    insert into articulos values(12, 'Disco Externo de 2TB', 400, 10);
    insert into articulos values(13, 'Camara Web', 160, 5);
    insert into articulos values(14, 'Laptop i7', 7000, 4);
    insert into articulos values(15, 'Disco Solido 500GB', 350, 10);
    
--Mostrar los nombres de los productos de la tienda.
select nombre from articulos;

--Mostrar los nombres y precios de los productos de la tienda.
select nombre, precio from articulos;

--Mostrar el nombrede los produtos cuyo precio sea menor o igual a 200.
select nombre from articulos where precio <=200;

--Mostrar todos los productos cuyo precio esta entre 60 y los 120.
select nombre, precio from articulos where precio>=60 and precio <=120;

--Hallar el IGV de cada producto.
select nombre, precio, precio * 0.18 as IGV from articulos;

--Hallar el precio de venta de cada producto.
select nombre, precio, precio * 0.18 as IGV, precio + (precio * 0.18) as Total from articulos;

--Mostrar el nombre del producto y su fabricante.
SELECT a.nombre AS Producto, f.nombre AS Fabricante
FROM articulos a JOIN fabricantes f
ON a.fabricante = f.codigo;

--Añadir el siguiente producto Altavoces de 70 Soles del fabricante 2.
insert into articulos values(16, 'Altavoces', 70, 2);

--Cambiar el nombre del producto impresora por impresora laser.
UPDATE ARTICULOS SET nombre = 'Impresora Laser' WHERE nombre = 'Impresora'; -- where codigo=11

--Aplicar descuento del 10% a todos los productos.
UPDATE ARTICULOS SET precio = precio * 0.9;


select*from ARTICULOS;

