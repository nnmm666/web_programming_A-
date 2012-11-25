CREATE DATABASE web_programming DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;

GRANT ALL ON web_programming.* TO 'web' IDENTIFIED BY '123';

use web_programming;


CREATE TABLE users (
	id INT AUTO_INCREMENT PRIMARY KEY, 
	userid VARCHAR(100) NOT NULL UNIQUE,
	name VARCHAR(100),
	pwd VARCHAR(255) NOT NULL, 
	email VARCHAR(100) UNIQUE,
	country VARCHAR(100),
	gender CHAR(1) NOT NULL,
	favorites VARCHAR(255)
);

