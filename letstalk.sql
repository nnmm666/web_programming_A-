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



INSERT INTO topic (keyword_id, content, writer, photo) VALUES (1, "안철수 대통령 후보가 어이없게 사퇴한점 어떻게 생각하시나요??", "이가을", "http://");
INSERT INTO topic (keyword_id, content, writer, photo) VALUES (1, "대통령 누가 될까요?? 안철수, 문재인 ,박근혜??", "박세진", "http://");
INSERT INTO topic (keyword_id, content, writer, photo) VALUES (1, "안철수 대통령 후보가 어이없게 사퇴한점 어떻게 생각하시나요??", "이가을", "http://");
INSERT INTO topic (keyword_id, content, writer, photo) VALUES (1, "대통령 누가 될까요?? 안철수, 문재인 ,박근혜??", "박세진", "http://");
INSERT INTO topic (keyword_id, content, writer, photo) VALUES (1, "안철수 대통령 후보가 어이없게 사퇴한점 어떻게 생각하시나요??", "이가을", "http://");
INSERT INTO topic (keyword_id, content, writer, photo) VALUES (1, "대통령 누가 될까요?? 안철수, 문재인 ,박근혜??", "박세진", "http://");

INSERT INTO topic (keyword_id, content, writer, photo) VALUES (2, "이명박대통령 어땟음???", "박세진", "http://");
INSERT INTO topic (keyword_id, content, writer, photo) VALUES (2, "이명박각하 짱임 욕하지 마라", "박세진", "http://");
INSERT INTO topic (keyword_id, content, writer, photo) VALUES (2, "MBOUT!!", "박세진", "http://");
INSERT INTO topic (keyword_id, content, writer, photo) VALUES (2, "역대 최고의 대통령이엇음다???", "박세진", "http://");

INSERT INTO topic (keyword_id, content, writer, photo) VALUES (3, "최초의 대한민국 여성 대통령 잘할거라 믿습니다", "박세진", "http://");
INSERT INTO topic (keyword_id, content, writer, photo) VALUES (3, "독재자의 딸임 어딜 나와 미친것", "박세진", "http://");
INSERT INTO topic (keyword_id, content, writer, photo) VALUES (3, "새누리때매 망함 망햇음 때려쳐 안해", "박세진", "http://");

INSERT INTO topic (keyword_id, content, writer, photo) VALUES (5, "엠넷의 대국민 오디션 슈퍼스타k4가 악마의 편집으로 논란이 끊기지 않습니다. 어떻게 생각하시나요??", "윤나라", "http://");	
INSERT INTO topic (keyword_id, content, writer, photo) VALUES (5, "엠넷의 대국민 오디션 슈퍼스타k4는 한국 K-POP시장에 큰 파장을 불러 일으킨다고 생각합니다. 매 시즌마다 실력좋은 가수들이 나오고 있고, 시청률도 또한 동시간대 최고를 기록하고 있습니다.... 어쩌고저쩌고...", "이창희", "http://");	
INSERT INTO topic (keyword_id, content, writer, photo) VALUES (5, "슈퍼스타k 재밌나요???", "이가을", "http://");
INSERT INTO topic (keyword_id, content, writer, photo) VALUES (5, "슈퍼스타k 누가 이길거 같으세요??", "박세진", "http://");

INSERT INTO topic (keyword_id, content, writer, photo) VALUES (6, "사실 오바마가 4년간 집권하면서 미국 경제 살리기는 커녕 부시가 벌려놓은 일들 뒷바라지 하느라 바빳잖아요. 못한 일은 없지만 딱히 잘한 일도 없는것 같은데 이번엔 미국이 과연 바뀔 수 있을까요?", "이가을", "http://");
INSERT INTO topic (keyword_id, content, writer, photo) VALUES (6, "사실 오바마가 4년간 집권하면서 미국 경제 살리기는 커녕 부시가 벌려놓은 일들 뒷바라지 하느라 바빳잖아요. 못한 일은 없지만 딱히 잘한 일도 없는것 같은데 이번엔 미국이 과연 바뀔 수 있을까요?", "이가을", "http://");
INSERT INTO topic (keyword_id, content, writer, photo) VALUES (6, "사실 오바마가 4년간 집권하면서 미국 경제 살리기는 커녕 부시가 벌려놓은 일들 뒷바라지 하느라 바빳잖아요. 못한 일은 없지만 딱히 잘한 일도 없는것 같은데 이번엔 미국이 과연 바뀔 수 있을까요?", "이가을", "http://");
INSERT INTO topic (keyword_id, content, writer, photo) VALUES (6, "사실 오바마가 4년간 집권하면서 미국 경제 살리기는 커녕 부시가 벌려놓은 일들 뒷바라지 하느라 바빳잖아요. 못한 일은 없지만 딱히 잘한 일도 없는것 같은데 이번엔 미국이 과연 바뀔 수 있을까요?", "이가을", "http://");
INSERT INTO topic (keyword_id, content, writer, photo) VALUES (6, "사실 오바마가 4년간 집권하면서 미국 경제 살리기는 커녕 부시가 벌려놓은 일들 뒷바라지 하느라 바빳잖아요. 못한 일은 없지만 딱히 잘한 일도 없는것 같은데 이번엔 미국이 과연 바뀔 수 있을까요?", "이가을", "http://");

INSERT INTO topic (keyword_id, content, writer, photo) VALUES (11, "잡느님 짱임 갤레기는 갖다버려 아이폰짱", "이창희", "http://");
INSERT INTO topic (keyword_id, content, writer, photo) VALUES (11, "잡느님 짱임 갤레기는 갖다버려 아이폰짱", "이창희", "http://");
INSERT INTO topic (keyword_id, content, writer, photo) VALUES (11, "잡느님 짱임 갤레기는 갖다버려 아이폰짱", "이창희", "http://");



INSERT INTO opinion (topic_id, content, writer, position) VALUES (1, "인기가 있으면 논란이 되는건 당연한법~~뭐 저런거 갖다가 난리냐 재미만 있으면 됏지", "박세진", "찬성");
INSERT INTO opinion (topic_id, content, writer, position) VALUES (1, "재미없음 애들도 예전만 못하구..", "이가을", "반대");
INSERT INTO opinion (topic_id, content, writer, position) VALUES (1, "사기방송!! 종영해라!! 사기치치지말고 이제 그만하지?? 이승철 ㅗㅗ", "윤나라", "반대");
INSERT INTO opinion (topic_id, content, writer, position) VALUES (1, "유승우는 왜 떨구냐! 정준영을 탈락시키자!", "이창희", "찬성");

INSERT INTO opinion (topic_id, content, writer, position) VALUES (2, "인기가 있으면 논란이 되는건 당연한법~~뭐 저런거 갖다가 난리냐 재미만 있으면 됏지", "박세진", "찬성");
INSERT INTO opinion (topic_id, content, writer, position) VALUES (2, "재미없음 애들도 예전만 못하구..", "이가을", "반대");
INSERT INTO opinion (topic_id, content, writer, position) VALUES (2, "사기방송!! 종영해라!! 사기치치지말고 이제 그만하지?? 이승철 ㅗㅗ", "윤나라", "반대");
INSERT INTO opinion (topic_id, content, writer, position) VALUES (2, "유승우는 왜 떨구냐! 정준영을 탈락시키자!", "이창희", "찬성");

INSERT INTO opinion (topic_id, content, writer, position) VALUES (3, "인기가 있으면 논란이 되는건 당연한법~~뭐 저런거 갖다가 난리냐 재미만 있으면 됏지", "박세진", "찬성");
INSERT INTO opinion (topic_id, content, writer, position) VALUES (3, "재미없음 애들도 예전만 못하구..", "이가을", "반대");
INSERT INTO opinion (topic_id, content, writer, position) VALUES (3, "사기방송!! 종영해라!! 사기치치지말고 이제 그만하지?? 이승철 ㅗㅗ", "윤나라", "반대");
INSERT INTO opinion (topic_id, content, writer, position) VALUES (3, "유승우는 왜 떨구냐! 정준영을 탈락시키자!", "이창희", "찬성");

INSERT INTO opinion (topic_id, content, writer, position) VALUES (4, "인기가 있으면 논란이 되는건 당연한법~~뭐 저런거 갖다가 난리냐 재미만 있으면 됏지", "박세진", "찬성");
INSERT INTO opinion (topic_id, content, writer, position) VALUES (4, "재미없음 애들도 예전만 못하구..", "이가을", "반대");
INSERT INTO opinion (topic_id, content, writer, position) VALUES (4, "사기방송!! 종영해라!! 사기치치지말고 이제 그만하지?? 이승철 ㅗㅗ", "윤나라", "반대");
INSERT INTO opinion (topic_id, content, writer, position) VALUES (4, "유승우는 왜 떨구냐! 정준영을 탈락시키자!", "이창희", "찬성");


INSERT INTO reply (opinion_id, content, writer) VALUES (1, "공감합니당", "이창희");
INSERT INTO reply (opinion_id, content, writer) VALUES (1, "개미즐", "윤나라");
INSERT INTO reply (opinion_id, content, writer) VALUES (1, "넵 깨갱..", "이창희");
INSERT INTO reply (opinion_id, content, writer) VALUES (1, "ㅎㅎㅎ..", "윤나라");
INSERT INTO reply (opinion_id, content, writer) VALUES (2, "공감합니당", "박세진");
INSERT INTO reply (opinion_id, content, writer) VALUES (2, "개미즐", "이가을");
INSERT INTO reply (opinion_id, content, writer) VALUES (2, "넵 깨갱..", "박세진");
INSERT INTO reply (opinion_id, content, writer) VALUES (2, "ㅎㅎㅎ..", "이가을");
INSERT INTO reply (opinion_id, content, writer) VALUES (3, "공감합니당", "이창희");
INSERT INTO reply (opinion_id, content, writer) VALUES (3, "개미즐", "윤나라");
INSERT INTO reply (opinion_id, content, writer) VALUES (3, "넵 깨갱..", "이창희");
INSERT INTO reply (opinion_id, content, writer) VALUES (3, "ㅎㅎㅎ..", "윤나라");
INSERT INTO reply (opinion_id, content, writer) VALUES (4, "공감합니당", "박세진");
INSERT INTO reply (opinion_id, content, writer) VALUES (4, "개미즐", "이가을");
INSERT INTO reply (opinion_id, content, writer) VALUES (4, "넵 깨갱..", "박세진");
INSERT INTO reply (opinion_id, content, writer) VALUES (4, "ㅎㅎㅎ..", "이가을");
INSERT INTO reply (opinion_id, content, writer) VALUES (5, "되되되되되되되되되되되되되되되되", "박세진");
INSERT INTO reply (opinion_id, content, writer) VALUES (5, "안되거든안되거든안되거든", "이가을");
INSERT INTO reply (opinion_id, content, writer) VALUES (5, "안됨절대반대안됨절대반대안됨절대반대안됨절대반대", "윤나라");
INSERT INTO reply (opinion_id, content, writer) VALUES (5, "될거같음될거같음될거같음될거같음될거같음", "이창희");
INSERT INTO reply (opinion_id, content, writer) VALUES (6, "되되되되되되되되되되되되되되되되", "박세진");
INSERT INTO reply (opinion_id, content, writer) VALUES (6, "안되거든안되거든안되거든", "이가을");
INSERT INTO reply (opinion_id, content, writer) VALUES (6, "안됨절대반대안됨절대반대안됨절대반대안됨절대반대", "윤나라");
INSERT INTO reply (opinion_id, content, writer) VALUES (6, "될거같음될거같음될거같음될거같음될거같음", "이창희");
INSERT INTO reply (opinion_id, content, writer) VALUES (7, "되되되되되되되되되되되되되되되되", "박세진");
INSERT INTO reply (opinion_id, content, writer) VALUES (7, "안되거든안되거든안되거든", "이가을");
INSERT INTO reply (opinion_id, content, writer) VALUES (7, "안됨절대반대안됨절대반대안됨절대반대안됨절대반대", "윤나라");
INSERT INTO reply (opinion_id, content, writer) VALUES (7, "될거같음될거같음될거같음될거같음될거같음", "이창희");
