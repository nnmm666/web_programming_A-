set character_set_results=euckr;
set character_set_client=euckr;

DROP TABLE keyword;
DROP TABLE topic;
DROP TABLE opinion;
DROP TABLE reply;
DROP TABLE user;
DROP TABLE friend;

CREATE TABLE keyword (
	id INT AUTO_INCREMENT PRIMARY KEY,
	keyword VARCHAR(50) UNIQUE,
	weight INT,
	type VARCHAR(10) NOT NULL,
	date DATE NOT NULL
);

CREATE TABLE topic (
	id INT AUTO_INCREMENT PRIMARY KEY,
	keyword_id INT NOT NULL,
	content TEXT NOT NULL,
	writer VARCHAR(100) NOT NULL,
	date DATE NOT NULL,
	photo VARCHAR(255),
	address VARCHAR(255) NOT NULL
);

CREATE TABLE opinion (
	id INT AUTO_INCREMENT PRIMARY KEY,
	topic_id INT NOT NULL,
	content TEXT NOT NULL,
	writer VARCHAR(100) NOT NULL,
	position VARCHAR(10) NOT NULL,
	pros INT DEFAULT 0,
	cons INT DEFAULT 0,
	date DATE NOT NULL
);

CREATE TABLE reply (
	id INT AUTO_INCREMENT PRIMARY KEY,
	opinion_id INT NOT NULL,
	content VARCHAR(500) NOT NULL,
	writer VARCHAR(50) NOT NULL,
	date DATE NOT NULL
);

CREATE TABLE user (
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


INSERT INTO keyword (keyword, weight, type, date) VALUES ("��ö��", 500, "reg", curdate());
INSERT INTO keyword (keyword, weight, type, date) VALUES ("�̸��", 500, "reg", curdate());
INSERT INTO keyword (keyword, weight, type, date) VALUES ("�ڱ���", 500, "reg", curdate());
INSERT INTO keyword (keyword, weight, type, date) VALUES ("������", 500, "reg", curdate());
INSERT INTO keyword (keyword, weight, type, date) VALUES ("���۽�Ÿk4", 500, "reg", curdate());
INSERT INTO keyword (keyword, weight, type, date) VALUES ("���ٸ�", 500, "reg", curdate());
INSERT INTO keyword (keyword, weight, type, date) VALUES ("�ѱ۳�", 500, "reg", curdate());
INSERT INTO keyword (keyword, weight, type, date) VALUES ("Ÿ���", 500, "reg", curdate());
INSERT INTO keyword (keyword, weight, type, date) VALUES ("������ ����", 500, "reg", curdate());
INSERT INTO keyword (keyword, weight, type, date) VALUES ("������8", 500, "reg", curdate());
INSERT INTO keyword (keyword, weight, type, date) VALUES ("��Ƽ���⽺", 500, "reg", curdate());


INSERT INTO topic (keyword_id, content, writer, date, photo, address) VALUES (5, "������ �뱹�� ����� ���۽�Ÿk4�� �Ǹ��� �������� ����� ������ �ʽ��ϴ�. ��� �����Ͻó���??", "������", curdate(), "http://", "http://");
INSERT INTO topic (keyword_id, content, writer, date, photo, address) VALUES (5, "������ �뱹�� ����� ���۽�Ÿk4�� �ѱ� K-POP���忡 ū ������ �ҷ� ����Ų�ٰ� �����մϴ�. �� ���𸶴� �Ƿ����� �������� ������ �ְ�, ��û���� ���� ���ð��� �ְ� ����ϰ� �ֽ��ϴ�.... ��¼����¼��...", "��â��", curdate(), "http://", "http://");
INSERT INTO topic (keyword_id, content, writer, date, photo, address) VALUES (5, "���۽�Ÿk ��ճ���???", "�̰���", curdate(), "http://", "http://");
INSERT INTO topic (keyword_id, content, writer, date, photo, address) VALUES (5, "���۽�Ÿk ���� �̱�� ��������??", "�ڼ���", curdate(), "http://", "http://");
INSERT INTO topic (keyword_id, content, writer, date, photo, address) VALUES (1, "��ö�� ����� �ĺ��� ���̾��� �������� ��� �����Ͻó���??", "�̰���", curdate(), "http://", "http://");
INSERT INTO topic (keyword_id, content, writer, date, photo, address) VALUES (1, "����� ���� �ɱ��?? ��ö��, ������ ,�ڱ���??", "�ڼ���", curdate(), "http://", "http://");


INSERT INTO opinion (topic_id, content, writer, position, date) VALUES (2, "�αⰡ ������ ����� �Ǵ°� �翬�ѹ�~~�� ������ ���ٰ� ������ ��̸� ������ ����", "�ڼ���", "����", curdate());
INSERT INTO opinion (topic_id, content, writer, position, date) VALUES (2, "��̾��� �ֵ鵵 ������ ���ϱ�..", "�̰���", "�ݴ�", curdate());
INSERT INTO opinion (topic_id, content, writer, position, date) VALUES (2, "�����!! �����ض�!! ���ġġ������ ���� �׸�����?? �̽�ö �Ǥ�", "������", "�ݴ�", curdate());
INSERT INTO opinion (topic_id, content, writer, position, date) VALUES (2, "���¿�� �� ������! ���ؿ��� Ż����Ű��!", "������", "����", curdate());


INSERT INTO reply (opinion_id, content, writer, date) VALUES (1, "�����մϴ�", "��â��", curdate());
INSERT INTO reply (opinion_id, content, writer, date) VALUES (1, "������", "������", curdate());
INSERT INTO reply (opinion_id, content, writer, date) VALUES (1, "�� ����..", "��â��", curdate());
INSERT INTO reply (opinion_id, content, writer, date) VALUES (1, "������..", "������", curdate());
INSERT INTO reply (opinion_id, content, writer, date) VALUES (2, "�����մϴ�", "�ڼ���", curdate());
INSERT INTO reply (opinion_id, content, writer, date) VALUES (2, "������", "�̰���", curdate());
INSERT INTO reply (opinion_id, content, writer, date) VALUES (2, "�� ����..", "�ڼ���", curdate());
INSERT INTO reply (opinion_id, content, writer, date) VALUES (2, "������..", "�̰���", curdate());
INSERT INTO reply (opinion_id, content, writer, date) VALUES (3, "�����մϴ�", "��â��", curdate());
INSERT INTO reply (opinion_id, content, writer, date) VALUES (3, "������", "������", curdate());
INSERT INTO reply (opinion_id, content, writer, date) VALUES (3, "�� ����..", "��â��", curdate());
INSERT INTO reply (opinion_id, content, writer, date) VALUES (3, "������..", "������", curdate());
INSERT INTO reply (opinion_id, content, writer, date) VALUES (4, "�����մϴ�", "�ڼ���", curdate());
INSERT INTO reply (opinion_id, content, writer, date) VALUES (4, "������", "�̰���", curdate());
INSERT INTO reply (opinion_id, content, writer, date) VALUES (4, "�� ����..", "�ڼ���", curdate());
INSERT INTO reply (opinion_id, content, writer, date) VALUES (4, "������..", "�̰���", curdate());