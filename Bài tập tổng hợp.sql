CREATE DATABASE HOME;
USE HOME;

CREATE TABLE orders (
	id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    total_amount DECIMAL(10,2) NOT NULL,
    status_order ENUM('PAID','SHIPPED','PROCESSING','CANCELLED'),
    note VARCHAR(100) NOT NULL
);

INSERT INTO orders (id, user_id, total_amount, status_order, note)
VALUES
	(1, 101, 2500000, 'PAID', 'giao gấp cho khách VIP'),
	(2, NULL, 3000000, 'PAID', 'đơn hệ thống'),
	(3, 102, 4500000, 'SHIPPED', 'xử lý gấp'),
	(4, NULL, 4800000, 'PAID', 'auto generate'),
	(5, 103, 2100000, 'PROCESSING', 'gấp nhẹ'),
	(6, NULL, 3900000, 'PAID', 'đơn test hệ thống'),
	(7, 104, 3000000, 'CANCELLED', 'gấp nhưng đã hủy'),
	(8, NULL, 4000000, 'CANCELLED', 'auto nhưng hủy'),
	(9, 105, 1000000, 'PAID', 'gấp nhưng quá nhỏ'),
	(10, NULL, 6000000, 'PAID', 'auto nhưng quá lớn'),
	(11, 106, 3000000, 'PAID', 'bình thường'),
	(12, 107, 3500000, 'SHIPPED', 'không có gì đặc biệt'),
	(13, NULL, 7000000, 'PAID', 'auto lớn bất thường'),
	(14, 108, 3000000, 'CANCELLED', 'gấp cực'),
	(15, 109, 2200000, 'PAID', 'gấp xử lý ngay'),
	(16, NULL, 4100000, 'PROCESSING', 'auto urgent'),
	(17, 110, 5000000, 'PAID', 'gấp cuối ngày'),
	(18, NULL, 2000000, 'SHIPPED', 'đơn hệ thống'),
	(19, 111, 4300000, 'PAID', 'gấp nhanh'),
	(20, NULL, 2600000, 'PROCESSING', 'auto order');

SELECT * FROM orders
WHERE total_amount BETWEEN 2000000 AND 5000000;

SELECT * FROM orders
WHERE status_order NOT LIKE '%CANCELLED%';

SELECT * FROM orders
WHERE note LIKE '%gấp%' 
   OR user_id IS NULL;

SELECT *,
	CASE
		WHEN total_amount > 4000000 THEN 'NGUY HIỂM!!!'
        ELSE 'Bình Thường'
	END AS Alert_Level
FROM orders;

SELECT * FROM orders
ORDER BY total_amount DESC
LIMIT 3 OFFSET 5; -- (có thể tùy chỉnh tùy yêu cầu)