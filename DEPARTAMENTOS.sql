create table DEPARTAMENTOS(
Codigo int,
Nombre varchar(100),
Presupuesto int,
primary key(Codigo)
);

create table EMPLEADOS(
DNI varchar(8),
Nombre varchar(100),
Apellidos varchar(255),
Departamento int,
constraint pk_DNI primary key(DNI),
constraint fk_Departamento foreign key(Departamento) references DEPARTAMENTOS(Codigo)
);

drop table EMPLEADOS;

insert into DEPARTAMENTOS values(01, 'Gerencia', 25000); 
insert into DEPARTAMENTOS values(02, 'Recursos Humanos', 18000);
insert into DEPARTAMENTOS values(03, 'Atencion al Cliente', 15000);


update DEPARTAMENTOS set Presupuesto = 2500 where codigo = 01;
update DEPARTAMENTOS set Presupuesto = 1800 where codigo = 02;
update DEPARTAMENTOS set Presupuesto = 980 where codigo = 03;


insert into EMPLEADOS values('12345678', 'Alonso', 'Perez', 01);
insert into EMPLEADOS values('87654321', 'Daniela', 'Sandoval', 01);
insert into EMPLEADOS values('84529631', 'Pedro', 'Gomez', 02);
insert into EMPLEADOS values('47513584', 'Maria', 'Sanchez', 03);
insert into EMPLEADOS values('45127891', 'Juan', 'Islas', 03);
insert into EMPLEADOS values('84525121', 'Federico', 'Gomez', 02);
insert into EMPLEADOS values('48127891', 'Ana', 'Islas', 03);

select*from DEPARTAMENTOS;
select*from EMPLEADOS;

--1.	Obtener los apellidos de los empleados.
select apellidos from EMPLEADOS;

--2.	Obtener los apellidos de los empleados sin repeticiones.
select distinct apellidos from EMPLEADOS;

--3.	Obtener todos los datos de los empleados que trabajan para el departamento 2.
select DNI, Nombre, Apellidos from EMPLEADOS where DEPARTAMENTO = 02;

--4.	Obtener todos los datos de los empleados que trabajan para el departamento 3 y para el departamento 1.
select DNI, Nombre, Apellidos from EMPLEADOS where not DEPARTAMENTO = 02;

select*from EMPLEADOS where Departamento in(1, 3);

--5.	Obtener todos los datos de los empleados cuyo apellido comience por ’P’.
select DNI, Nombre, Apellidos from EMPLEADOS where Apellidos like 'P%';

--6.	Obtener el presupuesto total de todos los departamentos.
select sum (Presupuesto) as Presupuesto_Total from DEPARTAMENTOS;

--7.	Obtener el número de empleados en cada departamento.
select count(Nombre)as POR_DEPARTAMENTO from EMPLEADOS group by Departamento;
select Departamento, count(*) from EMPLEADOS group by Departamento;

--8.	Obtener un listado completo de empleados, incluyendo por cada empleado los datos del empleado y de su departamento.
select e.DNI, e.Nombre, e.Apellidos, d.Nombre as DEPARTAMENTO from EMPLEADOS e join DEPARTAMENTOS d on e.departamento = d.codigo;
select*from EMPLEADOS inner join DEPARTAMENTOS on EMPLEADOS.Departamento = departamentos.Codigo; 

--9.	Obtener los nombres y apellidos de los empleados que trabajen en departamentos cuyo presupuesto sea mayor de 1000
select distinct e.Nombre, Apellidos from EMPLEADOS e inner join DEPARTAMENTOS d on d.presupuesto>1000; --no
select e.Nombre, Apellidos from EMPLEADOS e inner join DEPARTAMENTOS d on e.departamento = d.codigo and d.presupuesto>1000;


--10.	Añadir un nuevo departamento: ‘Calidad’ e ‘informática’, con presupuesto de 6000 y 8000 - código 4 y 5. 
insert into DEPARTAMENTOS values(04, 'Calidad', 6000);
insert into DEPARTAMENTOS values(05, 'Informatica', 8000);


--11.	Añadir un empleado vinculado al departamento informática Esther Vázquez, DNI: 89267109
insert into EMPLEADOS values('89267109', 'Esther', 'Vázquez', 04);
update EMPLEADOS set Departamento = 05 where Nombre = 'Esther';


--12.	Aplicar un recorte presupuestario del 10% a todos los departamentos.
update DEPARTAMENTOS set Presupuesto = presupuesto*0.9;

--13.	Reasignar a los empleados del departamento de Administrativo al departamento de informática.
update EMPLEADOS set Departamento = 05 where Departamento = 02;

--14.	Despedir a todos los empleados que trabajan para el departamento de informática.
Delete from EMPLEADOS where Departamento = 05;

--15.	Despedir a todos los empleados.
truncate from EMPLEADOS;
