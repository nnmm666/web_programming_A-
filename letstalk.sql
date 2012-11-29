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


INSERT INTO keyword (keyword, weight, type, date) VALUES ("안철수", 500, "reg", curdate());
INSERT INTO keyword (keyword, weight, type, date) VALUES ("이명박", 500, "reg", curdate());
INSERT INTO keyword (keyword, weight, type, date) VALUES ("박근혜", 500, "reg", curdate());
INSERT INTO keyword (keyword, weight, type, date) VALUES ("문재인", 500, "reg", curdate());
INSERT INTO keyword (keyword, weight, type, date) VALUES ("슈퍼스타k4", 500, "reg", curdate());
INSERT INTO keyword (keyword, weight, type, date) VALUES ("오바마", 500, "reg", curdate());
INSERT INTO keyword (keyword, weight, type, date) VALUES ("한글날", 500, "reg", curdate());
INSERT INTO keyword (keyword, weight, type, date) VALUES ("타블로", 500, "reg", curdate());
INSERT INTO keyword (keyword, weight, type, date) VALUES ("묻지마 폭행", 500, "reg", curdate());
INSERT INTO keyword (keyword, weight, type, date) VALUES ("윈도우8", 500, "reg", curdate());
INSERT INTO keyword (keyword, weight, type, date) VALUES ("스티브잡스", 500, "reg", curdate());


INSERT INTO topic (keyword_id, content, writer, date, photo, address) VALUES (5, "엠넷의 대국민 오디션 슈퍼스타k4가 악마의 편집으로 논란이 끊기지 않습니다. 어떻게 생각하시나요??", "윤나라", curdate(), "http://", "http://");
INSERT INTO topic (keyword_id, content, writer, date, photo, address) VALUES (5, "엠넷의 대국민 오디션 슈퍼스타k4는 한국 K-POP시장에 큰 파장을 불러 일으킨다고 생각합니다. 매 시즌마다 실력좋은 가수들이 나오고 있고, 시청률도 또한 동시간대 최고를 기록하고 있습니다.... 어쩌고저쩌고...", "이창희", curdate(), "http://", "http://");
INSERT INTO topic (keyword_id, content, writer, date, photo, address) VALUES (5, "슈퍼스타k 재밌나요???", "이가을", curdate(), "http://", "http://");
INSERT INTO topic (keyword_id, content, writer, date, photo, address) VALUES (5, "슈퍼스타k 누가 이길거 같으세요??", "박세진", curdate(), "http://", "http://");
INSERT INTO topic (keyword_id, content, writer, date, photo, address) VALUES (1, "안철수 대통령 후보가 어이없게 사퇴한점 어떻게 생각하시나요??", "이가을", curdate(), "http://", "http://");
INSERT INTO topic (keyword_id, content, writer, date, photo, address) VALUES (1, "대통령 누가 될까요?? 안철수, 문재인 ,박근혜??", "박세진", curdate(), "http://", "http://");


INSERT INTO opinion (topic_id, content, writer, position, date) VALUES (2, "인기가 있으면 논란이 되는건 당연한법~~뭐 저런거 갖다가 난리냐 재미만 있으면 됏지", "박세진", "찬성", curdate());
INSERT INTO opinion (topic_id, content, writer, position, date) VALUES (2, "재미없음 애들도 예전만 못하구..", "이가을", "반대", curdate());
INSERT INTO opinion (topic_id, content, writer, position, date) VALUES (2, "사기방송!! 종영해라!! 사기치치지말고 이제 그만하지?? 이승철 ㅗㅗ", "윤나라", "반대", curdate());
INSERT INTO opinion (topic_id, content, writer, position, date) VALUES (2, "유승우는 왜 떨구냐! 정준영을 탈락시키자!", "강기태", "찬성", curdate());


INSERT INTO reply (opinion_id, content, writer, date) VALUES (1, "공감합니당", "이창희", curdate());
INSERT INTO reply (opinion_id, content, writer, date) VALUES (1, "개미즐", "윤나라", curdate());
INSERT INTO reply (opinion_id, content, writer, date) VALUES (1, "넵 깨갱..", "이창희", curdate());
INSERT INTO reply (opinion_id, content, writer, date) VALUES (1, "ㅎㅎㅎ..", "윤나라", curdate());
INSERT INTO reply (opinion_id, content, writer, date) VALUES (2, "공감합니당", "박세진", curdate());
INSERT INTO reply (opinion_id, content, writer, date) VALUES (2, "개미즐", "이가을", curdate());
INSERT INTO reply (opinion_id, content, writer, date) VALUES (2, "넵 깨갱..", "박세진", curdate());
INSERT INTO reply (opinion_id, content, writer, date) VALUES (2, "ㅎㅎㅎ..", "이가을", curdate());
INSERT INTO reply (opinion_id, content, writer, date) VALUES (3, "공감합니당", "이창희", curdate());
INSERT INTO reply (opinion_id, content, writer, date) VALUES (3, "개미즐", "윤나라", curdate());
INSERT INTO reply (opinion_id, content, writer, date) VALUES (3, "넵 깨갱..", "이창희", curdate());
INSERT INTO reply (opinion_id, content, writer, date) VALUES (3, "ㅎㅎㅎ..", "윤나라", curdate());
INSERT INTO reply (opinion_id, content, writer, date) VALUES (4, "공감합니당", "박세진", curdate());
INSERT INTO reply (opinion_id, content, writer, date) VALUES (4, "개미즐", "이가을", curdate());
INSERT INTO reply (opinion_id, content, writer, date) VALUES (4, "넵 깨갱..", "박세진", curdate());
INSERT INTO reply (opinion_id, content, writer, date) VALUES (4, "ㅎㅎㅎ..", "이가을", curdate());