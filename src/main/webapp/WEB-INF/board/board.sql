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

SELECT *, TIMESTAMPDIFF(HOUR,wDate,NOW()) AS hourDiff FROM board;
SELECT *, DATEDIFF(wDate,NOW()) AS date_diff FROM board;
SELECT idx,title FROM board WHERE idx > 9 ORDER BY idx ASC LIMIT 1;	/*다음글1개*/
SELECT idx,title FROM board WHERE idx < 9 ORDER BY idx DESC LIMIT 1;	/*이전글1개*/

/*댓글 달기*/
CREATE TABLE boardReply (
	idx INT NOT NULL AUTO_INCREMENT,
	boardIdx INT NOT NULL,
	mid VARCHAR(20) NOT NULL,
	nickName VARCHAR(20) NOT NULL,
	wDate datetime DEFAULT NOW(),
	hostIp VARCHAR(50) NOT NULL,
	content TEXT NOT NULL,
	PRIMARY KEY(idx),
	FOREIGN KEY(boardIdx) REFERENCES board(idx)
	ON UPDATE CASCADE ON DELETE RESTRICT
);
SHOW TABLES;
INSERT INTO boardReply VALUES(DEFAULT,10,'kms1234','김장미',DEFAULT,'192.168.50.13','글 참조했습니다.');
SELECT * FROM boardReply;

/*댓글 수 연습*/
SELECT * FROM board ORDER BY idx DESC;
SELECT * FROM boardReply ORDER BY idx DESC;

--서브쿼리 이용해서 다른 테이블에서 값 뽑아오기
SELECT *,(SELECT COUNT(boardIdx)FROM boardReply WHERE boardIdx = b.idx) AS cnt FROM board AS b;

SELECT boardIdx,COUNT(boardIdx) AS replyCnt FROM boardReply WHERE boardIdx = 21;

SHOW TABLES;
SHOW DATABASES;