SHOW DATABASES;

CREATE TABLE pds (
	idx INT NOT NULL AUTO_INCREMENT,
	mid VARCHAR(20) NOT NULL,
	nickName VARCHAR(20) NOT NULL,
	fName VARCHAR(200) NOT NULL,
	fSName VARCHAR(200) NOT NULL,	/*실제 서버에 저장되는 파일명*/
	fSize INT NOT NULL,
	title VARCHAR(100) NOT NULL,
	part VARCHAR(20) NOT NULL,		/*파일의 주제에 따른 분류*/
	fDate DATETIME DEFAULT NOW(),	/*업로드한 날짜*/
	downNum	INT DEFAULT 0,
	openSw CHAR(3) DEFAULT '공개',
	hostIp VARCHAR(30) NOT NULL,
	pwd	VARCHAR(100),	/*파일 비공개시 암호 입력하면 다운가능하게???*/
	
	
	content TEXT,	/*업로드한 파일의 세부설명*/
	PRIMARY KEY(idx),
	FOREIGN KEY(mid) REFERENCES member(mid)
);

DESC pds;
SELECT * FROM pds;

CREATE TABLE memberChat(
	idx INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nickName VARCHAR(20) NOT NULL,
	chat VARCHAR(100) NOT NULL
);
DESC memberChat;
INSERT INTO memberChat VALUES (DEFAULT,'admin',"하이용1");
INSERT INTO memberChat VALUES (DEFAULT,'ㅇㅇㅇ',"하이용2");
INSERT INTO memberChat VALUES (DEFAULT,'admㅁㅁin',"하이용3");
INSERT INTO memberChat VALUES (DEFAULT,'ㅁㅁ',"하이용2");
INSERT INTO memberChat VALUES (DEFAULT,'ㅁㅁ',"하이용1");
INSERT INTO memberChat VALUES (DEFAULT,'ㅇㅇㅇ',"하이용4");
INSERT INTO memberChat VALUES (DEFAULT,'admin',"하이용56");
INSERT INTO memberChat VALUES (DEFAULT,'admin',"하이용7");
INSERT INTO memberChat VALUES (DEFAULT,'ㅇㅇㅇ',"하이용8");
INSERT INTO memberChat VALUES (DEFAULT,'admin',"하이용9");
INSERT INTO memberChat VALUES (DEFAULT,'admin',"하이용0");
INSERT INTO memberChat VALUES (DEFAULT,'ㅇㅇㅇ',"하이용1");
INSERT INTO memberChat VALUES (DEFAULT,'admin',"하이용2");
INSERT INTO memberChat VALUES (DEFAULT,'ㅁㅁㅁ',"하이용3");
SELECT * FROM memberChat ORDER BY idx DESC LIMIT 11;
SELECT m.* FROM (SELECT * FROM memberChat ORDER BY idx DESC LIMIT 11) AS m ORDER BY idx ASC;