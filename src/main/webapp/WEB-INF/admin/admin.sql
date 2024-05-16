show databases;
show tables;

CREATE TABLE complaint(
	idx INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	part VARCHAR(15) NOT NULL,	/*신고 위치*/
	partIdx INT NOT NULL,	/*신고 위치의 고유 번호 */
	cpMid VARCHAR(20) NOT NULL,	/*신고한 사람의 아이디*/
	cpContent text NOT NULL,	/*신고 사유*/
	cpDate DATETIME DEFAULT NOW()
);
DESC complaint;
INSERT INTO complaint VALUES(DEFAULT,'board',21,'aaaa1234','이상함',DEFAULT);
SELECT * FROM complaint;
SELECT c.*, b.title, b.nickName, b.mid, b.content FROM complaint c, board b WHERE c.partIdx = b.idx;
SELECT c.*, DATE_FORMAT(c.cpDate, '%Y-%m-%d %H:%i') AS cpDate, b.title, b.nickName, b.mid, b.content FROM complaint c, board b WHERE c.partIdx = b.idx;