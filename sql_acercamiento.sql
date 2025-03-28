create database holamundo;
show databases;
/*
Antes de ejecutar nuestra query, tenemos que indicar que base
de datos vamos a utilizar
*/
use holamundo;
create table animales(
/*
Dentro de este parentesis le vamos a indicar
las columnaS que va tener nuestra tabla, en donde
le tenemos que indicar su tipo de dato
*/
id int,
/*
En algunos casos vamos a tener que indicarle
la longitud del dato
*/
tipo varchar(255),
estado varchar(255),
/*
Las tablas deben de tener un identificador único, en este
caso hemos agregado un 'id', el cual es de tipo entero, pero
nosotros debemos indicarle que este 'id' es una 'primary key'
para que cumpla como identificador único
*/
primary key(id)
);
/*Para insertar datos dentro de las tablas, usamos el comando '  
insert into' seguido del nombre de la tabla y dentro de su 
parentesís le indicamos cuales son lo campos a lo que queremos
insertar los datos */
-- insert into animales(tipo, estado) values ('chanchito', 'feliz');

/*Ahora vamos a modificar nuestra tabla creada, debido a que no
le hemos indicado un id para que se vaya incrementando de manera
secuencial, para hacerlo usamos 'alter table' donde le pasamoa la
tabla, seguido de modify y le indicamos que columna queremos
modificar en este caso 'id' seguido de su tipo de dato*/
alter table animales modify column id int auto_increment;

/*Con esto vamos a obtener el comando con la que creamos la tabla, donde 
podremos copiarlo y pegarlo en nuestra consola*/
show create table animales;
CREATE TABLE `animales` (
  `id` int NOT NULL AUTO_INCREMENT, -- Aquí con 'not null' le esta indicando que no
  `tipo` varchar(255) DEFAULT NULL, -- puede tener datos vacíos
  `estado` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
);
insert into animales(tipo, estado) values ('chanchito', 'feliz');
insert into animales(tipo, estado) values ('dragon', 'feliz');
insert into animales(tipo, estado) values ('felipe', 'triste');

/*Como podemos listar todos los registros que hemos agregado, con select nos 
permite seleccionar elementos que se encuentran en una tabla*/
select *  from animales; -- esto me selecciona todos los registros de la tabla

/*Lo que queremos decir con esto es que seleccioname todos los resgistros
de la tabla 'donde' el 'id' sea igual a '1' */
select * from animales where id = 1;
/*Aquí le estamos indicando dos condiciones mediante el conector de 'and'*/
select * from animales where estado = 'feliz' and tipo = 'chanchito';

/*Actualizar los registros que ya se encuentran en nuestra base de datos, mediante el 'update'
donde le estamos diciendo a nuestra tabla que agregue o cambie en la columna 'estado' por 
un varchar de 'feliz' en donde este el id = 3*/
update animales set estado = 'feliz' where id = 3; 

select * from animales;

/*Ahora vamos a borrar nun registro, mediante 'delete', le estamos diciendo que queremos 
eliminar un registro en la tabla de animales donde su collumna tenga el valor de 'feliz'*/
-- delete from animales where estado = 'feliz';

-- Error Code: 1175. You are using safe update mode and you tried to update a table without a 
-- WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.
/*Nos da un error porque debemos indicarle un id para evitar posibles errores*/
 delete from animales where id =3;
 
 select * from animales;
 
 /*Esto nos va arrojar el mismo error, por lo que si queremos actualizar esto debemos pasarle un 'id'*/
 update animales set estado = 'triste' where tipo = 'dragon';