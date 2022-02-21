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
```

***Tạo bảng nhân niên-employee***

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

```

***Tạo bảng ngôn ngữ-language***

```sql
CREATE TABLE languages (
    id INT PRIMARY KEY AUTO_INCREMENT,
    language TEXT NOT NULL
)
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
```

***Tạo bảng categorys-thể loại***

```sql
CREATE TABLE categorys(
	id INT PRIMARY KEY AUTO_INCREMENT,
    category TEXT NOT NULL
)
```

***Tạo bảng tác gi-author***

```sql
CREATE TABLE author(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name TEXT NOT NULL
)
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
```

![image](https://user-images.githubusercontent.com/95128548/154942474-0be98bc2-ab65-4e76-a3c0-a71c916458d4.png)