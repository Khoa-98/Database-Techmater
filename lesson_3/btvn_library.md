## Quản lý thư viện

***Tạo database library***
```sql
CREATE TABLE library
```

***Tạo bảng đọc giả-reader***

```sql
CREATE TABLE reader (
	id INT PRIMARY KEY AUTO_INCREMENT,
    full_name TEXT NOT NULL,
    gender ENUM ('male', 'female', 'others'),
    address TEXT NOT NULL,
    birthOfdate DATE NOT NULL,
    identification  TEXT NOT NULL,
    mobile VARCHAR(10) NOT NULL,
    email TEXT NOT NULL  
)

INSERT INTO reader 
VALUES (NULL, 'TRần Đăng Khoa', 'male', 'Nam Định', '1998-10-16', '036098003239', '0355540066', 'dangkhoa@gmail.com');
INSERT INTO reader 
VALUES (NULL, 'Nguyễn Thu Hương', 'female', 'Nam Định', '1998-08-01', '036098003231', '0355541166', 'thuhuong@gmail.com');
INSERT INTO reader 
VALUES (NULL, 'Nguyễn Thu Hoa', 'female', 'Nam Định', '1998-06-02', '036098003345', '0355541166', 'thuhoa@gmail.com');
INSERT INTO reader 
VALUES (NULL, 'Nguyễn văn toàn', 'male', 'Nam Định', '1998-07-03', '036098003456', '0355541166', 'vantoan@gmail.com');
INSERT INTO reader 
VALUES (NULL, 'Trần bá sang', 'male', 'Nam Định', '1998-09-04', '036098003678', '0355541166', 'basang@gmail.com');
```

***Tạo bảng nhân viên-employee***

```sql
CREATE TABLE employee (
	id INT PRIMARY KEY AUTO_INCREMENT,
    full_name TEXT NOT NULL,
    gender ENUM ('male', 'female', 'others'),
    address TEXT NOT NULL,
    birthofdate DATE NOT NULL,
    identification TEXT NOT NULL,
    mobile VARCHAR(10) NOT NULL,
    email TEXT NOT NULL
)

INSERT INTO employee 
VALUES (NULL, 'Trần thu thảo', 'female', 'Thanh Xuân', '1998-03-31', '036098003446', '0834593800', 'thuthao@gmail.com');
INSERT INTO employee 
VALUES (NULL, 'Trần Văn Mạnh', 'male', 'Hà đông', '1998-07-22', '036098001234', '0834598855', 'vanmanh@gmail.com');
```

***Tạo bảng NXB-publishing***

```sql
CREATE TABLE publishing (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name TEXT NOT NULL,
    mobile VARCHAR(10) NOT NULL,
    email TEXT NOT NULL,
    address TEXT NOT NULL
)

INSERT INTO publishing
VALUES (NULL, 'Kim Đồng', '0946618983', 'nxbkimdong@gmail.com', '60-NGuyễn Trãi, Thanh xuân, Hà nội');
INSERT INTO publishing
VALUES (NULL, 'tuổi trẻ', '0946618983', 'nxbtuoitre@gmail.com', '60-Nguyễn xiển, Thanh xuân, Hà nội');
INSERT INTO publishing
VALUES (NULL, 'giáo dục Việt Nam', '0946618983', 'nxbgdVietnam@gmail.com', '60-NGuyễn Trãi, Thanh xuân, Hà nội');
INSERT INTO publishing
VALUES (NULL, 'Tiền Phong', '0946618983', 'nxbtienphong@gmail.com', '60-NGuyễn Trãi, Thanh xuân, Hà nội');

```

***Tạo bảng ngôn ngữ-language***

```sql
CREATE TABLE languages (
    id INT PRIMARY KEY AUTO_INCREMENT,
    language TEXT NOT NULL
)

INSERT INTO languages
VALUES (NULL, 'Tiếng Việt');
INSERT INTO languages
VALUES (NULL, 'Tiếng Anh');
INSERT INTO languages
VALUES (NULL, 'Tiếng Trung Quốc');
```

***Tạo bảng sách-book***

```sql
CREATE TABLE book (
	 id INT PRIMARY KEY AUTO_INCREMENT,
    name TEXT NOT NULL,
    id_publish INT NOT NULL,
    amount INT NOT NULL,
    page_number INT NOT NULL,
    id_language INT NOT NULL,
    create_at DATE NOT NULL,
    status ENUM ('còn sách', 'đã cho mượn hết'),
    FOREIGN KEY (id_publish) REFERENCES publishing(id),
    FOREIGN KEY (id_language) REFERENCES languages (id)
)

INSERT INTO book
VALUES (NULL,'Tuổi trẻ đang giá bao nhiêu', '1', '20', '190', '1', '1990-12-15', 'Còn sách');
INSERT INTO book
VALUES (NULL,'nhà giả kim', '2', '12', '250', '1', '1960-12-15', 'Đã cho mượn hết');
INSERT INTO book
VALUES (NULL,'The Little Prince', '3', '5', '215', '2', '1980-12-15', 'Còn sách');
```

***Tạo bảng categorys-thể loại***

```sql
CREATE TABLE categorys(
	id INT PRIMARY KEY AUTO_INCREMENT,
    category TEXT NOT NULL
)

INSERT INTO categorys
VALUES(NULL, 'Tâm lý');
INSERT INTO categorys
VALUES(NULL, 'Tình cảm');
INSERT INTO categorys
VALUES(NULL, 'tự truyện');
INSERT INTO categorys
VALUES(NULL, 'phiêu lưu');
INSERT INTO categorys
VALUES(NULL, 'trinh thám');
```

***Tạo bảng tác gi-author***

```sql
CREATE TABLE author(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name TEXT NOT NULL
)

INSERT INTO author
VALUES (NULL, 'Nhung rose');
INSERT INTO author
VALUES (NULL, 'NGuyễn nhật ánh');
INSERT INTO author
VALUES (NULL, 'Nam Cao');
INSERT INTO author
VALUES (NULL, 'Saint-Exupéry');
```

***Tạo bảng book_category***

```sql
CREATE TABLE book_category(
	id_book INT NOT NULL,
    id_category INT NOT NULL,
    PRIMARY KEY(id_book, id_category),
    FOREIGN KEY (id_book) REFERENCES book(id),
    FOREIGN KEY (id_category) REFERENCES categorys(id)
)

INSERT INTO book_category
VALUES ('1', '1');
INSERT INTO book_category
VALUES ('1', '2');
INSERT INTO book_category
VALUES ('2', '1');
INSERT INTO book_category
VALUES ('3', '4');
INSERT INTO book_category
VALUES ('3', '5');

```

***Tạo bảng book_author***

```sql
CREATE TABLE book_author(
	id_book INT NOT NULL,
    id_author INT NOT NULL,
    PRIMARY KEY (id_author),
    FOREIGN KEY (id_book) REFERENCES book(id),
    FOREIGN KEY (id_author) REFERENCES author(id)
)

INSERT INTO book_author
VALUES ('1', '1');
INSERT INTO book_author
VALUES ('2', '4');
INSERT INTO book_author
VALUES ('1', '2');
INSERT INTO book_author
VALUES ('3', '3');
```

***Tạo bảng borrow-mượn sách***

```sql
CREATE TABLE borrow(
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_employee INT NOT NULL,
    borrow_date DATE NOT NULL,
    borrow_deadline DATE NOT NULL,
    FOREIGN KEY (id_employee) REFERENCES employee(id)
)

INSERT INTO borrow
VALUES (NULL, '1', CURRENT_DATE, CURRENT_DATE+3);
INSERT INTO borrow
VALUES (NULL, '2', CURRENT_DATE, CURRENT_DATE+5);
INSERT INTO borrow
VALUES (NULL, '1', CURRENT_DATE, CURRENT_DATE+6);
```

***Tạo bảng book_borrow***

```sql
CREATE TABLE book_borrow(
	id_book INT NOT NULL,
    id_borrow INT NOT NULL,
    id_reader INT NOT NULL,
  	FOREIGN KEY (id_book) REFERENCES book(id),
    FOREIGN KEY (id_borrow) REFERENCES borrow(id),
    FOREIGN KEY (id_reader) REFERENCES reader(id)
)

INSERT INTO book_borrow
VALUES ('1', '1', '1');
INSERT INTO book_borrow
VALUES ('1', '1', '2');
INSERT INTO book_borrow
VALUES ('2', '3', '1');
INSERT INTO book_borrow
VALUES ('3', '2', '2');

```

***Tạo bảng giveback-trả sách***

```sql
CREATE TABLE giveback (
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_employee INT NOT NULL,
    back_date DATE NOT NULL,
    status TEXT NOT NULL,
    FOREIGN KEY (id_employee) REFERENCES employee(id)
)

INSERT INTO giveback
VALUES (NULL, '1', CURRENT_DATE, 'Trả đúng hạn');
INSERT INTO giveback
VALUES (NULL, '1', CURRENT_DATE, 'quá hạn');
INSERT INTO giveback
VALUES (NULL, '2', CURRENT_DATE, 'Trả trước hạn');
```

***Tạo bảng book_giveback***

```sql
CREATE TABLE book_giveback(
	id_book INT NOT NULL,
    id_back INT NOT NULL,
    id_reader INT NOT NULL,
    FOREIGN KEY (id_book) REFERENCES book(id),
    FOREIGN KEY (id_back) REFERENCES giveback(id),
    FOREIGN KEY (id_reader) REFERENCES reader(id)
)

INSERT INTO book_giveback
VALUES ('1', '1', '1');
INSERT INTO book_giveback
VALUES ('2', '2', '1');
INSERT INTO book_giveback
VALUES ('3', '3', '2');
```

![image](https://user-images.githubusercontent.com/95128548/154942474-0be98bc2-ab65-4e76-a3c0-a71c916458d4.png)