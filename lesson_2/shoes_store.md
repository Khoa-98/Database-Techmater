## Quản lý cửa hàng
**TẠO DATABASE SHOES_STORE

```sql
CREATE DATABASE shoes_store
```

***Tạo bảng  brand***
```sql
CREATE TABLE brand (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name TEXT NOT NULL
)
```

***Tạo bảng gender***

```sql
CREATE TABLE gender(
	id INT PRIMARY KEY AUTO_INCREMENT,
    gender TEXT NOT NULL
)
```

***Tạo bảng size***

```sql
CREATE TABLE size(
	id INT PRIMARY KEY AUTO_INCREMENT,
    size INT NOT NULL
)
```
***Tạo bảng màu sắc sp***

```sql
CREATE TABLE color(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name TEXT NOT NULL
)
```
***Tạo bảng category***

```sql
CREATE TABLE category(
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_gender INT,
    name TEXT NOT NULL,
    FOREIGN KEY (id_gender)  REFERENCES gender(id)
)
```

***Tạo bảng sản phẩm***

```sql
CREATE TABLE product(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name TEXT NOT NULL,
    description TEXT NOT NULL,
    image TEXT NOT NULL,
    status TEXT NOT NULL,
    quantity INT NOT NULL,
    id_category INT,
    id_brand INT,
    id_gender INT,
    FOREIGN KEY(id_category) REFERENCES category(id),
    FOREIGN KEY(id_brand) REFERENCES brand(id),
    FOREIGN KEY(id_gender) REFERENCES gender(id)
)
```

***Tạo bảng giá bán***
```sql
CREATE TABLE price(
	id INT PRIMARY KEY AUTO_INCREMENT,
    price BIGINT NOT NULL,
    date DATE NOT NULL,
    id_product INT,
    FOREIGN KEY (id_product) REFERENCES product(id)
)
```

***Tạo bảng size-product***

```sql
CREATE TABLE size_product(
	id_size INT NOT NULL,
  	id_product INT NOT NULL,
    PRIMARY KEY (id_size, id_product),
    FOREIGN KEY (id_size) REFERENCES size(id),
    FOREIGN KEY (id_product) REFERENCES product(id)
)
```

***Tạo bảng color_product***

```sql
CREATE TABLE color_product(
	id_color INT NOT NULL,
    id_product INT,
    PRIMARY KEY(id_color),
    FOREIGN KEY (id_color) REFERENCES color(id)
)
```


![image](https://user-images.githubusercontent.com/95128548/154494999-e7d67f3c-6eeb-4fa8-a6fa-01f5cdaf3692.png)
















