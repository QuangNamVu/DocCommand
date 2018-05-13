# List all table;
.tables

# Table structured
.schema USER

# Create table
CREATE TABLE teacher(
ID INT PRIMARY KEY     NOT NULL,
USE_NAME           TEXT    NOT NULL,
PASS           TEXT    NOT NULL,
DOB            DATETIME NOT NULL);

CREATE TABLE student(
MSSV INT PRIMARY KEY     NOT NULL,
USE_NAME           TEXT    NOT NULL,
PASS           TEXT    NOT NULL,
DOB            DATETIME NOT NULL);
# Insert Table
INSERT INTO USER (MSSV,USE_NAME,PASS,DOB) 
VALUES (1511111, 'Tran Van A', 'password', '2007-18-3');
INSERT INTO COMPANY (ID,NAME,AGE,ADDRESS,SALARY) 
VALUES (1, 'Paul', 32, 'California', 20000.00 );

# Drop
drop table USER;

# Export to csvsqlite
.ouput data.csv 
.mode csv
select * from user;
.output stdout

# Import csv to sqlite
.import data/user.csv Genres
# exit quit
.quit
C-D
