# Quản lý Web bán hàng (thiết bị điện tử)  

## Tạo database 

```sql
CREATE DATABASE ElectricEquipment_Store_managemnet 
```

***Tạo bảng role***
```sql
CREATE TABLE role(
	id INT PRIMARY KEY AUTO_INCREMENT ,
	name TEXT NOT NULL
)

```
***Tạo bảng users***
```sql
CREATE TABLE users(
	id INT PRIMARY KEY AUTO_INCREMENT ,
	fullname TEXT NOT NULL,
	gender ENUM ('male', 'female'),
	avatar TEXT,
	email TEXT NOT NULL,
	phonenumber VARCHAR(13),
	address TEXT NOT NULL,
	password TEXT NOT NULL,
	role_id INT,
	FOREIGN KEY (role_id) REFERENCES role(id)
)
```
***Tạo bảng brand***
```sql
CREATE TABLE brand(
	id INT PRIMARY KEY AUTO_INCREMENT,
	name_brand TEXT NOT NULL
)

```

***Tạo bảng category***
```sql
CREATE TABLE category (
	id INT PRIMARY  KEY AUTO_INCREMENT ,
	category TEXT NOT NULL 
)
```

***Tạo bảng color***
```sql
CREATE TABLE color(
	id INT PRIMARY  KEY AUTO_INCREMENT ,
	color TEXT NOT NULL
)
```

***Tạo bảng discount***
```sql
CREATE TABLE discount(
	id INT PRIMARY  KEY AUTO_INCREMENT ,
	discount TEXT,
	start_date DATE,
	end_date DATE
)
```

***Tạo bảng product***
```sql

CREATE TABLE product(
	id INT PRIMARY KEY AUTO_INCREMENT ,
	name TEXT NOT NULL,
	price BIGINT NOT NULL,
	thumbnail TEXT NOT NULL,
	amount INT NOT NULL,
	out_amount INT NOT NULL,
	description LONGTEXT  NOT NULL,
	create_at DATE,
	update_at DATE,
	status ENUM('còn hàng', 'hết hàng'),
	category_id INT,
	brand_id INT,
	color_id INT ,
	discount_id INT,
	FOREIGN KEY (category_id) REFERENCES category (id),
	FOREIGN KEY (brand_id) REFERENCES brand(id),
	FOREIGN KEY (color_id) REFERENCES color(id),
	FOREIGN KEY (discount_id) REFERENCES discount(id)
)
```

***Tạo bảng gallery***
```sql
CREATE TABLE gallery(
	id INT PRIMARY KEY AUTO_INCREMENT ,
	product_id INT,
	thumbnail TEXT,
	FOREIGN KEY (product_id) REFERENCES product (id)
)
```

***Tạo bảng discuss***
```sql
CREATE TABLE discuss(
	id INT PRIMARY KEY AUTO_INCREMENT ,
	content TEXT,
	date_comment DATE,
	employee_id INT,
	client_id INT,
	parent_id INT,
	FOREIGN KEY (employee_id) REFERENCES users (id),
	FOREIGN KEY (client_id) REFERENCES users (id)
)
```

***Tạo bảng orders***
```sql
CREATE TABLE orders(
	id INT PRIMARY KEY AUTO_INCREMENT ,
	client_id INT,
	fullname TEXT NOT NULL ,
	address TEXT NOT NULL,
	phonenumber VARCHAR (13) NOT NULL,
	email TEXT,
	note TEXT,
	order_date DATE NOT NULL,
	status_order ENUM('đang xử lý', 'đã nhận đơn', 'đang giao hàng', 'đã giao', 'đã hoàn thành', 'giao thất bại'),
	FOREIGN KEY (client_id) REFERENCES users (id)
)
```

***Tạo bảng detail_order***
```sql
CREATE TABLE detail_order(
	id INT PRIMARY KEY AUTO_INCREMENT ,
	order_id INT ,
	product_id INT,
	price BIGINT NOT NULL,
	num INT NOT NULL,
	FOREIGN KEY (order_id) REFERENCES orders (id),
	FOREIGN KEY (product_id) REFERENCES product (id)
)
```
**Bộ thiết kế**

![image](https://user-images.githubusercontent.com/95128548/156873658-eec7a09f-70d4-435f-9aed-e97504ac1b8a.png)