CREATE TABLE usuarios(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL, 
    apellido VARCHAR(255) NOT NULL, 
    nombre_usuario VARCHAR(255) NOT NULL UNIQUE, 
    contrasena VARCHAR(255) NOT NULL,
    ciudad VARCHAR(255) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    sexo enum('M', 'F') NOT NULL,
    estado_civil ENUM('casado', 'soltero','divorciado','viudo') NOT NULL,
    token VARCHAR(7) NOT NULL UNIQUE,
    tipo_empresa ENUM('publica', 'privada') NOT NULL,
    rol ENUM('cliente', 'admin', 'vendedor', 'ejecutivo', 'otro') NOT NULL
); 

CREATE TABLE pago(
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    monto DECIMAL(10,2) NOT NULL, 
    fecha DATE NOT NULL, 
    metodo ENUM('tarjeta', 'efectivo') NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
);

CREATE TABLE autentificacion(
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT NOT NULL UNIQUE,
    nombre VARCHAR(255) NOT NULL UNIQUE,
    contrasena VARCHAR(255) NOT NULL,
    agente VARCHAR(255) NOT NULL,
    token VARCHAR(7) NOT NULL UNIQUE,
	FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
);

CREATE TABLE pruebas(
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_usuarios INT NOT NULL,
    referencia VARCHAR(255) NOT NULL,
    nombre VARCHAR(255) NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
    fecha DATE NOT NULL, 
    estado ENUM('activo', 'desactivado') NOT NULL,
    FOREIGN KEY (id_usuarios) REFERENCES usuarios(id)
);

CREATE TABLE reporte(
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_prueba INT NOT NULL, 
    id_usuario INT NOT NULL,
    fecha DATE NOT NULL,
    titulo VARCHAR(255) NOT NULL UNIQUE,
    descripcion VARCHAR(255) NOT NULL, 
    FOREIGN KEY (id_prueba) REFERENCES pruebas(id),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
);

describe autentificacion;

alter table autentificacion drop column agente_usuario;

INSERT INTO usuarios(nombre,apellido,nombre_usuario,contrasena,ciudad,direccion,sexo,estado_civil,token,tipo_empresa,rol)
VALUES
('Jorge','Lopez', 'JorgeLopez12', '1234','Pueblo Nuevo','lllll','M','soltero','abc1234','privada','admin');

INSERT INTO usuarios(nombre,apellido,nombre_usuario,contrasena,ciudad,direccion,sexo,estado_civil,token,tipo_empresa,rol)
VALUES
('Johnny','Rudas', 'JohnnyGagarin', '12346','Panama','lllllw','M','soltero','qwery12','publica','admin'),
('Juan','Perez','JuanP1','abc123','Colon','Calle 1','M','casado','tok001a','privada','cliente'),
('Maria','Lopez','MariaL2','abc124','Panama','Calle 2','F','soltero','tok002b','publica','vendedor'),
('Pedro','Gomez','PedroG3','abc125','David','Calle 3','M','divorciado','tok003c','privada','ejecutivo'),
('Ana','Torres','AnaT4','abc126','Santiago','Calle 4','F','viudo','tok004d','publica','cliente'),
('Carlos','Ruiz','CarlosR5','abc127','Chitre','Calle 5','M','soltero','tok005e','privada','otro'),
('Luis','Morales','LuisM6','abc128','Panama','Calle 6','M','casado','tok006f','publica','cliente'),
('Sofia','Castillo','SofiaC7','abc129','Colon','Calle 7','F','soltero','tok007g','privada','vendedor'),
('Andres','Mendez','AndresM8','abc130','David','Calle 8','M','soltero','tok008h','publica','ejecutivo'),
('Valeria','Santos','ValeriaS9','abc131','Santiago','Calle 9','F','casado','tok009i','privada','cliente'),
('Miguel','Herrera','MiguelH10','abc132','Panama','Calle 10','M','soltero','tok010j','publica','admin'),
('Laura','Vega','LauraV11','abc133','Colon','Calle 11','F','divorciado','tok011k','privada','cliente'),
('Ricardo','Navarro','RicardoN12','abc134','David','Calle 12','M','casado','tok012l','publica','vendedor'),
('Daniela','Pineda','DanielaP13','abc135','Chitre','Calle 13','F','soltero','tok013m','privada','ejecutivo'),
('Jorge','Rios','JorgeR14','abc136','Panama','Calle 14','M','viudo','tok014n','publica','cliente'),
('Carmen','Fuentes','CarmenF15','abc137','Colon','Calle 15','F','casado','tok015o','privada','otro'),
('Mario','Bros','MarioBros','abc138','Panama','Mushroom St','M','soltero','tok016p','publica','cliente'),
('Patricia','Ortega','PatriciaO17','abc139','David','Calle 17','F','soltero','tok017q','privada','vendedor'),
('Fernando','Salas','FernandoS18','abc140','Santiago','Calle 18','M','casado','tok018r','publica','ejecutivo'),
('Monica','Diaz','MonicaD19','abc141','Panama','Calle 19','F','soltero','tok019s','privada','cliente'),
('Victor','Castro','VictorC20','abc142','Colon','Calle 20','M','divorciado','tok020t','publica','admin'),
('Gabriela','Mora','GabrielaM21','abc143','David','Calle 21','F','casado','tok021u','privada','cliente'),
('Roberto','Aguilar','RobertoA22','abc144','Chitre','Calle 22','M','soltero','tok022v','publica','vendedor'),
('Gordon','Freeman','GordonF23','abc145','Panama','Lambda St','M','soltero','tok023w','privada','ejecutivo'),
('Natalia','Campos','NataliaC24','abc146','Santiago','Calle 24','F','casado','tok024x','publica','cliente');

INSERT INTO  pago(id_usuario,monto,fecha,metodo)
VALUES 
(1,500.00,'2026-06-11','tarjeta'),
(2,400.00,'2025-06-11','efectivo'),
(3,300.00,'2024-06-11','tarjeta'),
(4,450.00,'2026-05-15','efectivo'),
(5,275.00,'2025-04-20','tarjeta'),
(6,600.00,'2024-03-10','tarjeta'),
(7,350.00,'2026-02-18','efectivo'),
(8,425.00,'2025-01-25','tarjeta'),
(9,700.00,'2024-12-05','efectivo'),
(10,550.00,'2026-06-01','tarjeta'),
(11,325.00,'2025-05-09','efectivo'),
(12,480.00,'2024-08-14','tarjeta'),
(13,220.00,'2026-07-22','efectivo'),
(14,750.00,'2025-09-30','tarjeta'),
(15,390.00,'2024-11-11','efectivo'),
(16,510.00,'2026-01-07','tarjeta'),
(17,640.00,'2025-03-17','efectivo'),
(18,295.00,'2024-10-26','tarjeta'),
(19,870.00,'2026-04-04','efectivo'),
(20,430.00,'2025-07-13','tarjeta'),
(21,560.00,'2024-09-21','efectivo'),
(22,310.00,'2026-08-08','tarjeta'),
(23,680.00,'2025-02-28','efectivo'),
(24,540.00,'2024-07-16','tarjeta'),
(25,465.00,'2026-03-29','efectivo');

SELECT * FROM pago;

INSERT INTO autentificacion
(id_usuario, nombre, contrasena, agente, token)
VALUES
(1,'JorgeLopez12','1234','Firefox','abc1234'),
(2, 'JohnnyGagarin', '12346', 'Chrome', 'qwery12'),
(3, 'JuanP1', 'abc123', 'Firefox', 'tok001a'),
(4, 'MariaL2', 'abc124', 'Edge', 'tok002b'),
(5, 'PedroG3', 'abc125', 'Chrome', 'tok003c'),
(6, 'AnaT4', 'abc126', 'Safari', 'tok004d'),
(7, 'CarlosR5', 'abc127', 'Chrome', 'tok005e'),
(8, 'LuisM6', 'abc128', 'Firefox', 'tok006f'),
(9, 'SofiaC7', 'abc129', 'Edge', 'tok007g'),
(10, 'AndresM8', 'abc130', 'Chrome', 'tok008h'),
(11, 'ValeriaS9', 'abc131', 'Safari', 'tok009i'),
(12, 'MiguelH10', 'abc132', 'Chrome', 'tok010j'),
(13, 'LauraV11', 'abc133', 'Firefox', 'tok011k'),
(14, 'RicardoN12', 'abc134', 'Edge', 'tok012l'),
(15, 'DanielaP13', 'abc135', 'Chrome', 'tok013m'),
(16, 'JorgeR14', 'abc136', 'Safari', 'tok014n'),
(17, 'CarmenF15', 'abc137', 'Firefox', 'tok015o'),
(18, 'MarioBros', 'abc138', 'Chrome', 'tok016p'),
(19, 'PatriciaO17', 'abc139', 'Edge', 'tok017q'),
(20, 'FernandoS18', 'abc140', 'Safari', 'tok018r'),
(21, 'MonicaD19', 'abc141', 'Chrome', 'tok019s'),
(22, 'VictorC20', 'abc142', 'Firefox', 'tok020t'),
(23, 'GabrielaM21', 'abc143', 'Edge', 'tok021u'),
(24, 'RobertoA22', 'abc144', 'Chrome', 'tok022v'),
(25, 'NataliaC24', 'abc146', 'Safari', 'tok024x');

INSERT INTO pruebas(id_usuarios,referencia,nombre,descripcion,fecha,estado)
VALUES
(1,'LOGIN_OK_01','Prueba#1','Prueba de login','2026-4-12','activo'),
(2, 'LOGIN_OK_02', 'Prueba#2', 'Prueba de login', '2026-04-12', 'activo'),
(3, 'LOGIN_OK_03', 'Prueba#3', 'Prueba de login', '2026-04-12', 'activo'),
(4, 'LOGIN_OK_04', 'Prueba#4', 'Prueba de login', '2026-04-12', 'desactivado'),
(5, 'LOGIN_OK_05', 'Prueba#5', 'Prueba de login', '2026-04-12', 'activo'),
(6, 'LOGIN_OK_06', 'Prueba#6', 'Prueba de login', '2026-04-12', 'activo'),
(7, 'LOGIN_OK_07', 'Prueba#7', 'Prueba de login', '2026-04-12', 'desactivado'),
(8, 'LOGIN_OK_08', 'Prueba#8', 'Prueba de login', '2026-04-12', 'activo'),
(9, 'LOGIN_OK_09', 'Prueba#9', 'Prueba de login', '2026-04-12', 'activo'),
(10, 'LOGIN_OK_10', 'Prueba#10', 'Prueba de login', '2026-04-12', 'activo'),
(11, 'LOGIN_OK_11', 'Prueba#11', 'Prueba de login', '2026-04-12', 'desactivado'),
(12, 'LOGIN_OK_12', 'Prueba#12', 'Prueba de login', '2026-04-12', 'activo'),
(13, 'LOGIN_OK_13', 'Prueba#13', 'Prueba de login', '2026-04-12', 'activo'),
(14, 'LOGIN_OK_14', 'Prueba#14', 'Prueba de login', '2026-04-12', 'activo'),
(15, 'LOGIN_OK_15', 'Prueba#15', 'Prueba de login', '2026-04-12', 'desactivado'),
(16, 'LOGIN_OK_16', 'Prueba#16', 'Prueba de login', '2026-04-12', 'activo'),
(17, 'LOGIN_OK_17', 'Prueba#17', 'Prueba de login', '2026-04-12', 'activo'),
(18, 'LOGIN_OK_18', 'Prueba#18', 'Prueba de login', '2026-04-12', 'desactivado'),
(19, 'LOGIN_OK_19', 'Prueba#19', 'Prueba de login', '2026-04-12', 'activo'),
(20, 'LOGIN_OK_20', 'Prueba#20', 'Prueba de login', '2026-04-12', 'activo'),
(21, 'LOGIN_OK_21', 'Prueba#21', 'Prueba de login', '2026-04-12', 'activo'),
(22, 'LOGIN_OK_22', 'Prueba#22', 'Prueba de login', '2026-04-12', 'desactivado'),
(23, 'LOGIN_OK_23', 'Prueba#23', 'Prueba de login', '2026-04-12', 'activo'),
(24, 'LOGIN_OK_24', 'Prueba#24', 'Prueba de login', '2026-04-12', 'activo');

INSERT INTO reporte(id_prueba,id_usuario,fecha,titulo,descripcion)
VALUES 
(1,1,'2026-05-23','Reporte#1','REPORTE DE LOGIN_OK_01'),
(2, 2, '2026-05-23', 'Reporte#2', 'REPORTE DE LOGIN_OK_02'),
(3, 3, '2026-05-23', 'Reporte#3', 'REPORTE DE LOGIN_OK_03'),
(4, 4, '2026-05-23', 'Reporte#4', 'REPORTE DE LOGIN_OK_04'),
(5, 5, '2026-05-23', 'Reporte#5', 'REPORTE DE LOGIN_OK_05'),
(6, 6, '2026-05-23', 'Reporte#6', 'REPORTE DE LOGIN_OK_06'),
(7, 7, '2026-05-23', 'Reporte#7', 'REPORTE DE LOGIN_OK_07'),
(8, 8, '2026-05-23', 'Reporte#8', 'REPORTE DE LOGIN_OK_08'),
(9, 9, '2026-05-23', 'Reporte#9', 'REPORTE DE LOGIN_OK_09'),
(10, 10, '2026-05-23', 'Reporte#10', 'REPORTE DE LOGIN_OK_10'),
(11, 11, '2026-05-23', 'Reporte#11', 'REPORTE DE LOGIN_OK_11'),
(12, 12, '2026-05-23', 'Reporte#12', 'REPORTE DE LOGIN_OK_12'),
(13, 13, '2026-05-23', 'Reporte#13', 'REPORTE DE LOGIN_OK_13'),
(14, 14, '2026-05-23', 'Reporte#14', 'REPORTE DE LOGIN_OK_14'),
(15, 15, '2026-05-23', 'Reporte#15', 'REPORTE DE LOGIN_OK_15'),
(16, 16, '2026-05-23', 'Reporte#16', 'REPORTE DE LOGIN_OK_16'),
(17, 17, '2026-05-23', 'Reporte#17', 'REPORTE DE LOGIN_OK_17'),
(18, 18, '2026-05-23', 'Reporte#18', 'REPORTE DE LOGIN_OK_18'),
(19, 19, '2026-05-23', 'Reporte#19', 'REPORTE DE LOGIN_OK_19'),
(20, 20, '2026-05-23', 'Reporte#20', 'REPORTE DE LOGIN_OK_20'),
(21, 21, '2026-05-23', 'Reporte#21', 'REPORTE DE LOGIN_OK_21'),
(22, 22, '2026-05-23', 'Reporte#22', 'REPORTE DE LOGIN_OK_22'),
(23, 23, '2026-05-23', 'Reporte#23', 'REPORTE DE LOGIN_OK_23'),
(24, 24, '2026-05-23', 'Reporte#24', 'REPORTE DE LOGIN_OK_24');

select * from reporte;