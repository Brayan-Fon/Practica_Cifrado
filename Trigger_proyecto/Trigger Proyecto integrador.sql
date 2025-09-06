CREATE DATABASE IF NOT EXISTS trueque_base1;
USE trueque_base1;


CREATE TABLE Users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

DELIMITER //

CREATE TRIGGER before_insert_users
BEFORE INSERT ON Users
FOR EACH ROW
BEGIN
	SET New.password = SHA2(New.password, 256);
END;

//
DELIMITER ;

DELIMITER // 
CREATE TRIGGER before_update_users
BEFORE UPDATE ON Users
FOR EACH ROW
BEGIN
	SET New.password = SHA2(New.password, 256);
END;

// DELIMITER ;

INSERT INTO Users (username, email, password)
VALUES
( 'Felipe345', 'felipe123@gmail.com','1234567'),
( 'Armando', 'armando890@gmail.com', 'armando123'),
( 'Tatiana', 'tato456@gmail.com', 'Awfg234'),
( 'pablo', 'pablo567@gmail.com', 'PaBlO90'),
( 'Hernan', 'hernan0@gmail.com', '567890');

select * from Users;


CREATE TABLE Categoria (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(50) UNIQUE NOT NULL
);


CREATE TABLE Productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    nombre_producto VARCHAR(100) NOT NULL,
    descripcion TEXT,
    id_categoria INT,
    valor_estimado DECIMAL(10,2),
    fecha_publicacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE Intercambios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario_ofrece INT NOT NULL,
    id_usuario_recibe INT NOT NULL,
    id_producto_ofrecido INT NOT NULL,
    id_producto_recibido INT NOT NULL,
    estado ENUM ('pendiente','aceptado','rechazado') DEFAULT 'pendiente',
    fecha_intercambio TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Mensajes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_receptor INT NOT NULL,
    id_emisor INT NOT NULL,
    mensaje TEXT NOT NULL,
    fecha_envio TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE Valoracion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_intercambio INT NOT NULL,
    id_usuario_valorado INT NOT NULL,
    puntuacion TINYINT CHECK (puntuacion BETWEEN 1 AND 5),
    comentario TEXT,
    fecha_valoracion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

