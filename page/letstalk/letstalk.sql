set character_set_results=euckr;
set character_set_client=euckr;

GRANT ALL ON web2012.* TO 'web'@'localhost' IDENTIFIED BY 'asdf';

use web2012;

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


INSERT INTO keyword (keyword, weight, type) VALUES ("��ö��", 500, "reg");
INSERT INTO keyword (keyword, weight, type) VALUES ("�̸��", 500, "reg");
INSERT INTO keyword (keyword, weight, type) VALUES ("�ڱ���", 500, "reg");
INSERT INTO keyword (keyword, weight, type) VALUES ("������", 500, "reg");
INSERT INTO keyword (keyword, weight, type) VALUES ("���۽�Ÿk4", 500, "reg");
INSERT INTO keyword (keyword, weight, type) VALUES ("���ٸ�", 500, "reg");
INSERT INTO keyword (keyword, weight, type) VALUES ("�ѱ۳�", 500, "reg");
INSERT INTO keyword (keyword, weight, type) VALUES ("Ÿ���", 500, "reg");
INSERT INTO keyword (keyword, weight, type) VALUES ("������ ����", 500, "reg");
INSERT INTO keyword (keyword, weight, type) VALUES ("������8", 500, "reg");
INSERT INTO keyword (keyword, weight, type) VALUES ("��Ƽ���⽺", 500, "reg");

INSERT INTO topic (keyword_id, content, writer, photo) VALUES (5, "������ �뱹�� ����� ���۽�Ÿk4�� �Ǹ��� �������� ����� ������ �ʽ��ϴ�. ��� ���Ͻó���??", "������", "http://", "http://");	
INSERT INTO topic (keyword_id, content, writer, photo) VALUES (5, "������ �뱹�� ����� ���۽�Ÿk4�� �ѱ� K-POP���忡 ū ������ �ҷ� ����Ų�ٰ� ���մϴ�. �� ���𸶴� �Ƿ����� �������� ������ �ְ�, ��û�� ���� ���ð��� �ְ? ����ϰ� �ֽ��ϴ�.... ��¼����¼��...", "��â��", "http://", "http://");	
INSERT INTO topic (keyword_id, content, writer, photo) VALUES (5, "���۽�Ÿk ��ճ���???", "�̰���", "http://", "http://");
INSERT INTO topic (keyword_id, content, writer, photo) VALUES (5, "���۽�Ÿk ���� �̱�� ��������??", "�ڼ���", "http://", "http://");
INSERT INTO topic (keyword_id, content, writer, photo) VALUES (1, "��ö�� ����� �ĺ��� ���̾�� �������� ��� ���Ͻó���??", "�̰���", "http://", "http://");
INSERT INTO topic (keyword_id, content, writer, photo) VALUES (1, "����� ���� �ɱ��?? ��ö��, ������ ,�ڱ���??", "�ڼ���", "http://", "http://");


INSERT INTO opinion (topic_id, content, writer, position) VALUES (2, "�αⰡ ������ ����� �Ǵ°� �翬�ѹ�~~�� ��� ���ٰ� ������ ��̸� ������ ����", "�ڼ���", "��");
INSERT INTO opinion (topic_id, content, writer, position) VALUES (2, "��̾��� �ֵ鵵 ���� ���ϱ�..", "�̰���", "�ݴ�");
INSERT INTO opinion (topic_id, content, writer, position) VALUES (2, "�����!! �����ض�!! ���ġġ������ ���� �׸�����?? �̽�ö �Ǥ�", "������", "�ݴ�");
INSERT INTO opinion (topic_id, content, writer, position) VALUES (2, "���¿�� �� ������! ���ؿ��� Ż����Ű��!", "������", "��");


INSERT INTO reply (opinion_id, content, writer) VALUES (1, "���մϴ�", "��â��");
INSERT INTO reply (opinion_id, content, writer) VALUES (1, "������", "������");
INSERT INTO reply (opinion_id, content, writer) VALUES (1, "�� ��..", "��â��");
INSERT INTO reply (opinion_id, content, writer) VALUES (1, "������..", "������");
INSERT INTO reply (opinion_id, content, writer) VALUES (2, "���մϴ�", "�ڼ���");
INSERT INTO reply (opinion_id, content, writer) VALUES (2, "������", "�̰���");
INSERT INTO reply (opinion_id, content, writer) VALUES (2, "�� ��..", "�ڼ���");
INSERT INTO reply (opinion_id, content, writer) VALUES (2, "������..", "�̰���");

INSERT INTO reply (opinion_id, content, writer) VALUES (3, "���մϴ�", "��â��");
INSERT INTO reply (opinion_id, content, writer) VALUES (3, "������", "������");
INSERT INTO reply (opinion_id, content, writer) VALUES (3, "�� ��..", "��â��");
INSERT INTO reply (opinion_id, content, writer) VALUES (3, "������..", "������");
INSERT INTO reply (opinion_id, content, writer) VALUES (4, "���մϴ�", "�ڼ���");
INSERT INTO reply (opinion_id, content, writer) VALUES (4, "������", "�̰���");
INSERT INTO reply (opinion_id, content, writer) VALUES (4, "�� ��..", "�ڼ���");
INSERT INTO reply (opinion_id, content, writer) VALUES (4, "������..", "�̰���");
