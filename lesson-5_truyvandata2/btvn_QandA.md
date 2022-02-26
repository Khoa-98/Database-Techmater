# Tạo database câu hỏi và đáp án 
```sql
CREATE DATABASE Q&A
```

***Tạo bảng question***
```sql
CREATE TABLE question(
	id INT PRIMARY KEY AUTO_INCREMENT,
	question TEXT NOT NULL,
	koq ENUM ('single', 'multi')
)

INSERT INTO question 
VALUES (NULL, 'Câu 1. SQL là từ viết tắt của:', 'single')
INSERT INTO question 
VALUES (NULL, 'Câu 2. Câu lệnh SQL nào được dùng để trích xuất dữ liệu từ database', 'single')
INSERT INTO question 
VALUES (NULL, 'Câu 3. Trong SQL, làm thế nào để chèn thêm bản ghi mới vào bảng Persons(id, name):', 'multi')
INSERT INTO question 
VALUES (NULL, 'Câu 4. Trong SQL, làm thế nào để trả về số lượng các bản ghi trong bảng Persons:', 'single')

```

***Tạo bảng answer***
```sql
CREATE TABLE  answer(
	id INT PRIMARY KEY AUTO_INCREMENT ,
	id_question INT NOT NULL,
	content TEXT NOT NULL,
	checks ENUM ('true', 'false'),
	FOREIGN KEY (id_question) REFERENCES question (id)
)

INSERT INTO answer
VALUES (NULL, '1', 'Strong Question Language', 'false')
INSERT INTO answer
VALUES (NULL, '1', 'Structured Question Language', 'false')
INSERT INTO answer
VALUES (NULL, '1', 'Structured Query Language', 'true')
INSERT INTO answer
VALUES (NULL, '2', 'Get', 'false')
INSERT INTO answer
VALUES (NULL, '2', 'open', 'false')
INSERT INTO answer
VALUES (NULL, '2', 'extract', 'false')
INSERT INTO answer
VALUES (NULL, '2', 'select', 'true')
INSERT INTO answer
VALUES (NULL, '3', 'INSERT INTO Persons VALUES (NULL, ‘Jackson’)', 'true')
INSERT INTO answer
VALUES (NULL, '3', 'INSERT INTO Persons(id, name) VALUES (‘Jackson’)', 'true')
INSERT INTO answer
VALUES (NULL, '3', 'INSERT (‘Jimmy’, ‘Jackson’) INTO Persons', 'false')
INSERT INTO answer
VALUES (NULL, '3', 'INSERT VALUES (‘Jimmy’, ‘Jackson’) INTO Persons', 'false')
INSERT INTO answer
VALUES (NULL, '4', 'SELECT COLUMNS () FROM Persons', 'false')
INSERT INTO answer
VALUES (NULL, '4', 'SELECT COUNT (*) FROM Persons', 'true')
INSERT INTO answer
VALUES (NULL, '4', 'SELECT COLUMNS (*) FROM Persons', 'false')
INSERT INTO answer
VALUES (NULL, '4', 'SELECT COUNT () FROM Persons', 'false')
```

![image](https://user-images.githubusercontent.com/95128548/155835332-462b996a-5e9e-4f48-ae69-91d06d16eac5.png)~