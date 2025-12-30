DROP DATABASE IF EXISTS hairshop;
CREATE DATABASE IF NOT EXISTS hairshop;
USE hairshop;

-- 1. 회원 테이블 (signup_customer.jsp 반영)
--cho 기존 테이블 삭제 구문 추가
DROP TABLE IF EXISTS users;
CREATE TABLE `users` (
	`no`	INT	NOT NULL AUTO_INCREMENT PRIMARY KEY	COMMENT 'PK',
	`id`	VARCHAR(100)	NOT NULL UNIQUE	COMMENT '아이디',
	`password`	VARCHAR(100)	NOT NULL	COMMENT '비밀번호',
	`email`	VARCHAR(100)	NOT NULL	COMMENT '이메일',
	`full_name`	VARCHAR(100)	NOT NULL	COMMENT '이름',
	`birth`	DATETIME	NOT NULL	COMMENT '생년월일',
	`gender`	VARCHAR(100)	NOT NULL	COMMENT '성별',
	`nationality`	VARCHAR(100)	NOT NULL	COMMENT '국적',
	`phonenumber`	VARCHAR(100)	NOT NULL	COMMENT '전화번호',
	`created_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '등록일자',
	`updated_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP	COMMENT '수정 일자'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--cho 기존 테이블 삭제 및 JSP 폼의 상세 필드(사업자번호, 지역 등) 반영
DROP TABLE IF EXISTS designer;
CREATE TABLE `designer` (
	`no`	INT	NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`id`	VARCHAR(100)	NOT NULL UNIQUE,
	`password`	VARCHAR(100)	NOT NULL,
	`email`	VARCHAR(100)	NOT NULL,
	`full_name`	VARCHAR(100)	NOT NULL,
	`birth`	TIMESTAMP	NOT NULL,
	`gender`	VARCHAR(100)	NOT NULL,
	`nationality`	VARCHAR(100)	NOT NULL,
	`phonenumber`	VARCHAR(100)	NOT NULL,
	`shop_name`	VARCHAR(100)	NOT NULL,
    `biz_num`	VARCHAR(100)	NOT NULL,
    `city`	VARCHAR(100)	NOT NULL,
    `district`	VARCHAR(100)	NOT NULL,
    `addr_detail`	VARCHAR(100)	NOT NULL,
	`created_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP,
	`updated_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS style;
CREATE TABLE `style` (
	`no`	INT	NOT NULL AUTO_INCREMENT PRIMARY KEY	COMMENT 'PK',
	`name`	VARCHAR(100)	NOT NULL	COMMENT '시술 이름',
	`price`	INT	NOT NULL	COMMENT '시술 가격',
	`created_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '등록 일자'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS reserved;
CREATE TABLE `reserved` (
	`no`	INT	NOT NULL AUTO_INCREMENT PRIMARY KEY	COMMENT 'PK',
	`user_no`	INT	NOT NULL	COMMENT '회원FK',
	`designer_no`	INT	NOT NULL	COMMENT '디자이너 FK',
	`style_no`	INT	NOT NULL	COMMENT '스타일 FK',
	`date`	TIMESTAMP	NOT NULL	COMMENT '예약 날짜',
	`time`	TIMESTAMP	NOT NULL	COMMENT '예약시간',
	`etc`	TEXT	NULL	COMMENT '특이 사항',

	`phonenumber`	VARCHAR(20)	NOT NULL	COMMENT '전화번호',
	`price`	INT	NOT NULL	COMMENT '시술 가격',
	`created_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '등록일자',
	`updated_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP	COMMENT '수정일자',
    FOREIGN KEY (`user_no`) REFERENCES `users` (`no`),
    FOREIGN KEY (`designer_no`) REFERENCES `designer` (`no`),
    FOREIGN KEY (`style_no`) REFERENCES `style` (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS board;
CREATE TABLE `board` (
	`no`	INT	NOT NULL AUTO_INCREMENT PRIMARY KEY	COMMENT 'PK',
	`user_no`	INT	NOT NULL	COMMENT '작성자  FK',
	`designer_no`	INT	NOT NULL	COMMENT '매장명FK',
	`title`	VARCHAR(100)	NOT NULL	COMMENT '제목',
	`content`	TEXT	NOT NULL	COMMENT '내용',
	`created_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '등록일자',
	`updated_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP	COMMENT '수정일자',

FOREIGN KEY (`user_no`) REFERENCES `users` (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS comment;
CREATE TABLE `comment` (
	`no`	INT	AUTO_INCREMENT PRIMARY KEY COMMENT 'PK',
	`board_no` INT NOT NULL UNIQUE COMMENT '게시판 FK',
	`designer_no`	INT	NOT NULL	COMMENT '작성자 FK',
	`content` TEXT NOT NULL COMMENT '내용',
	`created_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '작성일자',
	`updated_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP	COMMENT '수정일자',

	FOREIGN KEY (`board_no`) REFERENCES `board` (`no`),
    FOREIGN KEY (`designer_no`) REFERENCES `designer` (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 1. 리뷰 테이블
--cho 예약 완료된 서비스에 대해 1건의 리뷰만 작성 가능하도록 UNIQUE 보완
DROP TABLE IF EXISTS review;
CREATE TABLE `review` (
	`no`			INT	NOT NULL AUTO_INCREMENT PRIMARY KEY	COMMENT 'PK',
	`reserved_no`	INT	NOT NULL UNIQUE	COMMENT '예약번호 UK,FK',
	`designer_no`	INT	NOT NULL	COMMENT '디자이너 FK',
	`content`	TEXT	NOT NULL	COMMENT '리뷰 내용',
	`created_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '등록일자',
	`updated_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP	COMMENT '등록일자',

    CONSTRAINT `FK_reserved_TO_review_1` FOREIGN KEY (`reserved_no`) REFERENCES `reserved` (`no`),
    FOREIGN KEY (`designer_no`) REFERENCES `designer` (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO designer (id, password, email, full_name, birth, gender, nationality, phonenumber, shop_name, biz_num, city, district, addr_detail)
VALUES 
('designer1', '1234', 'designer1@test.com', '홍길동', CURRENT_TIMESTAMP, 'M', 'local', '010-1111-2222', '강남점', '123-45-67890', '서울', '강남구', '테헤란로 123'),
('designer_ko', '1234', 'ko@test.com', '김조은', CURRENT_TIMESTAMP, 'F', 'local', '010-1111-1111', '인천 부평점', '123-45-67890', '인천', '부평구', '부평동 123'),
('designer_park', '1234', 'park@test.com', '박한별', CURRENT_TIMESTAMP, 'F', 'local', '010-2222-2222', '인천 부평점', '123-45-67890', '인천', '부평구', '부평동 123'),
('designer_lee', '1234', 'lee@test.com', '이민지', CURRENT_TIMESTAMP, 'F', 'local', '010-3333-3333', '인천 부평점', '123-45-67890', '인천', '부평구', '부평동 123');

INSERT INTO style (name, price) VALUES ('커트', 20000), ('펌', 80000), ('염색', 60000);

-- 2) 일반 사용자 샘플
INSERT INTO users (id, password, email, full_name, birth, gender, nationality, phonenumber)
VALUES ('testuser', '1234', 'test@test.com', '테스트유저', '1999-01-01 00:00:00', 'M', 'local', '010-1234-1234');

INSERT INTO board (user_no, designer_no, title, content)
VALUES (1, 1, '첫 번째 문의글입니다', '예약 관련 문의드립니다.');

INSERT INTO reserved (user_no, designer_no, style_no, date, time, phonenumber, price)
VALUES (1, 1, 1, '2025-11-15 00:00:00', '2025-11-15 14:00:00', '010-1234-1234', 20000);

-- 3) 실제 리뷰 데이터 샘플 (리뷰 리스트 확인용)
INSERT INTO review (reserved_no, designer_no, content)
VALUES (1, 1, '디자이너님이 정말 친절하시고 머리도 마음에 들게 잘 잘라주셨어요! 추천합니다.');
