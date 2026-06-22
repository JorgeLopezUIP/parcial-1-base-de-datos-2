CREATE TABLE usuarios(
	id INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(255) NOT NULL,
	correo VARCHAR(255) NOT NULL UNIQUE, 
	telefono VARCHAR(20) NOT NULL UNIQUE,
	rol ENUM('usuario', 'admin') NOT NULL, 
	activo BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE autentificacion(
	id INT PRIMARY KEY AUTO_INCREMENT, 
	id_usuario INT NOT NULL UNIQUE,
	usuario VARCHAR(255) NOT NULL UNIQUE, 
	contrasena VARCHAR(255) NOT NULL, 
	metodo_mfa ENUM('email', 'sms') NOT NULL,
	mfa_activo BOOLEAN NOT NULL DEFAULT TRUE, 
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
);

CREATE TABLE servicios(
	id INT PRIMARY KEY AUTO_INCREMENT,
	nombre_servicio VARCHAR(255) NOT NULL UNIQUE,
	precio DECIMAL(10,2) NOT NULL, 
	tipo ENUM('empresarial', 'economico') NOT NULL,
	disponible BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE servicios_contratados(
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    id_servicio INT NOT NULL, 
    fecha_contratacion DATE NOT NULL,
    modalidad ENUM('mensual', 'anual') NOT NULL,
    contratado BOOLEAN NOT NULL DEFAULT TRUE,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id),
    FOREIGN KEY (id_servicio) REFERENCES servicios(id)
);

CREATE TABLE pago(
	id INT PRIMARY KEY AUTO_INCREMENT, 
	id_contrato INT NOT NULL, 
	codigo VARCHAR(255) NOT NULL UNIQUE, 
    fecha DATE NOT NULL,
    metodo ENUM('tarjeta', 'efectivo') NOT NULL,
    confirmado BOOLEAN NOT NULL DEFAULT TRUE, 
    FOREIGN KEY (id_contrato) REFERENCES servicios_contratados(id)
);

CREATE TABLE auditoria(
	id INT PRIMARY KEY AUTO_INCREMENT, 
    id_autenticacion INT NOT NULL, 
    fecha DATETIME NOT NULL, 
    evento ENUM('login', 'logout') NOT NULL, 
    acceso_confirmado BOOLEAN NOT NULL DEFAULT TRUE,
    FOREIGN KEY (id_autenticacion) REFERENCES autentificacion (id)
);



INSERT INTO usuarios(nombre,correo,telefono,rol,activo)
VALUES
('Jorge Lopez','lopezjor7041@gmail.com','6924-2525','admin', TRUE),
('Morgan Meyer', 'morganmeyer@yahoo.com','6987-9887','usuario',TRUE),
('Johny Rudas', 'johnyrudas@hotmail.com', '6791-8784', 'usuario', TRUE),
('Samyr Montemayor', 'sotomayor@gmail.com','6947-2145','admin', TRUE), 
('Pedro Paramo', 'pedroparamo@yahoo.com', '6955-8784', 'admin', TRUE), 
('Gabriel Sanchez', 'gabriel456@gmail.com', '6981-3634', 'usuario', TRUE),
('Octavio Negrete', 'octavione4567@hotmail.com', '6987-8452','usuario', FALSE),
('Ernesto de San Juan', 'ernestosanjuan@hotmail.com', '6987-9578','usuario', TRUE),
('Hermenejildo Garcia', 'elherme4325@gmail.com', '6943-8452','usuario', TRUE),
('Santiago Molian', 'elsantipepe@gmail.com', '6955-7834','usuario', TRUE),
('Juan Preciado', 'juanpapreci@yahoo.com', '6934-7789','usuario', FALSE),
('Ivan Zuniga', 'elangelbebe6@gmail.com', '6955-7835','usuario', TRUE),
('Vivian Darkbloom', 'vladnav@gmail.com', '6984-7834','usuario', TRUE),
('Humbert Humberto', 'humberthum904@gmail.com', '6997-5641','usuario', TRUE),
('Jose Fadias', 'josefadi334@gmail.com', '6966-5544','usuario', TRUE);



INSERT INTO servicios(nombre_servicio,precio,tipo,disponible)
VALUES 
('Publicidad', 100.20,'empresarial', TRUE),
('Community Manager', 700.99,'empresarial', TRUE),
('Consultoria de Marketing', 2500.00,'empresarial', TRUE),
('Gestion de relaciones publicas', 10000.99,'empresarial', FALSE),
('Diseno de logotipo', 300.50,'empresarial', TRUE),
('Laba perros', 799.99,'empresarial', TRUE),
('Gestion de proyecto', 899.99,'empresarial', TRUE),
('Ciberseguridad', 1500.00,'empresarial', TRUE),
('Capacitacion de personal', 3000.00,'empresarial', TRUE),
('Declaracion de impuestos', 999.99,'empresarial', TRUE),
('Seguro corporativo', 700.00,'economico', FALSE),
('Auditoria externa', 1500.00,'economico', TRUE),
('Reestructuracion de deudas', 1700.00,'economico', TRUE),
('Factoraje financiero', 800.00,'economico', TRUE),
('Gestion de flotas', 2500.00,'economico', TRUE);



INSERT INTO autentificacion(id_usuario, usuario,contrasena,metodo_mfa,mfa_activo)
VALUES
(1,'JorgeLopez12', 'astrolopitecus', 'sms', TRUE), 
(2,'MorganRugby45', '12345', 'email', TRUE),
(3,'JohnyGagarin', '123456', 'email', TRUE),
(4,'Warmachine', '78945', 'sms', FALSE),
(5,'PedroParamo56', '45139', 'sms', TRUE),
(6,'GaboSan78', 'onomatopeia', 'email', TRUE),
(7,'OctoBlack', 'herasmushirvintus', 'sms', FALSE),
(8,'JuandeDios20', '4567892', 'email', TRUE),
(9,'HernestoGarci45', '186234', 'email', TRUE),
(10,'Santipepe', 'melaniemartinez', 'sms', FALSE),
(11,'Juanpreciado34', 'comala', 'email', TRUE),
(12,'Anvition', '77777', 'email', TRUE),
(13,'ATWA', 'palefire', 'sms', FALSE),
(14,'HumbertHumbert', '123456', 'sms', FALSE),
(15,'JoseFadi56', '456213', 'email', TRUE);


INSERT INTO servicios_contratados(id_usuario,id_servicio,fecha_contratacion,modalidad,contratado)
VALUES
(1,1,'2025-02-14','anual',TRUE),
(2,2,'2024-07-21','mensual',TRUE),
(3,3,'2023-04-19','mensual',TRUE),
(4,4,'2022-01-02','anual',TRUE),
(5,5,'2026-12-21','mensual',TRUE),
(6,6,'2022-06-20','mensual',TRUE),
(7,7,'2026-02-19','mensual',TRUE),
(8,8,'2025-09-30','anual',TRUE),
(9,9,'2024-06-04','anual',TRUE),
(10,10,'2022-12-31','mensual',TRUE),
(11,11,'2025-07-25','mensual',TRUE),
(12,12,'2022-04-19','mensual',TRUE),
(13,13,'2025-11-20','anual',TRUE),
(14,14,'2022-09-19','mensual',TRUE),
(15,15,'2026-03-27','mensual',TRUE);


INSERT INTO pago(id_contrato,codigo,fecha,metodo,confirmado)
VALUES
(1,1111,'2026-02-15','tarjeta', TRUE),
(2,1112,'2026-06-21','tarjeta', TRUE),
(3,1113,'2026-06-19','efectivo', TRUE),
(4,1114,'2026-01-02','efectivo', TRUE),
(5,1115,'2026-12-21','tarjeta', TRUE),
(6,1116,'2026-06-20','efectivo', TRUE),
(7,1117,'2026-02-15','tarjeta', TRUE),
(8,1118,'2025-09-30','tarjeta', TRUE),
(9,1119,'2026-06-04','tarjeta', TRUE),
(10,1121,'2026-5-31','tarjeta', TRUE),
(11,1122,'2025-09-30','tarjeta', TRUE),
(12,1123,'2026-10-30','tarjeta', TRUE),
(13,1124,'2025-11-20','tarjeta', TRUE),
(14,1125,'2026-06-19','tarjeta', TRUE),
(15,1126,'2026-05-27','tarjeta', TRUE);


INSERT INTO auditoria(id_autenticacion,fecha,evento,acceso_confirmado)
VALUES 
(1,'2026-05-21 11-58-11','login',TRUE),
(1,'2026-05-21 11-59-23','logout',TRUE),
(2,'2026-03-22 09-23-12','login',TRUE),
(2,'2026-03-22 09-23-12','logout',TRUE),
(3,'2026-06-20 07-24-13','login',TRUE),
(3,'2026-06-20 07-29-30','logout',TRUE),
(4,'2026-06-21 13-30-13','login',FALSE),
(4,'2026-06-21 13-30-30','login',TRUE),
(4,'2026-06-21 13-35-13','logout',TRUE),
(5,'2026-06-30 15-32-33','login',FALSE),
(5,'2026-06-30 15-32-37','login',FALSE),
(5,'2026-06-30 15-32-40','login',TRUE),
(5,'2026-06-30 17-40-50','logout',FALSE),
(6,'2026-06-11 15-32-33','login',TRUE),
(6,'2026-06-11 15-35-21','logout',TRUE);

#Operaciones CRUD
INSERT INTO usuarios(nombre,correo,telefono,rol,activo) #CREATE: Permite insertar datos en las tablas
VALUES
('Eduardo Santamaria', 'eduardosantamaria@gmail.com','6917-5555','usuario', FALSE);

SELECT * from  usuarios where id = 3; #Read busqueda filtrada que trae el usuario que tenga id de 3

update usuarios set nombre = 'Johnny Rudas' where id = 3; #UPDATE le cambia el nombre al usuario 

DELETE FROM auditoria where id = 11; #DELETE Borra el dato de la tabla que coinsida con la id especificada


