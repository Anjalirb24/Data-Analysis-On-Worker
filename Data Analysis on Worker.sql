-- create Database

CREATE DATABASE ORG;
SHOW DATABASES;
USE ORG;

-- create Table

CREATE TABLE Worker(
Worker_ID INT(15) NOT NULL PRIMARY KEY AUTO_INCREMENT,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT(15),
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
);

-- Insert into Table

INSERT INTO Worker
(Worker_ID , FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
(1,"ANJALI","BANSODE",250000,'13-08-22 09:00:00','CS');
INSERT INTO Worker
(Worker_ID , FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
(2,"VD","COKI",200000,'13-08-22 09:00:00','HR');

INSERT INTO Worker
(Worker_ID , FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
(3,"SID","SAKI",243000,'15-08-22 09:00:00','CS'),
(4,"RAJ","SOLANKI",990000,'15-08-24 09:00:00','HR'),
(5,"NSJU","OKL",800000,'13-08-23 09:00:00','CS');

SELECT * FROM Worker;

CREATE TABLE Bonus(
	WORKER_REF_ID INT,
    BONUS_AMOUNT INT(10),
    BONUS_DATE DATETIME,
    FOREIGN KEY (WORKER_REF_ID)
    REFERENCES Worker(Worker_ID)
    ON DELETE CASCADE
    );
    
    INSERT INTO Bonus 
    (WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
    (1,5000,'16-08-22'),
    (2,6000,'17-08-22'),
    (3,8000,'22-02-23'),
    (4,9000,'13-04-23');
    
    CREATE TABLE Title(
    WORKER_REF_ID INT,
    WORKER_TITLE CHAR(25),
    AFFECTED_FROM DATETIME,
    FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(Worker_ID)
		ON DELETE CASCADE
    );
    
    INSERT INTO Title
    (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
    (1,'Manager','2019-02-20 00:00:00'),
    (2,'Executive','2019-02-20 00:00:00'),
    (3,'Manager','2023-02-20 00:00:00'),
    (4,'Executive','2020-02-20 00:00:00'),
    (5,'Manager','2022-02-20 00:00:00');
    
    SELECT SALARY FROM Worker;

-- Data Analysis On Worker Table
 -- write sql query to fetch first name from worker table using alias as worker name
 SELECT FIRST_NAME AS WORKER_NAME FROM Worker;
 
 -- wsq to fetch first_name from worker table with upper case
 SELECT UPPER(FIRST_NAME) FROM Worker;
 
 -- WAQ TO FETCH UNIQUE VALUE OF DEPARTMENT FROM WORKER TABLE
 SELECT DISTINCT(DEPARTMENT) FROM Worker;
 SELECT DEPARTMENT FROM Worker 
 GROUP BY DEPARTMENT; -- IF WE DONT USE WHERE IN GROUP BY I BEHAVES AS DISCTINCT
 
 --  waq TO PRINT FIRST THREE CHARACTER OF FIRST NAME OF WORKER TABLE
 SELECT SUBSTRING(FIRST_NAME, 1,3) FROM Worker;
 
 --  WAQ TO FIND POSOTION OF ALPHABET A IN FIRST NAME ANJALI FROM WORKER 
 SELECT INSTR(FIRST_NAME, 'A') FROM Worker 
 WHERE FIRST_NAME ='ANJALI';
 
 -- WAQ TO PRINT FIRST NAME FROM WORKER TABLE AFTER REMOVING WHITE SPACES FROM RIGHT SIDE
 SELECT RTRIM(FIRST_NAME) FROM Worker;
 SELECT LTRIM(FIRST_NAME) FROM Worker;
 
 --  waq that feches the unique vlaue of department and print its length
 SELECT DISTINCT(DEPARTMENT), LENGTH(DEPARTMENT) FROM Worker;
 
 --  WAQ THAT PRINT FIRST NAME FROM WORKER AFTER REPLACING A WITH a
 SELECT REPLACE(FIRST_NAME,'A','a' )FROM Worker;
 
 --  waq to print first name and last name from worker into single column complete name
 SELECT CONCAT(FIRST_NAME,' ', LAST_NAME) AS COMPLETENAME FROM Worker;
 
 --  WAQ TO PRINT ALL WORKER DETAILS FROM WORKER TABLE ORDER BY FIRST_NAME ASC
 SELECT * FROM Worker 
 ORDER BY FIRST_NAME ;
 
 --  WAQ TO PRINT ALL WORKER DETAILS FIRST_NAME ASC DEPARTMENT DESC
SELECT * FROM  Worker 
ORDER BY FIRST_NAME , DEPARTMENT DESC;

--  WAQ TO PRINT WORKER WITH FIRST NAME AS 'SID' AND 'VD'
SELECT FIRST_NAME FROM Worker
WHERE FIRST_NAME IN('SID', 'VD');

--  WAQ TO PRINT WORKER EXCLUDING ABOVE NAME
SELECT FIRST_NAME FROM Worker 
WHERE FIRST_NAME NOT IN('SID', 'VD');

--  WAQ  TO DETAILS OF WORKERS WITH DEPARTMENT NAME AS 'H*'
SELECT * FROM Worker 
WHERE DEPARTMENT LIKE 'H%';

--  WAQ TO PRINT DETAILS OF WORKER WHOSE FIRSTNAME CONTAIN A
SELECT * FROM Worker 
WHERE FIRST_NAME LIKE '%A%';

--  WAQ TO PRINT DETAILS OF WORKER WHOSE FIRST_NAME ENDS WITH A
SELECT * FROM Worker 
WHERE FIRST_NAME LIKE '%A';

--  WAQ TO PRINT DETAILS OF WORKER WHOSE FIRST_NAME ENDS WITH I AND CONTALS 6 ALPHABET
SELECT * FROM Worker 
WHERE FIRST_NAME LIKE '_____I';

--  WAQ TO PRINT WORKER SALARY WHOSE SALARY BETWEEN 80000,900000
SELECT * FROM Worker 
WHERE SALARY BETWEEN 800000 AND 900000;

--  WAQ TO PRINT WORKER WHO JOINED IN 8-2022
SELECT * FROM Worker 
WHERE YEAR(JOINING_DATE) = 2022 AND MONTH(JOINING_DATE) = 8;

--  WAQ TO FETCH THE COUNT OF EMPLOYEE WORKING IN DEPARTMENT HR
SELECT DEPARTMENT,COUNT(Worker_ID) FROM Worker 
WHERE DEPARTMENT  = 'HR';

--  WAQ TO FETCH FULL NAME WITH SALARY >= 5000000  <=9000000
SELECT CONCAT(FIRST_NAME, LAST_NAME) AS FULLNAME FROM Worker 
WHERE SALARY BETWEEN 500000 AND 900000;

--  WAQ TO FETCH NO. OF WORKER FOR EACH DEPARTMENT IN desc
SELECT DEPARTMENT , COUNT(Worker_ID) FROM Worker 
GROUP BY DEPARTMENT 
ORDER BY COUNT(Worker_ID) DESC;

--  WAQ TO PRINT DETALILS OF WORKER WHO ARE ALSO MANAGER
SELECT w.* FROM Worker as w 
INNER JOIN TITLE AS T 
ON w.Worker_ID = T.WORKER_REF_ID 
WHERE T.WORKER_TITLE = 'MANAGER';
 
 --  waq to fetch number of same tiltle in org of different types
 SELECT WORKER_TITLE, COUNT(*) AS count FROM TITLE 
 GROUP BY WORKER_TITLE 
 HAVING count > 1;
 
 --  waq to show only odd rows from table 
 SELECT * FROM Worker 
 WHERE MOD(Worker_ID , 2) != 0;
 SELECT * FROM Worker 
 WHERE MOD(Worker_ID , 2) <> 0; -- BEHAVE NOT EQUAL TO
 
 --  EVEN ROWS
 SELECT * FROM Worker WHERE MOD(Worker_ID , 2) = 0;
 
 --  CREATE CLONE NEW TABLE FROM ANOTHER TABLE
 CREATE TABLE WORKER_CLONE LIKE Worker;
 INSERT INTO WORKER_CLONE SELECT * FROM Worker;
 SELECT * FROM WORKER_CLONE;
 
 --  FETCH INTERSECTION RECORD OF TWO TABLE
 SELECT Worker.* FROM Worker 
 INNER JOIN WORKER_CLONE USING(Worker_ID);
 
 --  waq to show record of one table that another table does not have
 SELECT * FROM Worker 
 LEFT JOIN WORKER_CLONE USING(Worker_ID) 
 WHERE WORKER_CLONE.Worker_ID is NULL;
 
 --  WAQ TO SHOW CURRENT DATE AND TIME
 SELECT CURDATE();
 SELECT NOW();
 
 --  WAQ to show the top n record of the table order by desc salary
 SELECT  * FROM Worker 
 ORDER BY SALARY 
 DESC LIMIT 4;
 
 --  WAQ TO DETERMINE THE NTH HIGHEST SALARY FROM TABLE
 SELECT  * FROM Worker 
 ORDER BY SALARY 
 DESC LIMIT 1,1;
 
 --  WAQ TO DETERMINE 5TH HIGHEST SALARY WITHOUT USING LIMIT
 SELECT SALARY FROM Worker w1 
 WHERE 4 =(SELECT COUNT(DISTINCT(w2.SALARY)) FROM Worker w2 
 WHERE w2.SALARY >= W1.SALARY);
 
 --  WAQ TO FETCH LIST OF EMPLOYEE WITH THE SAME SALARY
 SELECT * FROM Worker w1, Worker w2 
 WHERE w1.SALARY = w2. SALARY AND w1.WORKER_ID != w2.WORKER_ID;
 
 --  WAQ TO SHOW SECOND HIGHEST SALARY FROM TABLE
 SELECT MAX(SALARY) FROM Worker 
 WHERE SALARY < (SELECT MAX(SALARY) FROM Worker );
 SELECT MAX(SALARY) FROM Worker 
 WHERE SALARY NOT IN (SELECT MAX(SALARY) FROM Worker );
 
 --  WAQ TO SHOW ONE ROW TWICE IN RESULTS OF TABLE
 SELECT * FROM Worker
 UNION
 SELECT * FROM Worker ORDER BY WORKER_ID;
 
 --  WAQ LIST WORKER ID WHO DOES NOT GET BONUS
 SELECT * FROM Worker 
 WHERE WORKER_ID NOT IN (SELECT WORKER_REF_ID FROM BONUS);
 
 --  fetch first 50 % record from table
 select * from Worker 
 WHERE WORKER_ID <= (SELECT COUNT(WORKER_ID) /2 FROM Worker);
 
 --  fetch the department have less than 4 people in it
 SELECT DEPARTMENT, COUNT(DEPARTMENT) AS DEPCOUNT FROM Worker 
 GROUP BY DEPARTMENT 
 HAVING DEPCOUNT < 4;
 
 --  SHOW ALLL DEPARTMENT ALONG WITH NUMBER OF PEOPLE
  SELECT DEPARTMENT, COUNT(DEPARTMENT) FROM Worker 
  GROUP BY DEPARTMENT;
  
  --  SHOW LAST RECORD FROM TABLE
  SELECT * FROM Worker
  WHERE WORKER_ID = (SELECT MAX(WORKER_ID) FROM Worker);
  
  --  first row
  SELECT * FROM Worker 
  WHERE WORKER_ID = (SELECT MIN(WORKER_ID) FROM Worker);
  
  --  LAST FIVE RECORDS FROM TABLE
  SELECT * FROM Worker 
  ORDER BY WORKER_ID 
  DESC LIMIT 5;
  
  --  PRINT NAME OD EMP HAVING HIGHEST SALARY IN EACH DEPARTMENT
  SELECT W.DEPARTMENT, W.FIRST_NAME, W.SALARY FROM 
  (SELECT MAX(SALARY) AS SAL, DEPARTMENT FROM Worker GROUP BY DEPARTMENT) AS TEMP
  INNER JOIN Worker W 
  ON TEMP.DEPARTMENT = W.DEPARTMENT AND TEMP.SAL = W.SALARY ;
  
  --  FETCH THREE MAX SALARY FROM TABLE USING CORELATED SUBQUERY
  SELECT DISTINCT SALARY FROM Worker W1 
  WHERE  3 >= (SELECT COUNT(DISTINCT SALARY) FROM Worker W2
  WHERE W1.SALARY <= W2.SALARY ) 
  ORDER BY W1.SALARY DESC;
  
  
 
 
