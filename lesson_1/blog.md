# quản lý BLog Tech
***Tạo database***
```sql
CREATE DATABASE blog
```

***Tạo bảng author***
```sql
CREATE TABLE `author` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
)
```

***TẠO bảng categor***
```sql
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) 
```

***Tạo bảng post***
```sql
CREATE TABLE `post` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `content` text NOT NULL,
  `description` text NOT NULL,
  `status` text NOT NULL,
  `image` text NOT NULL,
  `id_category` int DEFAULT NULL,
  `id_author` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_category` (`id_category`),
  KEY `id_author` (`id_author`),
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `category` (`id`),
  CONSTRAINT `post_ibfk_2` FOREIGN KEY (`id_author`) REFERENCES `author` (`id`)
)
```

***TẠo bảng tag***
```sql
CREATE TABLE `tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) 
```

***Tạo bảng post_tag***
```sql
CREATE TABLE `post_tag` (
  `id_post` int DEFAULT NULL,
  `id_tag` int DEFAULT NULL,
  KEY `id_post` (`id_post`),
  KEY `id_tag` (`id_tag`),
  CONSTRAINT `post_tag_ibfk_1` FOREIGN KEY (`id_post`) REFERENCES `post` (`id`),
  CONSTRAINT `post_tag_ibfk_2` FOREIGN KEY (`id_tag`) REFERENCES `tag` (`id`)
) 
```

![image](https://user-images.githubusercontent.com/95128548/155534808-eff7f0b1-e1ad-4a33-9eb1-3b9597cb3ebf.png)
