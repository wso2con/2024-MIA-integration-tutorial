CREATE DATABASE result;

use result;

create TABLE Result (
	id int NOT NULL AUTO_INCREMENT,
    student_id INT NOT NULL,
    subject VARCHAR(100),
    marks INT NOT NULL,
    grade VARCHAR(10),
    semester VARCHAR(20),
    PRIMARY KEY (id)
);


ALTER TABLE Result
ADD id INT;

GRANT ALL ON Result.* TO 'wso2'@'localhost';


SELECT * FROM Result;

desc Result;

DROP DATABASE result;
DROP DATABASE wso2con_demo;
DROP DATABASE student;
