create table products(
	id int not null auto_increment,
    name varchar(50) not null,
    created_by int not null, -- columna que va referencias a la tabla de usuarios
    marca varchar(50) not null,
    primary key(id), -- llave primaria 
    /*Aquí vamos establecer una relación con otra tabla, por lo que usamos 'foreign key'
    seguido de la columna que va ser nuestra clave foranea o donde se va guardar nuestra
    llave foranea, y ahora debemos referenciar a la tabla que se va relacionar, seguido de la
    columna con la llave primaria*/
    foreign key(created_by) references user(id)
);

/*Para cambiar el nombre de nuestras tablas*/
rename table products to product;

/*Otra manera de insertar datos */
insert into product (name, created_by, marca)
values
	('ipad',1,'apple'),
    ('iphone',1,'apple'),
    ('watch',2,'apple'),
    ('mackook',1,'apple'),
    ('imac',3,'apple'),
    ('ipad mini',2,'apple');
    
select * from product; -- ver todos los registros

/*
LEFT JOIN
left join nos permite como cruzar dos tablas, donde la tablla del lado inzquierdo
va buscar referencias de la tabla del lado derecho, donde si las encuentra mostrará su valor
el cual puede ser null en caso de no coincidir, y en este caso la clave foranea es impornate
debido a que nos ayuda a identificar si existe un valor dentro de la otra tabla.
*/
/*
Para hacer un left join, necesitaremos de las dos tablas, seguido del nombre las columnas
que llamaremos para poder visibilar mejor nuestra tabla, a las columnas las podemos llamar
con un alias de la tabla generado ahí mismo en la peitición. Despues aplicariamos el 'left join'
donde aquí le tenemos que indicar la tabla que queremos unir con la tabla de la izquierda, y lo
hacemos con 'on', que nos quiere decir que vamos a juntar según el id del usuario sea igual 
al de la columna a comparar
*/
select u.id, u.email, p.name from user u 
left join product p
on u.id = p.created_by;
select p.id, p.name, u.name as creado_por from product p 
left join user u
on u.id = p.created_by;

/*
RIGHT JOIN
Es similar al 'left join', pero solo que de manera contraria, es decir se va traer todos los
registros de la derecha y si encuentra datos de la izquierda este los va traer, sin embargo si no
encuentra una coincidencia este no lo va traer
*/
select u.id, u.email, p.name from user u 
right join product p
on u.id = p.created_by;

/*
INNER JOIN
Nos permitira mostras los registros de las dos tablas siempre y cuando estos dos se encuentren 
asociados
*/
select u.id, u.email, p.name from user u 
inner join product p
on u.id = p.created_by;


/*
CROOS JOIN
Nos entrega un producto cartesiano entre dos tablas, es decir cada registro
de la primera tabla se combinara con todos los registros de la segunda tabla
*/
select u.id, u.name, p.id, p.name 
from user u 
cross join product p;


/*
Group by
Se usa con instrucciones como 'count'
Agrupa elementos en base a una condición o referencia, y los agrupa en registros
individuales
*/
select count(id), marca from product group by marca;
/*Aquí le estamos diciendo que selecionames el nombre del usuarios y que
contemos los id de los productos, donde desde producto tomamos todos los
registros y unimos las coincidencias con los id de los usuarios, para al final
agruparlos*/
select count(p.id), u.name 
from product p 
left join user u 
on u.id = p.created_by 
group by p.created_by;


/*
HAVING
se usa para filtrar los resultados depues de agruparlos con un 'group by'
*/
select count(p.id), u.name 
from product p 
left join user u 
on u.id = p.created_by 
group by p.created_by
having count(p.id) >= 2;

/*
DROP TBALE
Elimina las tablas
*/
drop table product;
drop table animales;
drop table user;
