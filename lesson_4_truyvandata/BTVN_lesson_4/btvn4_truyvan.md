# Bài 1

### **Đề bài** 
Sử dụng database library thực hiện các truy vấn sau:

_Lấy ra các quyển sách được xuất trước năm 1900  
_Lấy ra các quyển sách có số lượng trang dưới 100  
_Liệt kê các quyển sách có id_publisher = 1 và sắp xếp theo thứ tự tăng dần của số trang  

### **Bài làm**  

```sql
SELECT *
FROM book 

SELECT b.year_of_publication 
FROM book b 
WHERE b.year_of_publication < 1900

SELECT b.page_number 
FROM book b 
WHERE b.page_number <100

SELECT b.id_publisher , b.page_number 
FROM book b 
WHERE b.id_publisher =1
ORDER BY b.page_number ASC 
```

# Bài 2

## **Đề bài**  

Sử dụng database sakila thực hiện các truy vấn sau:

_Tính trung bình cộng rental_rate của các bộ phim có rating là R  
_Đếm các bộ phim có special_features là Deleted Scenes  
_Tìm các bộ phim theo tên có chứa ‘ACADEMY’

## **Bài làm**

```sql
SELECT f.rating , f.rental_rate 
FROM film f 

SELECT AVG(f.rental_rate), f.rating 
FROM film f 
WHERE f.rating = 'R'

SELECT COUNT(f.special_features) AS count_film
FROM film f 
WHERE f.special_features = 'Deleted Scenes'

SELECT f.title 
FROM film f 
WHERE f.title LIKE '%ACADEMY%'
```
