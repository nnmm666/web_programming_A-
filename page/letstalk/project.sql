CREATE DATABASE logindb DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;

GRANT ALL ON web_programming.* TO 'usertest'@'localhost' IDENTIFIED BY '123123';

use logindb;


CREATE TABLE users (
	id INT AUTO_INCREMENT PRIMARY KEY, 
	email VARCHAR(100) UNIQUE,
	name VARCHAR(100),
	password VARCHAR(255) NOT NULL, 
	photo VARCHAR(10000)
);

