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


