CREATE TABLE customers (
    sno INT PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    age INT,
    phone VARCHAR(20),
    location VARCHAR(255),
    created_date DATE DEFAULT CURRENT_DATE,
    created_time TIME DEFAULT CURRENT_TIME
);


INSERT INTO customers (sno, customer_name, age, phone, location, created_at)
VALUES
(1, 'Akash Gupta', 25, '7890123456', 'Delhi', '2023-07-18 10:30:00'),
(1, 'Akash Gupta', 25, '7890123456', 'Delhi', '2023-07-18 10:30:00'),
(2, 'Rahul Singh', 30, '8761234567', 'Mumbai', '2023-11-05 14:15:00'),
(3, 'Vikram Sharma', 22, '9872345678', 'Chennai', '2024-01-23 08:45:00'),
(4, 'Akshay Patel', 35, '7653456789', 'Kolkata', '2023-12-12 11:20:00'),
(5, 'Ananya Kumar', 28, '6574567890', 'Bangalore', '2023-09-30 19:00:00'),
(6, 'Gaurav Gupta', 29, '7895678901', 'Delhi', '2023-08-17 15:40:00'),
(7, 'Vikas Singh', 32, '8766789012', 'Mumbai', '2023-10-06 09:10:00'),
(8, 'Shreya Sharma', 26, '9877890123', 'Chennai', '2023-11-29 20:20:00'),
(9, 'Aarav Patel', 20, '7658901234', 'Kolkata', '2023-10-15 12:30:00'),
(10, 'Anjali Kumar', 38, '6579012345', 'Bangalore', '2023-12-01 07:55:00');

INSERT INTO customers (sno, customer_name, age, phone, location, created_at)
VALUES
(11, 'Naveen Reddy', 27, '7890123456', 'Hyderabad', '2023-07-18 10:30:00'),
(12, 'Suresh Babu', 33, '8761234567', 'Vijayawada', '2023-11-05 14:15:00'),
(13, 'Priya Raju', 29, '9872345678', 'Visakhapatnam', '2024-01-23 08:45:00'),
(14, 'Sarita Rao', 36, '7653456789', 'Guntur', '2023-12-12 11:20:00'),
(15, 'Kiran Kumar', 31, '6574567890', 'Tirupati', '2023-09-30 19:00:00'),
(16, 'Manoj Reddy', 26, '7895678901', 'Anantapur', '2023-08-17 15:40:00'),
(17, 'Divya Naidu', 30, '8766789012', 'Kurnool', '2023-10-06 09:10:00'),
(18, 'Rajesh Shetty', 24, '9877890123', 'Nellore', '2023-11-29 20:20:00'),
(19, 'Deepika Prasad', 40, '7658901234', 'Kakinada', '2023-10-15 12:30:00'),
(20, 'Ajay Kumar', 35, '6579012345', 'Rajahmundry', '2023-12-01 07:55:00');


INSERT INTO customers (sno, customer_name, age, phone, location, created_at)
VALUES
(21, 'Aman Gupta', 29, '7890123456', 'New Delhi', '2023-07-18 10:30:00'),
(22, 'Riya Khanna', 33, '8761234567', 'Gurgaon', '2023-11-05 14:15:00'),
(23, 'Vikas Sharma', 31, '9872345678', 'Noida', '2024-01-23 08:45:00'),
(24, 'Kavita Singh', 35, '7653456789', 'Faridabad', '2023-12-12 11:20:00'),
(25, 'Mohit Verma', 32, '6574567890', 'Dwarka', '2023-09-30 19:00:00'),
(26, 'Anita Malhotra', 27, '7895678901', 'Rohini', '2023-08-17 15:40:00'),
(27, 'Rajat Arora', 30, '8766789012', 'Connaught Place', '2023-10-06 09:10:00'),
(28, 'Shalini Gupta', 36, '9877890123', 'Chandni Chowk', '2023-11-29 20:20:00'),
(29, 'Vishal Singh', 40, '7658901234', 'Janakpuri', '2023-10-15 12:30:00'),
(30, 'Ananya Chopra', 34, '6579012345', 'Pitampura', '2023-12-01 07:55:00'),
(31, 'Arindam Sen', 32, '7890123456', 'Kolkata', '2023-07-18 10:30:00'),
(32, 'Asha Pillai', 33, '8761234567', 'Thiruvananthapuram', '2023-11-05 14:15:00'),
(33, 'Rahul Dasgupta', 30, '9872345678', 'Kolkata', '2024-01-23 08:45:00'),
(34, 'Ramesh Menon', 31, '7653456789', 'Kozhikode', '2023-12-12 11:20:00'),
(35, 'Deboshree Mukherjee', 36, '6574567890', 'Kolkata', '2023-09-30 19:00:00'),
(36, 'Lakshmi Menon', 27, '7895678901', 'Thrissur', '2023-08-17 15:40:00'),
(37, 'Priya Chatterjee', 25, '8766789012', 'Kolkata', '2023-10-06 09:10:00'),
(38, 'Arghya Das', 39, '9877890123', 'Tollygunge', '2023-11-29 20:20:00'),
(39, 'Neetu Nair', 35, '7658901234', 'Kollam', '2023-10-15 12:30:00'),
(40, 'Vinod Pillai', 40, '6579012345', 'Kottayam', '2023-12-01 07:55:00');

INSERT INTO customers (sno, customer_name, age, phone, location, created_at)
VLUES
(41, 'Arindam Sen', 32, '7890123456', 'Kolkata', '2023-07-18 10:30:00'),
(42, 'Asha Pillai', 33, '8761234567', 'Thiruvananthapuram', '2023-11-05 14:15:00'),
(43, 'Rahul Dasgupta', 30, '9872345678', 'Kolkata', '2024-01-23 08:45:00'),
(44, 'Ramesh Menon', 31, '7653456789', 'Kozhikode', '2023-12-12 11:20:00'),
(45, 'Deboshree Mukherjee', 36, '6574567890', 'Kolkata', '2023-09-30 19:00:00'),
(46, 'Lakshmi Menon', 27, '7895678901', 'Thrissur', '2023-08-17 15:40:00'),
(47, 'Priya Chatterjee', 25, '8766789012', 'Kolkata', '2023-10-06 09:10:00'),
(48, 'Arghya Das', 39, '9877890123', 'Tollygunge', '2023-11-29 20:20:00'),
(49, 'Neetu Nair', 35, '7658901234', 'Kollam', '2023-10-15 12:30:00'),
(50, 'Vinod Pillai', 40, '6579012345', 'Kottayam', '2023-12-01 07:55:00'),
(51, 'Arindam Sen', 32, '7890123456', 'Kolkata', '2023-07-18 10:30:00'),
(52, 'Asha Pillai', 33, '8761234567', 'Thiruvananthapuram', '2023-11-05 14:15:00'),
(53, 'Rahul Dasgupta', 30, '9872345678', 'Kolkata', '2024-01-23 08:45:00'),
(54, 'Ramesh Menon', 31, '7653456789', 'Kozhikode', '2023-12-12 11:20:00'),
(55, 'Deboshree Mukherjee', 36, '6574567890', 'Kolkata', '2023-09-30 19:00:00'),
(56, 'Lakshmi Menon', 27, '7895678901', 'Thrissur', '2023-08-17 15:40:00'),
(57, 'Priya Chatterjee', 25, '8766789012', 'Kolkata', '2023-10-06 09:10:00'),
(58, 'Arghya Das', 39, '9877890123', 'Tollygunge', '2023-11-29 20:20:00'),
(59, 'Neetu Nair', 35, '7658901234', 'Kollam', '2023-10-15 12:30:00'),
(60, 'Vinod Pillai', 40, '6579012345', 'Kottayam', '2023-12-01 07:55:00');
INSERT INTO customers (sno, customer_name, age, phone, location, created_at)
VLUES
(61, 'Arindam Sen', 32, '7890123456', 'Thrissur', '2023-07-18 10:30:00'),
(62, 'Asha Pillai', 33, '8761234567', 'Kottayam', '2023-11-05 14:15:00'),
(63, 'Rahul Dasgupta', 30, '9872345678', 'Kollam', '2024-01-23 08:45:00'),
(64, 'Ramesh Menon', 31, '7653456789', 'Kolkata', '2023-12-12 11:20:00'),
(65, 'Deboshree Mukherjee', 36, '6574567890', 'Kozhikode', '2023-09-30 19:00:00'),
(66, 'Lakshmi Menon', 27, '7895678901', 'Thrissur', '2023-08-17 15:40:00'),
(67, 'Priya Chatterjee', 25, '8766789012', 'Kolkata', '2023-10-06 09:10:00'),
(68, 'Arghya Das', 39, '9877890123', 'Tollygunge', '2023-11-29 20:20:00'),
(69, 'Neetu Nair', 35, '7658901234', 'Kollam', '2023-10-15 12:30:00'),
(70, 'Vinod Pillai', 40, '6579012345', 'Kottayam', '2023-12-01 07:55:00'),
(71, 'Arindam Sen', 32, '7890123456', 'Kolkata', '2023-07-18 10:30:00'),
(72, 'Asha Pillai', 33, '8761234567', 'Thrissur', '2023-11-05 14:15:00'),
(73, 'Rahul Dasgupta', 30, '9872345678', 'Kottayam', '2024-01-23 08:45:00'),
(74, 'Ramesh Menon', 31, '7653456789', 'Kozhikode', '2023-12-12 11:20:00'),
(75, 'Deboshree Mukherjee', 36, '6574567890', 'Thiruvananthapuram', '2023-09-30 19:00:00'),
(76, 'Lakshmi Menon', 27, '7895678901', 'Kolkata', '2023-08-17 15:40:00'),
(77, 'Priya Chatterjee', 25, '8766789012', 'Tollygunge', '2023-10-06 09:10:00'),
(78, 'Arghya Das', 39, '9877890123', 'Kolkata', '2023-11-29 20:20:00'),
(79, 'Neetu Nair', 35, '7658901234', 'Kollam', '2023-10-15 12:30:00'),
(80, 'Vinod Pillai', 40, '6579012345', 'Kottayam', '2023-12-01 07:55:00');
