use donghaemongdb;

drop table if exists Users;
drop table if exists Mbti;
drop table if exists Travel;
drop table if exists Stamp;
drop table if exists Stations;

create table Mbti (
	id INT PRIMARY KEY,
	isRich CHAR(2),
    isNative CHAR(3),
    isCity CHAR(2),
    isAlone CHAR(2),
    UNIQUE (isRich, isNative, isCity, isAlone)
);

create table Users (
  userid	INTEGER AUTO_INCREMENT PRIMARY KEY,
  nickname	VARCHAR(40) NOT NULL,
  age INTEGER,
  
  mbti_id INTEGER,
  FOREIGN KEY (mbti_id) REFERENCES Mbti(id),
  
  score	INTEGER DEFAULT 0,
  
  hasChild BOOLEAN DEFAULT false,
  isDisabled BOOLEAN DEFAULT false,
  isVegetarian BOOLEAN DEFAULT false,
  isHalal BOOLEAN DEFAULT false
);

create table Stations (
	id INTEGER AUTO_INCREMENT PRIMARY KEY,
    station_name VARCHAR(10),
    ranking INTEGER,
    score INTEGER,
    UNIQUE(station_name)
);

create table Stamp (
	id INTEGER PRIMARY KEY,
    loc_name VARCHAR(15),
    
	latitude INTEGER NOT NULL,
    longitude INTEGER NOT NULL,
	CONSTRAINT location UNIQUE (latitude, longitude),
    
    type_id INTEGER NOT NULL,
    
    station INTEGER,
    FOREIGN KEY (station) REFERENCES Stations(id)
);

create table Travel (
	user_id INT PRIMARY KEY,
    
    start_date DATE,
    end_date DATE,
    
    travel_days INT AS (DATEDIFF(end_date, start_date)+1) VIRTUAL
);

create table StampChoice (
	user_id INT,
    stamp_id INT,
    
    CONSTRAINT stamp PRIMARY KEY (user_id, stamp_id)
);

INSERT INTO Mbti VALUES (1, true, true, true, true);
INSERT INTO Mbti VALUES (2, true, true, true, false);
INSERT INTO Mbti VALUES (3, true, true, false, true);
INSERT INTO Mbti VALUES (4, true, true, false, false);
INSERT INTO Mbti VALUES (5, true, false, true, true);
INSERT INTO Mbti VALUES (6, true, false, true, false);
INSERT INTO Mbti VALUES (7, true, false, false, true);
INSERT INTO Mbti VALUES (8, true, false, false, false);
INSERT INTO Mbti VALUES (9, false, true, true, true);
INSERT INTO Mbti VALUES (10, false, true, true, false);
INSERT INTO Mbti VALUES (11, false, true, false, true);
INSERT INTO Mbti VALUES (12, false, true, false, false);
INSERT INTO Mbti VALUES (13, false, false, true, true);
INSERT INTO Mbti VALUES (14, false, false, true, false);
INSERT INTO Mbti VALUES (15, false, false, false, true);
INSERT INTO Mbti VALUES (16, false, false, false, false);


INSERT INTO Stations VALUES (1, "부전", 3, 3);
INSERT INTO Stations VALUES (2, "거제해맞이", 17, 8);
INSERT INTO Stations VALUES (3, "거제", 10, 5);
INSERT INTO Stations VALUES (4, "교대", 2, 1);
INSERT INTO Stations VALUES (5, "동래", 15, 8);
INSERT INTO Stations VALUES (6, "안락", 12, 7);
INSERT INTO Stations VALUES (7, "부산원동", 11, 7);
INSERT INTO Stations VALUES (8, "재송", 14, 8);
INSERT INTO Stations VALUES (9, "센텀", 9, 5);
INSERT INTO Stations VALUES (10, "벡스코", 1, 1);
INSERT INTO Stations VALUES (11, "신해운대", 7, 5);
INSERT INTO Stations VALUES (12, "송정", 13, 7);
INSERT INTO Stations VALUES (13, "오시리아", 8, 5);
INSERT INTO Stations VALUES (14, "기장", 5, 3);
INSERT INTO Stations VALUES (15, "일광", 6, 5);
INSERT INTO Stations VALUES (16, "좌천", 16, 8);
INSERT INTO Stations VALUES (17, "월내", 19, 10);
INSERT INTO Stations VALUES (18, "서생", 20, 10);
INSERT INTO Stations VALUES (19, "남창", 18, 8);
INSERT INTO Stations VALUES (20, "망양", 22, 10);
INSERT INTO Stations VALUES (21, "덕하", 21, 10);
INSERT INTO Stations VALUES (22, "개운포", 23, 10);
INSERT INTO Stations VALUES (23, "태화강", 4, 3);