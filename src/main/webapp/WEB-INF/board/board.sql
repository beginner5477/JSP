show databases;
show tables;
CREATE TABLE board (
	idx INT NOT NULL PRIMARY KEY AUTO_INCREMENT,	/*게시글의 고유번호*/
	mid VARCHAR(20) NOT NULL,
	nickName VARCHAR(20) NOT NULL ,
	title VARCHAR(100) NOT NULL,
	content TEXT NOT NULL,
	readNum INT DEFAULT 0,
	hostIp VARCHAR(40) NOT NULL,
	openSw CHAR(3) DEFAULT 'OK',
	wDate DATETIME DEFAULT NOW(),
	good INT DEFAULT 0,
	FOREIGN KEY(mid) REFERENCES member(mid)
);
DESC board;
DROP TABLE board;
INSERT INTO board VALUES(DEFAULT,'admin','관리촤','게시판 서비스 개시','시작합니당~~~',DEFAULT,'192.168.50.63',DEFAULT,DEFAULT,DEFAULT);
SELECT * FROM board;
DESC member;