// Tạo database:
 
 CREATE DATABASE movie

 //tạo bảng director 

 CREATE TABLE directors(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name TEXT NOT NULL,
    avatar TEXT,
    description TEXT NOT NULL
)

// tạo bảng actor
CREATE TABLE actor(
	id INT PRIMARY KEY AUTO_INCREMENT,
    last_name TEXT NOT NULL,
    first_name TEXT NOT NULL,
    avatar TEXT 
)

// tạo bảng category 
CREATE TABLE category(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name TEXT NOT NULL
)

// tạo bảng film
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

//tạo bảng film_actor
CREATE TABLE film_actor(
	id_film INT,
    id_actor INT,
    PRIMARY KEY (id_film, id_actor),
    FOREIGN KEY (id_film) REFERENCES film(id),
    FOREIGN KEY (id_actor) REFERENCES actor(id)
)

//tạo bảng film_category
CREATE TABLE film_category(
	id_film INT,
    id_category INT PRIMARY KEY,
    FOREIGN KEY (id_film) REFERENCES film(id),
    FOREIGN KEY (id_category) REFERENCES category(id)
)

