CREATE DATABASE web2012 DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;

GRANT ALL ON web2012.* TO 'web@localhost' IDENTIFIED BY 'asdf';

use web2012;

set character_set_results=euckr;
set character_set_client=euckr;

DROP TABLE keyword;
DROP TABLE topic;
DROP TABLE opinion;
DROP TABLE reply;
DROP TABLE users;
DROP TABLE friend;

CREATE TABLE keyword (
	id INT AUTO_INCREMENT PRIMARY KEY,
	keyword VARCHAR(50) UNIQUE,
	weight INT,
	type VARCHAR(10) NOT NULL,
	date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE topic (
	id INT AUTO_INCREMENT PRIMARY KEY,
	keyword_id INT NOT NULL,
	content TEXT NOT NULL,
	writer VARCHAR(100) NOT NULL,
	pros INT DEFAULT 0,
	cons INT DEFAULT 0,
	date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	photo VARCHAR(255)
);

CREATE TABLE opinion (
	id INT AUTO_INCREMENT PRIMARY KEY,
	topic_id INT NOT NULL,
	content TEXT NOT NULL,
	writer VARCHAR(100) NOT NULL,
	position VARCHAR(10) NOT NULL,
	pros INT DEFAULT 0,
	cons INT DEFAULT 0,
	date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE reply (
	id INT AUTO_INCREMENT PRIMARY KEY,
	opinion_id INT NOT NULL,
	content VARCHAR(500) NOT NULL,
	writer VARCHAR(50) NOT NULL,
	date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE users (
	id INT AUTO_INCREMENT PRIMARY KEY, 
	email VARCHAR(100) NOT NULL UNIQUE,
	name VARCHAR(100) NOT NULL,
	password VARCHAR(255) NOT NULL, 
	photo VARCHAR(255)
);

CREATE TABLE friend (
	id INT NOT NULL,
	friend_id INT NOT NULL,
	PRIMARY KEY(id, friend_id)
);


INSERT INTO keyword (keyword, weight, type) VALUES ("안철수", 500, "reg");
INSERT INTO keyword (keyword, weight, type) VALUES ("이명박", 500, "reg");
INSERT INTO keyword (keyword, weight, type) VALUES ("박근혜", 500, "reg");
INSERT INTO keyword (keyword, weight, type) VALUES ("문재인", 500, "reg");
INSERT INTO keyword (keyword, weight, type) VALUES ("슈퍼스타k4", 500, "reg");
INSERT INTO keyword (keyword, weight, type) VALUES ("오바마", 500, "reg");
INSERT INTO keyword (keyword, weight, type) VALUES ("한글날", 500, "reg");
INSERT INTO keyword (keyword, weight, type) VALUES ("타블로", 500, "reg");
INSERT INTO keyword (keyword, weight, type) VALUES ("묻지마 폭행", 500, "reg");
INSERT INTO keyword (keyword, weight, type) VALUES ("윈도우8", 500, "reg");
INSERT INTO keyword (keyword, weight, type) VALUES ("스티브잡스", 500, "reg");

