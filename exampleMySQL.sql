create database `student test asus`;
use `student test asus`;
create table student (
                         RN int not null primary key auto_increment,
                         Name varchar(50) not null,
                         Age tinyint not null
);

create table test (
                      TestID int not null primary key auto_increment,
                      Name varchar(50) not null
);

create table StudentTest (
                             RN int not null,
                             TestID int not null,
                             Date datetime not null,
                             Mark float not null,
                             foreign key(RN) references student (RN),
                             foreign key (TestID) references test(TestID)
);


insert into student(RN,Name,Age) value(1,'Nguyen Hong Ha',20);
insert into student(RN,Name,Age) value(2,'Truong Ngoc Anh',30);
insert into student(RN,Name,Age) value(3,'Tuan Minh',25);
insert into student(RN,Name,Age) value(4,'Dan Truong',22);

select * from student;

insert into test(Name) value ('EPC');
insert into test(Name) value ('DWMX');
insert into test(Name) value ('SQL1');
insert into test(Name) value ('SQL2');

select * from test;

insert into StudentTest (RN,TestID,Date,Mark) value (1,1,'2016-7-17',8);
insert into StudentTest (RN,TestID,Date,Mark) value (1,2,'2016-7-18',5);
insert into StudentTest (RN,TestID,Date,Mark) value (1,3,'2016-7-19',7);
insert into StudentTest (RN,TestID,Date,Mark) value (2,1,'2016-7-17',7);
insert into StudentTest (RN,TestID,Date,Mark) value (2,2,'2016-7-18',4);
insert into StudentTest (RN,TestID,Date,Mark) value (2,3,'2016-7-19',2);
insert into StudentTest (RN,TestID,Date,Mark) value (3,1,'2016-7-17',10);
insert into StudentTest (RN,TestID,Date,Mark) value (3,3,'2016-7-18',1);

select * from studenttest;

-- Question 2

alter table student add check (15 < Age < 55);
alter table StudentTest alter Mark set default '0';
alter table test add unique (Name);
alter table test drop constraint Name;

-- Question 3

ALTER TABLE studentTest MODIFY COLUMN mark INT NOT NULL DEFAULT 0;
-- ALTER TABLE studentTest MODIFY COLUMN RN INT NOT NULL PRIMARY KEY ;
-- ALTER TABLE studentTest MODIFY COLUMN testID INT NOT NULL PRIMARY KEY ;
ALTER TABLE Test MODIFY COLUMN name VARCHAR(50) UNIQUE ;
ALTER TABLE Test MODIFY COLUMN name VARCHAR(50);

-- JOIN BANG TRONG MYSQL

SELECT S.NAME AS STUDENTNAME, Test.NAME AS TESTNAME, mark, date FROM (studentTest
    INNER JOIN student s on studentTest.RN = s.RN)
    INNER JOIN Test ON studentTest.testID = Test.testID;

-- Danh sách các bạn học viên chưa thi môn nào
SELECT studentTest.RN AS RN, S.NAME AS NAME, S.AGE AS AGE FROM studentTest
                                                                   INNER JOIN student s on studentTest.RN = s.RN;

-- danh sách học viên phải thi lại, tên môn học phải thi lại và điểm thi(điểm phải thi lại là điểm nhỏ hơn 5
SELECT S.NAME AS STUDENTNAME, Test.NAME AS TESTNAME, mark, date FROM (studentTest
    INNER JOIN student s on studentTest.RN = s.RN)
    INNER JOIN Test ON studentTest.testID = Test.testID WHERE mark < 5;

-- Hiển thị danh sách học viên và điểm trung bình(Average) của các môn đã thi. Danh sách phải sắp xếp theo thứ tự điểm trung bình giảm dần
SELECT S.NAME AS NAME, AVG(mark)AS TB FROM studentTest
                                               INNER JOIN student s on studentTest.RN = s.RN ORDER BY TB DESC ;
-- Hiển thị tên và điểm trung bình của học viên có điểm trung bình lớn nhất
SELECT S.NAME AS NAME, AVG(mark)AS TB FROM studentTest
                                               INNER JOIN student s on studentTest.RN = s.RN WHERE
