create database proyecto;
use proyecto;
create table usuarios(
idUsuario int primary key,
nombre varchar(30),
edad int,
correo varchar(30),
contrasena varchar(30)
);

create table anuncios(
idAnuncio int primary key,
tituloAnuncio varchar(80),
descripcionAn varchar (100),
idUsuario int
);

create table upload(
idTrabajo int primary key,
tituloTra varchar(100),
descripcionTra varchar(100),
edad char (8) not null check (edad in ('MAYOR', 'MENOR')),
lenguajeProg varchar(25),
precio float
);

create table chat(
idSala int primary key,
idUsuario varchar(30),
mensajes varchar(255),
fecha date,
urlPag varchar(30),
idTrabajo int
);

create table sala(
id int primary key,
fecha date
);


INSERT INTO usuarios (idUsuario, nombre, edad, correo, contrasena) VALUES 
(100, 'Antonio',39, 'holacomovas@gmail.com','asd123'), 
(101, 'Andres',16, 'bonneniut@gmail.com','contrasena'),
(102, 'Mauro',42, 'nosequeponer@gmail.com','p4ssword'),
(103, 'Angela',22, 'cristianoR@gmail.com','primerusuario'),
(104, 'Daniel',18, 'holacomovas@gmail.com','asd123'), 
(105, 'Paula',15, 'youknow@gmail.com','contrasena'),
(106, 'Juan',12, 'bonneniut@gmail.com','p4ssword'),
(107, 'Camila',22, 'nosequeponer@gmail.com','primerusuario');

INSERT INTO anuncios (idAnuncio, tituloAnuncio, descripcionAn, idUsuario) VALUES 
(1001, 'Java o JavaScript','El mejor lenguaje de promacion Java es', 100), 
(1002, 'Juegos en descuento','Juegos como COD, FIFA Y MUCHOS MAS', 101),
(1003, 'Guia para programar','Esta guia es uja puerta para empezar en este mundo', 102),
(1004, 'Nueva grafica RTX','La mejor grafica para todas sus necesidades', 103),
(1005, 'El mejor teclado mecanico','Proximos a lanzamiento en unos días (es RGB)', 1004), 
(1006, 'Nuevo combo teclado y mouse','Combo para cualquiera', 105),
(1007, 'El mejor lenguaje de programacion','cual es el mejor lenguaje',106),
(1008, 'Nuevo titulo de Riot Games','Proximo juego de la empresa Riot', 107);

INSERT INTO upload (idTrabajo, tituloTra, descripcionTra, edad, lenguajeProg, precio) VALUES
(1010,'Busco desarrollador python','Tengo un problema con un codigo, y no se como hacerlo correr','MENOR','Python',30000),
(1011,'Busco desarrollador java','Nesecito alguien que cree una funsion de bucle para mi code','MAYOR','Java',13000),
(1012,'Necesito crear una pagina','Necesito a un fullstack de tiempo completa','MAYOR','CSS',120000),
(1013,'Se requiere programador en css','Necesito un codigo en css para la funcion de unas imagenes','MAYOR','CSS',26000),
(1014,'AYUDAAAA','Tengo un problema con un codigo, es de javaScrip','MAYOR','JavaScrit',12000),
(1015,'Agregar procesador de pago','Quiero hacer gestiones en el sitio','MAYOR','PHP',320000),
(1016,'Desarrollo de aplicacion','Desarrollo de una aplicación para agregar un stream de datos KLV a un video','MAYOR','Java',720000),
(1017,'Terapia a Distancia Online','Nesecito a alguien que me haga una pagina web','MAYOR','Full',540000);

INSERT INTO chat (idSala, idUsuario, mensajes, fecha, urlPag) VALUES 
(200, 'Dan189','hola', '2023-06-15','www.youtube.com'), 
(201, 'Pau909','buenos días', '2023-10-25','www.google.com'),
(202, 'Cam837','estoy intersado', '2023-09-30','www.usbbog.edu.co'),
(203, 'Ant829','cuanto tiempo', '2023-02-06','www.youtube.com'),
(204, 'Mau456','hola', '2023-06-15','www.google.com'), 
(205, 'Jua456','buenos días', '2023-10-25','www.usbbog.edu.co'),
(206, 'Dan189','estoy intersado', '2023-01-15','www.youtube.com'),
(207, 'Mau456','cuanto tiempo', '2023-09-30','www.google.com');

INSERT INTO sala (id, fecha) VALUES 
(2001, '2023-10-25'), 
(2002, '2023-06-15'),
(2003, '2023-09-30'),
(2004, '2023-10-25'),
(2005, '2023-06-15'), 
(2006, '2023-10-15'),
(2007, '2023-09-30'),
(2008, '2023-10-25');

DELIMITER $$
CREATE FUNCTION nuevo_registro(idUsuario varchar(100), nombre varchar(100), contrasena varchar(100), correo varchar(100))
RETURNS VARCHAR(250)
DETERMINISTIC
BEGIN
    DECLARE registro varchar(250);
    SET registro = CONCAT(idUsuario, ', ', nombre, ', ', contrasena, ', ', correo);
    RETURN registro;
END$$
DELIMITER ;

SELECT nuevo_registro('108', 'Felipe' , 'pipe', 'pipe12@gmail.com');