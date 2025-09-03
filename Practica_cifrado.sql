CREATE DATABASE Seguridad;
USE Seguridad;
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

DELIMITER //
CREATE TRIGGER before_insert_usuarios
BEFORE INSERT ON usuarios
FOR EACH ROW
BEGIN
    SET NEW.password = SHA2(NEW.password, 256); 
END;

//
DELIMITER ;

DELIMITER //
CREATE TRIGGER before_update_usuarios
BEFORE UPDATE ON usuarios
FOR EACH ROW
BEGIN
    SET NEW.password = SHA2(NEW.password, 256);
END;
//
DELIMITER ;

INSERT INTO usuarios (username, password) 
VALUES ('brayan', 'Pepe320');

SELECT  * from usuarios;


