create table user(
	id int not null auto_increment,
    name varchar(50) not null,
    edad int not null,
    email varchar(100) not null,
    primary key (id)
);

insert into user (name, edad, email) values ('Oscar', 25, 'oscar@gmail.com');
insert into user (name, edad, email) values ('Layla', 15, 'layla@gmail.com');
insert into user (name, edad, email) values ('Nicolas', 36, 'nico@gmail.com');
insert into user (name, edad, email) values ('Chanchito', 7, 'chanchito@gmail.com');

select database(); -- Esto nos muestra en que base de datos estamos

/*Nos mostrará todos los registros de la tabla que le hayamos indicado*/
select * from user;

/*Limit lo que hará es limitar la cantidad de recursos que se retornaran a nosotros,
en este caso se limitara en devolvernos el primer registro que encuentre*/
select * from user limit 1;


/*where
Aquí filtraremos nuestros registro mediante where, donde le estamos diciendo seleccioname
todos los usuarios donde su columna de edad sea mayor a 15*/
select * from user where edad > 15;
select * from user where edad >= 15;

/* where & and
Aqui le estamos agregando otra clausula*/
select * from user where edad > 20 and email = 'nico@gmail.com';

/*where & or
Aqui le estamos diciendo que nos traiga todos los registros que sean mayores a 20 o que tambien
me traiga los usuarios con el siguiente correo 'layla@gmail.com*/
select * from user where edad > 20 or email = 'layla@gmail.com';

/*Negación
Estamos haciendo una negación donde le estamos diciendo que nos traiga a los usuarios
que no tengan el email de 'layla@gmail.com'*/
select * from user where email != 'layla@gmail.com';

/*Between
Aquí en vez de comparar la edad directamente con un número o un string, le estamos diciendo
que busque la edad del usuario que se 'encuentre entre' 15 y 30, por lo que se incluira estos
dos extremos es decir 15 y 30
*/
select * from user where edad between 15 and 30;

/*Like
Nos permite realizar una busqueda de acuerdo a un string, en este caso le estamos diciendo
que seleccione los usuarios donde en su columna email 'sea como' '%gmail%', o sea con estos
caracteres especiales le estamos diciendo que no me importa lo que haya adelante o atrás, de la
palabra que yo quiero buscar o sea 'gmail'
*/
select * from user where email like '%gmail%';
/*Ahora le estamos diciendo qeu la palabra 'gmail' puede comenzar con cualquier cosa, pero debe
terminar con 'gmail'*/
select * from user where email like '%gmail';
select * from user where email like 'oscar%';

/*Order by
Nos oderna los registros de acuerdo a lo que le hayamios especificado si ascendente o 
descendente
*/
select * from user order by edad asc;
select * from user order by edad desc;

/*Max & Min
Son funciones donde le estamos diciendo que nos seleccione el al maximo usuario de acuerdo a 
la columna de edad, en donde la estamos asignano a una varibale con 'as'
*/
select max(edad) as mayor from user;
select min(edad) as menor from user;

/*SELECCIONANO COLUMNAS
Aquí estamos seleccionando columnas de acuerdo a una sintaxis básica, con el
nombre de la columna*/
select id, name from user;
select id, name as chanchito from user; -- as nos sirve para poner un alias a la columna