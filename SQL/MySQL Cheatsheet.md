# MySQL Cheat Sheet 

## Data Type

- `int`: an Integer with value between -2^31 and 2^31 - 1
- `decimal(m, d)`: a floating point number with a total of `m` digits and `d` digits after decimal point 
    -decimal(7, 4): 123.1234
- `char(n)`: a string with a fixed length of `n` characters 
- `varchar(n)`: a string with variable length up to `n` chars 
- `date`: Recognized formate of: 
    - 'YYYY-MM-DD' 
    - 'YY-MM-DD' 

## Create Table 
```sql
CREATE TABLE course 
(
    course_id CHAR(8) NOT NULL, -- column_name data_type is_required; separate one column definition from another using , 
    course_name VARCHAR(15) NOT NULL, 
    CONSTRAINT course_pk PRIMARY KEY (CID) -- use constraint to define primary / foreign key 
    --last line no comma 
); -- complete the command with the delimiter of ; 

CREATE TABLE faculty
(
    faculty_id INT NOT NULL, 
    faculty_name VARCHAR(25), 
    CONSTRAINT faculty_pk PRIMARY KEY (faculty_id)
);

CREATE TABLE student
(
    student_id INT NOT NULL, 
    student_name VARCHAR(25), 
    CONSTRAINT student_pk PRIMARY KEY (student_id)
); 
```

### Foreign Key Reference 
1. Order of creation  
    Child tables can be created only when **ALL** the parent tables are created
2. All constraint names in a schema/database should have different names

```sql 
-- qualification table can only be created after the both course and faculty tables are created
CREATE TABLE qualification 
(
    faculty_id INT NOT NULL, 
    course_id CHAR(8) NOT NULL, 
    date_qualified DATE NOT NULL, 
    CONSTRAINT qualification_pk PRIMARY KEY (faculty_id, course_id), -- composite primary key
    CONSTRAINT qualification_fk1 FOREIGN KEY (course_id) REFERENCES course(course_id), 

);
```

### Composite Primary and Foreign Key Reference 
```sql
CREATE TABLE registration
(
    student_id INT NOT NULL, 
    course_id INT NOT NULL, 
    semester CHAR(6), 
    CONSTRAINT registration_pk PRIMARY KEY (student_id, course_id), 
    CONSTRAINT registration_fk1 FOREIGN KEY (student_id) REFERENCES student(student_id), 
    CONSTRAINT registration_fk2 FOREIGN KEY (course_id) REFERENCES course(course_id)
);

CREATE TABLE assessment 
(
    assessment_id INT NOT NULL, 
    assessment_name VARCHAR(25), 
    assessment_weight DECIMAL(3, 2)
    CONSTRAINT assessment_pk PRIMARY KEY (assessment_id)
);

CREATE TABLE performance
(
    student_id INT NOT NULL, 
    course_id INT NOT NULL, 
    assessment_id INT NOT NULL, 
    mark INT, 
    CONSTRAINT performance_pk PRIMARY KEY (student_id, course_id, assessment_id), 
    CONSTRAINT performance_fk1 FOREIGN KEY (student_id, course_id) REFERENCES registration(student_id, course_id), 
    CONSTRAINT performance_fk2 FOREIGN KEY (assessment_id) REFERENCES assessment(assessment_id)

);
```

## Insert Values 

### Insert 1 Record 

```sql
INSERT INTO student VALUES 
(00000, 'Ama');
```
### Specify Column Name 

```sql
INSERT INTO student(student_id, student_name) VALUES 
(00000, 'Ama');
```

### Insert Multiple Records 
```sql
INSERT INTO student(student_id, student_name) VALUES 
(00000, 'Ama'), (00001, 'Bob'), (00002, 'Charlie'); 
```

## Delete Data from Table 

```sql
DELETE FROM student where student_id = 00001; 
```

## Update Data in the Table 
```sql
update faculty set faculty_name = 'Tom' where faculty_id = 00001; 
```