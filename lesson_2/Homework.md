## Quản lý Movie  
***Tạo bảng directors***  

```sql
CREATE TABLE directors(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name TEXT NOT NULL,
    avatar TEXT,
    description TEXT NOT NULL
)
```

***Tạo bảng actor***
```sql
CREATE TABLE actor(
	id INT PRIMARY KEY AUTO_INCREMENT,
    last_name TEXT NOT NULL,
    first_name TEXT NOT NULL,
    avatar TEXT 
)
```

***Tạo bảng category***
```sql
CREATE TABLE category(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name TEXT NOT NULL
)
```

***Tạo bảng film***
```sql
CREATE TABLE film(
	id INT PRIMARY KEY AUTO_INCREMENT,
    title TEXT NOT NULL,
    description TEXT NOT NULL,
    poster TEXT NOT NULL,
    length INT,
    rating TEXT NOT NULL,
    id_directors INT,
    FOREIGN KEY (id_directors) REFERENCES directors(id),
    release_date DATE
    
)
```

***Tạo bảng film_actor***
```sql
CREATE TABLE film_actor(
	id_film INT,
    id_actor INT,
    PRIMARY KEY (id_film, id_actor),
    FOREIGN KEY (id_film) REFERENCES film(id),
    FOREIGN KEY (id_actor) REFERENCES actor(id)
)
```

***Tạo bảng film_category***
```sql
CREATE TABLE film_category(
	id_film INT,
    id_category INT PRIMARY KEY,
    FOREIGN KEY (id_film) REFERENCES film(id),
    FOREIGN KEY (id_category) REFERENCES category(id)
)
```


![image](https://user-images.githubusercontent.com/95128548/154479183-72daeaba-31ba-4f72-ae1f-b6697f70d7ec.png)

