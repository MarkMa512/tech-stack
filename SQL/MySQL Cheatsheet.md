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

## Change Table Structure 

### Add a New Column 
```sql
ALTER TABLE student ADD admission_date DATE NOT NULL; 
```

### Add a New Constraint 
```sql 
ALTER TABLE student ADD CONSTRAINT student_fk1 FOREIGN KEY (admission_date) REFERENCES admission_record(admission_date); 
```

### Drop an Existing Column 
```sql
ALTER TABLE student DROP admission_date; 
```

### Drop an Existing Foreign Key Constraint 
```sql 
ALTER TABLE student DROP FOREIGN KEY student_fk1; 
```

## SELECT Statement 

- `SELECT`: List the columns and expressions that should be returned from the query 
- `FROM`: indicate the table / views from which data will be obtained 
- `WHERE`: indicate the conditions under which a row will be included in the result 
- `GROUP BY`: indicate categorization of results 
- `HAVING`: indicate the condition under which a category (group) will be included. 
- `ORDER BY`: sort the result according to specified criteria

### WHERE Clause

#### Comparison Operator in SQL 
| Operator | Meaning | 
| --- | --- | 
| `=` | Equal to |
| `>` | Greater than |
| `>=` | Greater than or Equal to |
| `<` | Less than |
| `<=` | Less than or Equal to |
| `<>` | Not Equal to |
| `!=` | Not Equal to |

#### Multiple Conditions: 

Use: 
- `NOT`
- `AND`
- `OR`
to customize them 

### LIKE and Wildcards 

Wildcards: 

- `%`: represents any collection of characters 
    - `%Desk`: ComputerDesk, StudyDesk ... 
- `_`: represents exactly 1 char 
    - `_-drawer`: a-drawer, 1-drawer ... 
- `*`: represents all the attributes 

Keyword `LIKE` is paired with wildcard characters `%` and `_`: 

```sql
SELECT * FROM course WHERE course_name LIKE '%Data%'; 
```

### SQL Functions 

| Function | Usage |
| --- | --- | 
| MIN | find the lowest value of the column | 
| MAX | find the highest value of the column | 
| AVG | find the average value of the column | 
| SUM | find the summary value of the column | 
| COUNT() | return the number of records (rows) that satisfy specified condition | 
| DISTINCT | find the unique values | 

### GROUP BY 

- Provides means of grouping the result set by certain database column(s)
- Usually used in conjunction with SQL functions
- `HAVING` clause is to extract the groups that satisfy some condition(s)
- `HAVING` acts as `WHERE` clause but it follows `GROUP BY` clause