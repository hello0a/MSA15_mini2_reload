
-- 리뷰 테이블 생성
drop table if exists review;
CREATE TABLE `review` (
	`no`			INT	AUTO_INCREMENT primary key	COMMENT 'PK',
	`reserved_no`	INT	NOT NULL	COMMENT '예약번호 UK,FK',
	`designer_no`	INT	NOT NULL	COMMENT '디자이너 FK',
	`content`	TEXT	NOT NULL	COMMENT '리뷰 내용',
	`created_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '등록일자',
	`updated_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP	COMMENT '등록일자'
);


-- 회원 테이블 생성
drop table if exists users;
CREATE TABLE `users` (
	`no`	 INT	AUTO_INCREMENT primary key	COMMENT 'PK',
	`id`	VARCHAR(100)	NOT NULL	COMMENT '아이디',
	`password`	VARCHAR(100)	NOT NULL	COMMENT '비밀번호',
	`email`	VARCHAR(100)	NOT NULL	COMMENT '이메일',
	`full_name`	VARCHAR(100)	NOT NULL	COMMENT '이름',
	`birth`	DATETIME	NOT NULL	COMMENT '생년월일',
	`gender`	VARCHAR(100)	NOT NULL	COMMENT '성별',
	`nationality`	VARCHAR(100)	NOT NULL	COMMENT '국적',
	`phonenumber`	VARCHAR(100)	NOT NULL	COMMENT '전화번호',
	`created_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '등록일자',
	`updated_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP	COMMENT '수정 일자'
);

-- 예약 테이블 생성
drop table if exists reserved;
CREATE TABLE `reserved` (
	`no`	INT	AUTO_INCREMENT	 primary key COMMENT 'PK',
	`user_no`	INT	NOT NULL	COMMENT '회원FK',
	`designer_no`	INT	NOT NULL	COMMENT '디자이너 FK',
	`style_no`	INT	NOT NULL	COMMENT '스타일 FK',
	`date`	TIMESTAMP	NOT NULL	COMMENT '예약 날짜',
	`time`	TIMESTAMP	NOT NULL	COMMENT '예약시간',
	`etc`	TEXT	NULL	COMMENT '특이 사항',
	`phonenumber`	INT	NOT NULL	COMMENT '전화번호',
	`price`	INT	NOT NULL	COMMENT '시술 가격',
	`created_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '등록일자',
	`updated_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP	COMMENT '수정일자'
);
-- 헤어디자이너 테이블 생성
drop table if exists designer;
CREATE TABLE `designer` (
	`no`	INT	AUTO_INCREMENT primary key	COMMENT 'PK',
	`name`	VARCHAR(100)	NOT NULL	COMMENT '아이디',
	`password`	VARCHAR(100)	NOT NULL	COMMENT '비밀번호',
	`email`	VARCHAR(100)	NOT NULL	COMMENT '이메일',
	`full_name`	VARCHAR(100)	NOT NULL	COMMENT '미용사 이름',
	`birth`	TIMESTAMP	NOT NULL	COMMENT '생년월일',
	`gender`	BOOLEAN	NOT NULL	COMMENT '성별',
	`nationality`	BOOLEAN	NOT NULL	COMMENT '국적',
	`number`	INT	NOT NULL	COMMENT '번호',
	`shop_name`	varchar(200)	NOT NULL	COMMENT '매장명',
	`location`	VARCHAR(200)	NOT NULL	COMMENT '위치',
	`created_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '등록 일자',
	`updated_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP	COMMENT '수정일자'
);
-- 헤어 시술 테이블 생성
drop table if exists style;
CREATE TABLE `style` (
	`no`	INT	AUTO_INCREMENT primary key COMMENT 'PK',
	`name`	VARCHAR(100)	NOT NULL	COMMENT '시술 이름',
	`price`	INT	NOT NULL	COMMENT '시술 가격',
	`created_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '등록 일자'
);
-- 문의게시판 테이블 생성
drop table if exists board;
CREATE TABLE `board` (
	`no`	INT	AUTO_INCREMENT primary key COMMENT 'PK',
	`user_no`	INT	NOT NULL	COMMENT '작성자  FK',
	`designer_no`	INT	NOT NULL	COMMENT '매장명FK',
	`title`	VARCHAR(100)	NOT NULL	COMMENT '제목',
	`content`	TEXT	NOT NULL	COMMENT '내용',
	`created_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '등록일자',
	`updated_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP	COMMENT '수정일자'
);

drop table if exists comment;
CREATE TABLE `comment` (
	`no`	INT	AUTO_INCREMENT primary key COMMENT 'PK',
	`board_no` int not null UNIQUE comment '게시판 FK',
	`designer_no`	INT	NOT NULL	COMMENT '작성자 FK',
	`content` TEXT not null comment '내용',
	`created_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '작성일자',
	`updated_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP	COMMENT '수정일자'
);


INSERT INTO designer (name, password, email, full_name, birth, gender, nationality, number, shop_name, location)
VALUES 
('designer1', '1234', 'designer1@test.com', '홍길동', '1990-01-01', 1, 1, 101, '강남점', '서울 강남구'),
('designer2', '1234', 'designer2@test.com', '김철수', '1992-05-01', 0, 1, 102, '압구정점', '서울 강남구');

-- 샘플 게시글 데이터
INSERT INTO board (user_no, designer_no, title, content)
VALUES (1, 1, '첫 번째 문의글입니다', '예약 관련 문의드립니다.'),
       (1, 2, '두 번째 문의글입니다', '시술 관련 문의드립니다.');

INSERT INTO users (id, password, email, full_name, birth, gender, nationality, phonenumber)
VALUES ('testuser', '1234', 'test@test.com', '테스트유저', '1999-01-01', 'M', 'KR', '01012341234');

select * from designer;

select * from board;
SELECT c.*, d.full_name
FROM comment c
JOIN designer d ON c.designer_no = d.no
WHERE c.board_no = 3;

