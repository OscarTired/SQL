create table Libros(
codigo number(5),
titulo varchar(40),
autor varchar(30),
codigoeditorial number(3)
);

create table Editoriales(
codigo number(3),
nombre varchar(20),
direccion varchar(40)
);

alter table Editoriales
add constraint UQ_editoriales
unique(codigo);

alter table Libros
add constraint UQ_Libros
unique(codigo);

 insert into editoriales values(1,'Planeta','Colon 120');
 insert into editoriales values(2,'Emece','Estrada 356');
 insert into editoriales values(3,'Siglo XXI','General Paz 700');
 insert into editoriales values(null,'Sudamericana','Copiapo 343');
 insert into editoriales values(null,'Norma','Bulnes 123');

 insert into libros values(100,'El aleph','Borges',1);
 insert into libros values(200,'Martin Fierro','Jose Hernandez',1);
 insert into libros values(300,'Aprenda PHP','Mario Molina',2);
 insert into libros values(400,'Java en 10 minutos',default,4);
 insert into libros values(500,'El quijote de la mancha','Cervantes',null);
 
select*from Editoriales; 
select*from Libros;

--Realizamos una combinacion izquierda para obtener

select titulo, nombre from editoriales e left join libros l
on codigoeditorial = e.codigo;

select titulo, nombre from libros l left join editoriales e
on codigoeditorial = e.codigo;

drop table Libros;
drop table Editoriales;

create table Libros(
codigo number(5),
titulo varchar(40) not null,
autor varchar(30) default 'Desconocido',
editorial varchar(20),
precio number(6,2)
);

 insert into libros
  values(1,'El aleph','Borges','Emece',15.90);
 insert into libros
  values(2,'Antología poética','Borges','Planeta',39.50);
 insert into libros
  values(3,'Java en 10 minutos','Mario Molina','Planeta',50.50);
 insert into libros
  values(4,'Alicia en el pais de las maravillas','Lewis Carroll','Emece',19.90);
 insert into libros
  values(5,'Martin Fierro','Jose Hernandez','Emece',25.90);
 insert into libros
  values(6,'Martin Fierro','Jose Hernandez','Paidos',16.80);
 insert into libros
  values(7,'Aprenda PHP','Mario Molina','Emece',19.50);
 insert into libros
  values(8,'Cervantes y el quijote','Borges','Paidos',18.40);
  
  select*from Libros;
  
  --Libros de Borgues menores a s/.20
  
select autor, precio from Libros
where autor = 'Borges' and precio <20;

--Librps de Borges y/0 cuya editorial es planeta

select titulo, editorial from Libros
where autor = 'Borges' or editorial = 'Planeta';

--libros que no sean de planeta

select titulo, editorial from Libros
where editorial != 'Planeta';

select titulo, editorial from Libros
where not editorial = 'Planeta';

create table Libros(
codigo number(5) not null,
titulo varchar(40) not null,
autor varchar(30) default 'Desconocido',
editorial varchar(20),
edicion date,
precio number(6,2)
);

 insert into libros values(1,'El aleph','Borges','Emece','15/01/2000',15.90);
 insert into libros values(2,'Cervantes y el quijote','Borges','Paidos',null,null);
 insert into libros values(3,'Alicia en el pais de las maravillas','Lewis Carroll',null,'25/03/2000',19.90);
 insert into libros values(4,'Martin Fierro','Jose Hernandez','Emece','18/05/2000',25.90);
 insert into libros (codigo,titulo,autor,edicion,precio) values(5,'Antología poética','Borges','25/08/2000',32);
 insert into libros (codigo,titulo,autor,edicion,precio) values(6,'Java en 10 minutos','Mario Molina','11/02/2007',45.80);
 insert into libros (codigo,titulo,autor,edicion,precio) values(7,'Martin Fierro','Jose Hernandez','23/11/2006',40);
 insert into libros (codigo,titulo,autor,edicion,precio) values(8,'Aprenda PHP','Mario Molina','01/06/2007',56.50);
 
select*from Libros where precio between 20 and 40;

select titulo, precio from Libros
where precio>20 and precio<=40;

select titulo, edicion from Libros
where edicion between '01/05/2000' and '01/05/2007' order by edicion; --desct descendente

