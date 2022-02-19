## Quản lý cửa hàng

**TẠO DATABASE SHOES_STORE**

```sql
CREATE DATABASE shoes_store
```

**_Tạo bảng brand_**

```sql
CREATE TABLE brand (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name TEXT NOT NULL
)
```

**_Tạo bảng gender_**

```sql
CREATE TABLE gender(
	id INT PRIMARY KEY AUTO_INCREMENT,
    gender TEXT NOT NULL
)
```

**_Tạo bảng size_**

```sql
CREATE TABLE size(
	id INT PRIMARY KEY AUTO_INCREMENT,
    size INT NOT NULL
)
```

**_Tạo bảng màu sắc sp_**

```sql
CREATE TABLE color(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name TEXT NOT NULL
)
```

**_Tạo bảng category_**

```sql
CREATE TABLE category(
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_gender INT,
    name TEXT NOT NULL,
    FOREIGN KEY (id_gender)  REFERENCES gender(id)
)
```

**_Tạo bảng sản phẩm_**

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

**_Tạo bảng giá bán_**

```sql
CREATE TABLE price(
	id INT PRIMARY KEY AUTO_INCREMENT,
    price BIGINT NOT NULL,
    date DATE NOT NULL,
    id_product INT,
    FOREIGN KEY (id_product) REFERENCES product(id)
)
```

**_Tạo bảng size-product_**

```sql
CREATE TABLE size_product(
	id_size INT NOT NULL,
  	id_product INT NOT NULL,
    PRIMARY KEY (id_size, id_product),
    FOREIGN KEY (id_size) REFERENCES size(id),
    FOREIGN KEY (id_product) REFERENCES product(id)
)
```

**_Tạo bảng color_product_**

```sql
CREATE TABLE color_product(
	id_color INT NOT NULL,
    id_product INT,
    PRIMARY KEY(id_color),
    FOREIGN KEY (id_color) REFERENCES color(id),
    FOREIGN KEY (id_product) REFERENCES product(id)
)
```


***Tạo bảng user***
```sql
CREATE TABLE users(
	id INT PRIMARY KEY AUTO_INCREMENT,
    full_name TEXT NOT NULL,
    mobile VARCHAR(10) NOT NULL,
    email TEXT NOT NULL,
    password TEXT NOT NULL,
    avatar TEXT NOT NULL,
    role INT NOT NULL
)
```

***Tạo bảng address***
```sql
CREATE TABLE address(
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_users INT,
    kindOfAddress ENUM('Company', 'Home'),
    address TEXT NOT NULL,
    FOREIGN KEY (id_users) REFERENCES users(id)
)
```

***Tạo bảng chi nhánh-branch***
```sql
CREATE TABLE branch(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name_br TEXT NOT NULL,
    address_br TEXT NOT NULL,
    id_admin_br INT NOT NULL,
    mobile_br VARCHAR(10) NOT NULL,
    stk_br INT NOT NULL,
    FOREIGN KEY (id_admin_br) REFERENCES users(id)
)
```

***Tạo bảng giỏ hàng-cart***
```sql
CREATE TABLE cart(
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_users INT NOT NULL,
    FOREIGN KEY (id_users) REFERENCES users(id)
)
```

***Tạo bảng cart_product***
```sql
CREATE TABLE cart_product(
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_cart INT NOT NULL,
    id_product INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (id_cart) REFERENCES cart(id),
    FOREIGN KEY (id_product) REFERENCES product(id)
)
```

***Tạo bảng order-ĐẶt hàng***
```sql
CREATE TABLE orders(
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_branch INT NOT NULL,
    id_admin INT NOT NULL,
    id_client INT NOT NULL,
    create_at DATE NOT NULL,
    status TEXT NOT NULL,
    payment_method ENUM('trả trước', 'COD'),
    FOREIGN KEY (id_branch) REFERENCES branch(id),
    FOREIGN KEY (id_admin) REFERENCES users(id),
    FOREIGN KEY (id_client) REFERENCES users(id)
)
```

***Tạo bảng order_product***
```sql
CREATE TABLE order_product(
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_order INT NOT NULL,
    id_product INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (id_order) REFERENCES orders(id),
    FOREIGN KEY (id_product) REFERENCES product(id)
)
```




![image](https://user-images.githubusercontent.com/95128548/154717561-c46e3f58-180e-49ca-9cca-c369b2e9ce1b.png)

## Chèn chữ liệu vào bảng bằng INSERT INTO

**_Chèn DL bảng brand_**

![image](https://user-images.githubusercontent.com/95128548/154711891-e49afca9-a894-4dff-bedd-9246c3c93253.png)

**_Chèn DL bảng category_**

![image](https://user-images.githubusercontent.com/95128548/154712234-8202bc6b-8f58-4c92-b23d-6e7d111d9c3b.png)

**_Chèn DL bảng Color_**

![image](https://user-images.githubusercontent.com/95128548/154713397-7f2c8c63-8063-4b43-a814-c0c93c065f4e.png)

**_Chèn DL bảng gender_**

![image](https://user-images.githubusercontent.com/95128548/154712483-df8c8c67-2ee6-4d16-84d0-5153f0445fb0.png)

**_Chèn DL bảng size_**

![image](https://user-images.githubusercontent.com/95128548/154712562-ccc1a67b-6a41-41b8-9315-e80e3150941c.png)

**_Chèn DL bảng product_**

![image](https://user-images.githubusercontent.com/95128548/154712729-f5d69669-061e-49a0-98c1-1e5d11ca4958.png)

**_chèn DL bảng price_**

![image](https://user-images.githubusercontent.com/95128548/154712852-19e6ba66-e65d-4fed-ac9c-6f666945d4ac.png)

**_Chèn DL bảng color_product_**

![image](https://user-images.githubusercontent.com/95128548/154712946-76f41700-9d99-4359-8af5-254f7c20d02c.png)

**_Chèn DL bảng size_product_**

![image](https://user-images.githubusercontent.com/95128548/154713149-6d1feae7-f6ff-4434-93d3-127da6f052dd.png)
