drop database if exists truemart;
create database truemart;
use truemart;

CREATE TABLE `category`(
    `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL
);

CREATE TABLE `users`(
    `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `username` VARCHAR(255) NOT NULL,
    `password` text,
    `role` VARCHAR(255) NOT NULL,
    `firstname` VARCHAR(255) NOT NULL,
    `lastname` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `phonenumber` VARCHAR(255) NOT NULL,
    `address` text
);

CREATE TABLE `shop` (
    `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `id_users` INT NOT NULL,
    `shop_name` VARCHAR(255) NOT NULL,
    `date_created` DATE,
    `avatar` TEXT,
    FOREIGN KEY (`id_users`) REFERENCES `users` (`id`) ON DELETE CASCADE
);

CREATE TABLE `product` (
    `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `category_id` INT NOT NULL,
    `shop_id` INT NOT NULL,
    `image` VARCHAR(255) NOT NULL,
    `price` INT,
    `description` TEXT,
    `details` TEXT,
    `quantity` INT NOT NULL,
    FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE,
    FOREIGN KEY (`shop_id`) REFERENCES `shop` (`id`) ON DELETE CASCADE
);

CREATE TABLE `review`(
    `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `user_id` INT NOT NULL,
    `product_id` INT NOT NULL,
    `content` text,
    `rating` int,
    `post_date` timestamp NOT NULL,
    `status` boolean,
    FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
    FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE
);

CREATE TABLE `transactions` (
  `id` int not null primary key auto_increment,
  `user_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `amount` int NOT NULL,
  `payment` varchar(255) NOT NULL,
  `created` timestamp NOT NULL,
  `status` int NOT NULL,
  FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
);

create table `order`(
 `id` int not null primary key auto_increment,
 `product_id` int NOT NULL,
 `transaction_id` int NOT NULL,
 `qty` int NOT NULL,
 FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE,
 FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE
);


CREATE TABLE contact (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fullname VARCHAR(255),
    email VARCHAR(255),
    website VARCHAR(255),
    subject VARCHAR(255),
    content TEXT
);


insert into category(id,`name`) values
(1,"Máy tính & Máy tính xách tay"),
(2,"Điện thoại & Máy tính bảng"),
(3,"Phụ kiện "),
(4,"Các môn thể thao"),
(5,"Thiết bị điện tử"),
(6,"Nội thất"),
(7,"TV"),
(8,"Thời trang"),
(9,"Sắc đẹp");

INSERT INTO users (id, username, password, role, firstname, lastname, email, phonenumber, address) VALUES 
('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'Admin', 'Nguyễn Văn', 'Anh', 'pallen@yahoo.com', '0987123456', '23 Nguyễn Du, Quận 1, TP.Hồ Chí Minh'),
('2', 'shop01', 'e10adc3949ba59abbe56e057f20f883e', 'Người Bán', 'Trần Thị', 'Mai', 'pallen@yahoo.com', '0918234567', '56 Lê Lợi, Quận Hoàn Kiếm, Hà Nội'),
('3', 'shop02', 'e10adc3949ba59abbe56e057f20f883e', 'Người Bán', 'Lê Minh', 'Tuấn', 'mstephens@davidson-herman.com', '0909345678', '789 Phạm Văn Đồng, Quận Cầu Giấy, Hà Nội'),
('4', 'shop03', 'e10adc3949ba59abbe56e057f20f883e', 'Người Bán', 'Phạm Thị', 'Hương', 'alvareznancy@lucas.biz', '0978456789', '112 Trần Hưng Đạo, Quận Ngô Quyền, Hải Phòng'),
('5', 'dontlookatme20', 'e10adc3949ba59abbe56e057f20f883e', 'Người Bán', 'Hoàng Văn', 'Hòa', 'katherine20@yahoo.com', '0967567890', '456 Lê Thanh Nghị, Quận Hai Bà Trưng, Hà Nội'),
('6', 'dogerlove', 'e10adc3949ba59abbe56e057f20f883e', 'Người Bán', 'Huỳnh Thị', 'Ngọc', 'awatkins@yahoo.com', '0946678901', '37 Nguyễn Thị Minh Khai, Quận 3, TP.Hồ Chí Minh'),
('7', 'theblacktaco', 'e10adc3949ba59abbe56e057f20f883e', 'Người Bán', 'Phan Đình', 'Quân', 'vchurch@walter-martinez.com', '0935789012', '98 Đinh Công Tráng, Quận 1, TP.Hồ Chí Minh'),
('8', 'idkwhattodoy', 'e10adc3949ba59abbe56e057f20f883e', 'Người Bán', 'Võ Thị', 'Thu', 'bonnie69@lin.biz', '0924890123', '205 Võ Văn Tần, Quận 3, TP.Hồ Chí Minh'),
('9', 'hahahahhahelpme', 'e10adc3949ba59abbe56e057f20f883e', 'Người Bán', 'Đặng Văn', 'Quang', 'andrew06@peterson.com', '0893901234', '15 Hoàng Diệu, Quận Thanh Khê, Đà Nẵng'),
('10', 'vicsloan', 'e10adc3949ba59abbe56e057f20f883e', 'Người Bán', 'Bùi Thị', 'Lan', 'knelson@gmail.com', '0882012345', '301 Phan Chu Trinh, Quận Hải Châu, Đà Nẵng'),
('11', 'Xsxcx', 'e10adc3949ba59abbe56e057f20f883e', 'Người Bán', 'Đỗ Văn', 'Khánh', 'taylormason@gmail.com', '0861123456', '72 Trần Hưng Đạo, Quận Hồng Bàng, Hải Phòng'),
('12', 'BizzarGhostGaming', 'e10adc3949ba59abbe56e057f20f883e', 'Người Bán', 'Hồ Thị', 'Thuận', 'rebecca45@hale-bauer.biz', '0850234567', '888 Lê Lai, Quận Thanh Khê, Đà Nẵng'),
('13', 'AmazingDieudo', 'e10adc3949ba59abbe56e057f20f883e', 'Người Bán', 'Ngô Văn', 'Nam', 'alejandro75@hotmail.com', '0849345678', '45 Lê Đình Thám, Quận Hai Bà Trưng, Hà Nội'),
('14', 'RayShmurda6', 'e10adc3949ba59abbe56e057f20f883e', 'Người Bán', 'Dương Thị', 'Trang', 'samuel46@love-west.net', '0838456789', '210 Nguyễn Văn Cừ, Quận Long Biên, Hà Nội'),
('15', 'randomstuff063', 'e10adc3949ba59abbe56e057f20f883e', 'Người Bán', 'Lý Văn', 'Hải', 'ijones@schaefer-carr.net', '0827567890', '134 Đống Đa, Quận Đống Đa, Hà Nội'),
('16', 'llIlIllilIlllI', 'e10adc3949ba59abbe56e057f20f883e', 'Người Bán', 'Phùng Thị', 'Hạnh', 'heatherhall@yahoo.com', '0816678901', '567 Hùng Vương, Quận Hải Châu, Đà Nẵng'),
('17', 'pego_tinn', 'e10adc3949ba59abbe56e057f20f883e', 'Người Bán', 'Trịnh Văn', 'Long', 'tinasmith@martinez.info', '0805789012', '99 Trần Phú, Quận Ba Đình, Hà Nội'),
('18', 'user01', 'e10adc3949ba59abbe56e057f20f883e', 'Khách Hàng', 'Đinh Thị', 'Ngân', 'mstephenson@fernandez.com', '0976890123', '201 Nguyễn Trãi, Quận Thanh Xuân, Hà Nội'),
('19', 'user02', 'e10adc3949ba59abbe56e057f20f883e', 'Khách Hàng', 'Lâm Văn', 'Đức', 'hduke@hotmail.com', '0965901234', '72 Võ Thị Sáu, Quận 1, TP.Hồ Chí Minh'),
('20', 'user03', 'e10adc3949ba59abbe56e057f20f883e', 'Khách Hàng', 'Trương Thị', 'Hằng', 'riverarebecca@gmail.com', '0954012345', '433 Lê Thanh Nghị, Quận Hai Bà Trưng, Hà Nội');

INSERT INTO `shop` (id, id_users, shop_name, date_created, avatar) VALUES 
('1', '2', 'BuyBusters', '2018-07-24', 'shop01.jpg'),
('2', '3', 'Star Square', '2021-02-27', 'shop02.jpg'),
('3', '4', 'East Elm', '2022-06-07', 'shop03.jpg'),
('4', '5', 'SunSide', '2021-10-05', 'shop04.jpg'),
('5', '6', 'Hues of Blues', '2016-10-14', 'shop05.jpg'),
('6', '7', 'Green Team', '2020-03-26', 'shop06.jpg'),
('7', '8', 'Blessed Rest', '2019-11-23', 'shop07.jpg'),
('8', '9', 'The Home Dome', '2018-08-31', 'shop08.jpg'),
('9', '10', 'Peak Performance', '2020-02-03', 'shop09.jpg'),
('10', '11', 'Sweet Street', '2020-04-15', 'shop10.jpg'),
('11', '12', 'SnapStitch', '2017-11-16', 'shop11.jpg'),
('12', '13', 'Code Creations', '2022-09-18', 'shop12.jpg'),
('13', '14', 'Treasure Trove', '2021-05-06', 'shop13.jpg'),
('14', '15', 'FlashFresh', '2019-01-25', 'shop14.jpg'),
('15', '16', 'Pristine Purpose', '2018-04-15', 'shop15.jpg'),
('16', '17', 'Ignition', '2021-08-31', 'shop16.jpg');


INSERT INTO product (id, Name, category_id, shop_id, image, price, description, details, quantity) VALUES 
('1', 'Apple 2020 MacBook Air Laptop M1 Chip', '1', '3', '1.jpg', 2320000, 'MacBook Air 13.3" với màn hình Retina - Bộ đổi nguồn USB Type-C 30W - Cáp sạc USB Type-C (2m) - Bảo hành giới hạn 1 năm của Apple với hỗ trợ kỹ thuật 90 ngày
Chip Apple M1 với CPU 8 nhân và GPU 7 nhân
Công cụ thần kinh 16 lõi
Bộ nhớ thống nhất 8GB
Bộ nhớ SSD 512GB', 'Thương   Apple 
Dòng MacBook   Air
Kích thước màn hình   13,3 inch
Không gian màu   Xám
Kích thước đĩa cứng   512 GB
Mẫu CPU    Apple M1
Bộ nhớ Ram Kích thước cài đặt    8 GB
Hệ điều hành    Mac OS
Mô tả thẻ   Tích hợp
Bộ đồng xử lý đồ họa    M1', '100')
,('2', 'Apple 2021 MacBook Pro - Màu xám không gian - Z14X000HQ', '1', '3', '2.jpg', 2500000, 'Chip Apple M1 Max mang lại bước nhảy vọt về hiệu suất CPU, GPU và máy học
CPU 10 lõi mang lại hiệu suất nhanh hơn gấp 2 lần để xử lý các quy trình làm việc chuyên nghiệp nhanh hơn bao giờ hết
GPU 32 lõi với hiệu suất nhanh hơn gấp 4 lần cho các ứng dụng và trò chơi đòi hỏi nhiều đồ họa
Công cụ thần kinh 16 lõi cho hiệu suất học máy nhanh hơn tới 5 lần
Tuổi thọ pin dài hơn, lên tới 21 giờ
Bộ nhớ hợp nhất 64GB để mọi việc bạn làm đều nhanh chóng và mượt mà
Bộ lưu trữ SSD 2TB siêu nhanh khởi chạy ứng dụng và mở tệp ngay lập tức', 'Thương hiệu   Apple
Dòng MacBook   Pro
Kích thước màn hình   16,2 inch
Kích thước đĩa cứng   2 TB
Mẫu CPU   ARM 7100
Bộ nhớ Ram Kích thước đã cài đặt   64 GB
Hệ điều hành   Mac OS
Mô tả thẻ   Tích hợp
Bộ đồng xử lý đồ họa  M1 Max
Tốc độ CPU   3,2 GHz
', '100')
, ('3', 'Apple 2022 MacBook Air Laptop với M2 chip 13.6-inch Màn hình Retina lỏng', '1', '3', '3.jpg', '2220000', 'THIẾT KẾ MỎNG TUYỆT VỜI - MacBook Air được thiết kế lại có tính di động cao hơn bao giờ hết và chỉ nặng 2,7 pound. Đây là chiếc máy tính xách tay có khả năng đáng kinh ngạc cho phép bạn làm việc, giải trí hoặc sáng tạo mọi thứ — ở mọi nơi.
SIÊU TĂNG BỞI M2 — Hoàn thành công việc nhanh hơn với CPU 8 nhân thế hệ tiếp theo, GPU lên tới 10 nhân và bộ nhớ hợp nhất lên tới 24GB.
THỜI LƯỢNG PIN LÊN ĐẾN 18 GIỜ — Sử dụng cả ngày lẫn đêm nhờ hiệu suất tiết kiệm năng lượng của chip Apple M2.
MÀN HÌNH LỚN, ĐẸP — Màn hình Liquid Retina 13,6 inch có độ sáng trên 500 nit, màu rộng P3 và hỗ trợ 1 tỷ màu cho hình ảnh sống động và độ chi tiết đáng kinh ngạc.
CAMERA VÀ ÂM THANH NÂNG CAO — Hình ảnh sắc nét và âm thanh tuyệt vời với camera FaceTime HD 1080p, dãy ba micrô và hệ thống âm thanh bốn loa với Âm thanh không gian.
KẾT NỐI LINH HOẠT - MacBook Air có cổng sạc MagSafe, hai cổng Thunderbolt và giắc cắm tai nghe.
DỄ DÀNG SỬ DỤNG — Máy Mac của bạn có cảm giác quen thuộc ngay từ khi bạn bật máy và hoạt động trơn tru với tất cả các thiết bị Apple của bạn.', 'Thương hiệu   táo
Tên Model   MacBook Air
Kích thước màn hình   13,6 inch
Màu   bạc
Kích thước đĩa cứng   512 GB
Mẫu CPU   không xác định
Bộ nhớ Ram Kích thước cài đặt   8 GB
Hệ điều hành   Mac OS
Mô tả Card đồ họa   Tích hợp
Bộ đồng xử lý đồ họa Apple   M2', '100')
, ('4', 'Apple MacBook Pro 16 với màn hình Retina XDR lỏng', '1', '3', '4.jpg', '2650000', 'Apple MacBook Pro 16" với màn hình Liquid Retina XDR - Bộ đổi nguồn USB-C 140W - Cáp USB-C sang MagSafe 3 (2m) - Apple Bảo hành có giới hạn 1 năm
Chip Apple M1 Max mang lại bước nhảy vọt về hiệu suất CPU, GPU và máy học
CPU 10 lõi mang lại hiệu suất nhanh hơn gấp 2 lần để xử lý các quy trình làm việc chuyên nghiệp nhanh hơn bao giờ hết
GPU 24 lõi với hiệu suất nhanh hơn gấp 4 lần cho các ứng dụng và trò chơi đòi hỏi nhiều đồ họa
Công cụ thần kinh 16 lõi cho hiệu suất học máy nhanh hơn tới 5 lần', 'Thương hiệu   táo
Kích thước màn hình   16 inch
Mẫu CPU   Apple M1
Bộ nhớ Ram Kích thước đã cài đặt   32 GB
Hệ điều hành   Mac OS
Mô tả   thẻ dành riêng
Độ phân giải   8K
Trọng lượng sản phẩm   8,4 pound
Chipset thương hiệu   Apple
Nhà sản xuất CPU   Apple', '100')
, ('5', 'ASUS ROG Strix G15 (2022) Gaming Laptop G513RC-IS74', '1', '3', '5.jpg', '3700000', 'HÌNH ẢNH RTX SIÊU TĂNG - Đồ họa khi chơi game mượt mà với NVIDIA GeForce RTX 3050 4GB GDDR6 ở 95W với ROG Boost, với các tính năng AI tiên tiến như NVIDIA DLSS và Ray-Tracing
MUX SWITCH BOOST - MUX Switch cho phép GPU giao tiếp trực tiếp với màn hình, tăng hiệu suất và giảm độ trễ
LÀM MÁT THÔNG MINH ROG - một hệ thống tản nhiệt mạnh mẽ với Hợp chất tản nhiệt kim loại lỏng Thermal Grizzly và quạt kép tự làm sạch với công nghệ chống bụi giúp kéo dài tuổi thọ hệ thống
SẴN SÀNG CHO MỌI THỨ - Sử dụng máy tính xách tay chơi game của bạn để phát trực tuyến và thực hiện đa tác vụ một cách dễ dàng nhờ CPU AMD Ryzen 7 6800H với Bộ nhớ đệm 20MB, tốc độ lên đến 4,7 GHz, 8 lõi/16 luồng và 16GB RAM DDR5 4800 MHz cực nhanh trên Windows 11 Home
HÌNH ẢNH SWIFT – Đi trước đối thủ một bước nhờ Màn hình loại IPS 300Hz/3ms 15,6” Full HD (1920 x 1080), bao phủ không gian màu 100% sRGB
BỘ NHỚ KHỔNG LỒ CHO TẤT CẢ TRÒ CHƠI CỦA BẠN - Lưu trữ tất cả thư viện trò chơi của bạn và tải chúng nhanh chóng trên ổ SSD PCIe NVMe M.2 1TB để tận dụng trải nghiệm chơi trò chơi RTX đầy đủ
AURA SYNC - Bàn phím RGB 4 vùng, thanh đèn RGB, Logo RGB', 'thương hiệu   ASUS
Dòng   ROG Strix G15
Kích thước màn hình   15,6 inch
Màu   xám
Kích thước đĩa cứng   1 TB
Mẫu   CPURyzen 7
Bộ nhớ Ram Kích thước cài đặt   16 GB
Hệ điều hành   Windows 11 Home
Mô tả thẻ   GeForce RTX 3050
Bộ đồng xử lý đồ họa NVIDIA GeForce   RTX 3050', '100')
, ('6', 'ASUS ROG Strix G16 (2023) Gaming Laptop G614JI-AS94', '1', '3', '6.jpg', '1600000', 'TĂNG CƯỜNG CHƠI CỦA BẠN - Vẽ nhiều khung hình hơn và thắng nhiều trò chơi hơn với Windows 11, bộ xử lý Intel Core i9-13980HX thế hệ thứ 13 và GPU máy tính xách tay NVIDIA GeForce RTX 4070 ở mức TGP tối đa 140W.
BỘ NHỚ VÀ LƯU TRỮ NHANH CHÓNG – Đa nhiệm nhanh chóng với 16GB bộ nhớ DDR5-4800 MHz và tăng tốc thời gian tải với 1TB PCIe 4x4.
LÀM MÁT THÔNG MINH ROG – Để đưa lượng điện năng này vào một chiếc máy tính xách tay chơi game, bạn cần một giải pháp làm mát thậm chí còn tốt hơn. Strix trang bị kim loại lỏng Conductonaut Extreme của Thermal Grizzly trên CPU và quạt hút thứ ba cùng với các tính năng cao cấp khác để mang lại hiệu năng ổn định tốt hơn trong các phiên chơi game kéo dài.
HÌNH ẢNH NHANH CHÓNG – Strix G16 có tấm nền FHD 165Hz tốc độ nhanh để đảm bảo bạn không bao giờ bỏ lỡ một khoảnh khắc nào. Nó cũng bao phủ 100% không gian màu sRGB và có Dolby Vision, hỗ trợ Adaptive-Sync và tỷ lệ màn hình so với thân máy là 90% cho trải nghiệm xem và chơi game tuyệt vời.
MUX SWITCH VỚI TỐI ƯU NÂNG CAO - MUX Switch tăng hiệu suất chơi game trên máy tính xách tay lên 5-10% bằng cách định tuyến các khung hình trực tiếp từ dGPU đến màn hình mà bỏ qua iGPU. Với Advanced Optimus, việc chuyển đổi giữa iGPU và dGPU trở nên tự động dựa trên tác vụ, tối ưu hóa thời lượng pin.', 'thương hiệu   ASUS
Dòng   ROG Strix G16
Kích thước màn hình   16 inch
Màu xám nhật thực
Mẫu CPU   Intel Core i9
Bộ nhớ Ram Kích thước cài đặt   16 GB
Hệ điều hành   Windows 11 Home
Mô tả   thẻ dành riêng
Bộ đồng xử lý đồ họa   NVIDIA GeForce RTX 4070
Tốc độ CPU   5,6 GHz', '100')
, ('7', 'ASUS TUF Dash 15 (2022) Gaming Laptop Màu đen nhạt, FX517ZM-AS73', '1', '3', '7.jpg', '2300000', 'HÌNH ẢNH RTX SIÊU TĂNG - Đồ họa khi chơi game mượt mà với NVIDIA GeForce RTX 3060 6GB GDDR6 ở 1050W với Dynamic Boost, với các tính năng AI tiên tiến như NVIDIA DLSS và Ray-Tracing
MUX SWITCH BOOST - MUX Switch cho phép GPU giao tiếp trực tiếp với màn hình, tăng hiệu suất và giảm độ trễ
SẴN SÀNG CHO MỌI THỨ - Sử dụng máy tính xách tay chơi game của bạn để phát trực tuyến và thực hiện đa tác vụ một cách dễ dàng nhờ Bộ xử lý Intel Core i7-12650H với Bộ nhớ đệm 24 MB, tốc độ lên tới 4,7 GHz, 10 lõi (6 lõi P và 4 lõi E) và 16GB bộ nhớ trong RAM DDR5 4800 MHz cực nhanh trên Windows 11
HÌNH ẢNH SWIFT – Đi trước đối thủ một bước nhờ Màn hình loại IPS 144Hz 15,6 inch Full HD (1920 x 1080)
BỘ NHỚ KHỔNG LỒ CHO TẤT CẢ TRÒ CHƠI CỦA BẠN - Lưu trữ tất cả thư viện trò chơi của bạn và tải chúng nhanh chóng trên ổ SSD PCIe NVMe M.2 512GB để tận dụng trải nghiệm chơi trò chơi RTX đầy đủ
GIỮ COOL - Quạt Arc Flow tự làm sạch kép với công nghệ chống bụi giúp kéo dài tuổi thọ hệ thống
ĐỘ DẪN CẤP QUÂN ĐỘI - Tiêu chuẩn quân sự MIL-STD-810H bền bỉ tồn tại trong dòng TUF khi các thiết bị được thử nghiệm chống rơi, rung, độ ẩm và nhiệt độ khắc nghiệt để đảm bảo độ tin cậy', 'thương hiệu   ASUS
Dòng   TUF Dash 15 (2022)
Kích thước màn hình   15,6 inch
Tắt   màu đen
Kích thước đĩa cứng   512 GB
Mẫu CPU   Core i7
Bộ nhớ Ram Kích thước cài đặt   16 GB
Hệ điều hành Windows   11 Home
Mô tả thẻ   RTX 3060
Bộ đồng xử lý đồ họa   NVIDIA GeForce RTX 3060', '100')
, ('8', 'ASUS VivoBook 15X OLED Laptop M1503QA-ES74', '1', '3', '8.jpg', '2650000', 'Màn hình OLED 15,6 inch FHD (1920 x 1080) tỷ lệ khung hình 16:9 với viền NanoEdge siêu mỏng
Thời gian phản hồi 0,2ms, độ sáng tối đa 600nits, gam màu 100% DCI-P3, tỷ lệ tương phản 1.000.000:1, Màn hình VESA CERTIFIED HDR True Black 600
Bộ xử lý di động AMD Ryzen 7 5800H mới nhất (8 nhân/16 luồng, bộ nhớ đệm 20 MB, tăng tốc tối đa lên tới 4,4 GHz) và Đồ họa AMD Radeon
Bộ lưu trữ và bộ nhớ nhanh có SSD 512GB M.2 NVMe PCIe 3.0 và 8GB DDR4 trên bo mạch + RAM 8GB DDR4 SO-DIMM, Windows 11 Home
Khả năng kết nối mở rộng với 2x USB 3.2 Gen 1 Type-C, USB 2.0 Loại A, Giắc âm thanh kết hợp 3,5 mm, Wi-Fi 6(802.11ax)+Bluetooth 5.0 (Băng tần kép) 2*2 (*Tốc độ truyền USB có thể thay đổi. Tìm hiểu thêm tại ASUS.com)', 'thương hiệu ASUS
Dòng M1503QA-ES74
Kích thước màn hình 15,6
Màu xanh dương yên tĩnh
Kích thước đĩa cứng 512 GB
Mẫu CPURyzen 7
Bộ nhớ Ram Kích thước cài đặt 16 GB
Hệ điều hành Windows 11 Home
Mô tả thẻ Tích hợp
Bộ đồng xử lý đồ họa GPU AMD Radeon', '100')
, ('9', 'ASUS Vivobook Laptop L210 11.6 Ultra Thin Laptop L210MA-DS04', '1', '3', '9.jpg', '2450000', 'Năng suất mạnh mẽ: Bộ xử lý Intel Celeron N4020 hiệu quả 1,1 GHz (4M Cache, lên đến 2,8 GHz) và đồ họa Intel UHD mang lại tốc độ và trí thông minh chưa từng có, cho phép tạo ra và năng suất ấn tượng
Rõ ràng là ấn tượng: Trải nghiệm các chi tiết sắc nét và màu sắc sinh động trên Màn hình mỏng 11,6 inch HD (1366 x 768) với tỷ lệ màn hình so với thân máy là 73%, tỷ lệ khung hình 16:9
Thông số kỹ thuật bên trong: Bộ lưu trữ Flash eMMC 128GB và RAM DDR4 4GB để lưu trữ các tệp của bạn
Hệ điều hành an toàn: Windows 11 Home ở chế độ S đi kèm với các tính năng bảo mật nâng cao được tích hợp sẵn, chẳng hạn như các biện pháp bảo vệ chống lừa đảo và phần mềm độc hại, do đó bạn không cần phải suy nghĩ kỹ khi điều hướng đến một trang web mới hoặc tải xuống ứng dụng
Cổng cho tất cả phụ kiện của bạn: USB 3.2 Gen 1 Type-C, USB 3.2 Gen 1 Type-A, HDMI (*Tốc độ truyền USB có thể thay đổi. Tìm hiểu thêm tại trang web ASUS)
Mỏng và di động: mỏng 0,7” và chỉ nặng 2,31 lbs (bao gồm pin)
Có gì trong hộp: Laptop ASUS Vivobook, Bộ đổi nguồn AC, Dây nguồn, Hướng dẫn sử dụng, Thẻ bảo hành', 'thương hiệu ASUS
Dòng ASUS Vivobook Go 12
Kích thước màn hình 11.6
Màu Sao Đen
Dung lượng ổ cứng 128 GB
Mẫu CPU Celeron
Bộ nhớ Ram Kích thước cài đặt 4 GB
Hệ điều hành Windows 11 S
Mô tả thẻ Tích hợp
Tốc độ CPU 2,8 GHz', '100')
, ('10', 'Lenovo 14inch HD Laptop, Intel Pentium Bạc ', '1', '3', '10.jpg', '2420000', 'Màn hình có đèn nền LED 14 inch HD với công nghệ chống chói (1366 x 768), Đồ họa tích hợp Intel UHD 605
Bộ xử lý Intel Pentium Silver Quad-Core N5030 Tốc độ lên tới 3,10 GHz, SSD NVMe 128 GB, Ram DDR4 4GB
1x HDMI, 2x Cổng USB, 1x Đầu đọc thẻ nhớ, 1x Giắc cắm kết hợp tai nghe/micrô
Webcam tích hợp và micrô dãy kép, Dolby Audio, Wi-Fi 802. 11AC và Bluetooth 4.1 Combo
Hệ điều hành Windows 10 ở Chế độ S, Bao gồm ổ USB 16GB JJTK', 'thương hiệu Lenovo
Tên Model Laptop Lenovo 14inch
Kích thước màn hình 14 inch
Dung lượng ổ cứng 128 GB
Mẫu CPU Di động Bộ xử lý Intel Pentium 4
Bộ nhớ Ram Kích thước cài đặt 4 GB
Hệ điều hành Windows 10
Mô tả Card đồ họa Đồ họa Intel UHD
Bộ đồng xử lý đồ họa Intel UHD Graphics 605
Tốc độ CPU 1,1 GHz', '100')
, ('11', 'Laptop Lenovo Ideapad 3 mới nhất 2022', '1', '3', '11.jpg', '1300000', '【Bộ nhớ & Lưu trữ】 Bộ nhớ là RAM băng thông cao 8GB để chạy mượt mà nhiều ứng dụng và tab trình duyệt cùng một lúc. Ổ cứng là 256GB PCIe Solid State Drive cho phép khởi động và truyền dữ liệu nhanh chóng
【Bộ xử lý】 Bộ xử lý Intel Core i3-1115G4 lõi kép 3.0GHz thế hệ thứ 11 (Intel Smart Cache 6MB, lên đến 4.10GHz) Đồ họa Intel UHD
【Màn hình】Màn hình cảm ứng HD 15,6" (1366 x 768)
[Cổng] 2 x USB 3.2 Gen 1 Loại A, 1 x USB 2.0 Loại A, 1 x HDMI, 1 x Giắc cắm âm thanh kết hợp, 1 x Đầu đọc thẻ nhớ SD đa định dạng, Wi-Fi 5 + Bluetooth không dây kết hợp
【Hệ điều hành】Windows 11 Home', 'thương hiệu Lenovo
Dòng IdeaPad 3 81X800ENUS
Kích thước màn hình 15,6 inch
Màu hạnh nhân
Kích thước đĩa cứng 256 GB
Mẫu CPU Core i3
Bộ nhớ Ram Kích thước đã cài đặt 20 GB
Hệ điều hành Windows 11
Mô tả thẻ Tích hợp
Bộ đồng xử lý đồ họa Đồ họa Intel UHD', '100')
, ('12', 'Gói máy tính xách tay IdeaPad 3i mới nhất của Lenovo 2023', '1', '3', '12.jpg', '2640000', '【Bộ xử lý】 Được trang bị Intel Core i5-1235U, 1,3 GHz (Tối đa Turbo Boost 4,4 GHz, 10 lõi, 12 luồng). Laptop 10 nhân thứ 12 mang đến hiệu năng hoàn hảo, khiến bạn không thể ngăn cản. Đây là một chiếc máy tính xách tay lý tưởng giúp bạn hoàn thành công việc nhanh chóng.
【Màn hình IPS FHD 15,6 inch】 Độ phân giải 1920 x 1080 300nits cho hình ảnh rõ nét tuyệt đẹp. Đồ họa Intel Iris Xe cung cấp chất lượng hình ảnh ổn định khi sử dụng Internet. Độ dày chỉ 0,78 inch, dễ dàng mang theo. Viền hẹp 4 cạnh của màn hình giúp bạn có nhiều màn hình xem hơn
[Đã nâng cấp] RAM lên tới 24GB được thiết kế cho các tác vụ cơ bản, RAM DDR4 băng thông cao chạy mượt mà các ứng dụng của bạn cũng như nhiều chương trình và tệp cùng một lúc. Dung lượng lưu trữ lên tới 1TB phù hợp để lưu tất cả các tệp của bạn và cung cấp đủ dung lượng để lưu nhiều dữ liệu hơn.
[Kết nối] Kết nối với WiFi 6E-802.11 để trải nghiệm tốc độ Wi-Fi GB nhanh hơn gần 3 lần so với Wi-Fi 5 tiêu chuẩn với khả năng phản hồi được cải thiện cho nhiều thiết bị hơn nữa. Giữ cho bàn làm việc của bạn không bị lộn xộn với cổng Type-C đầy đủ chức năng để truyền dữ liệu, cấp nguồn nhanh hơn và kết nối màn hình 4K; Ngoài ra còn có các cổng USB 3.2 Gen 1 Type-A, USB 2.0 Type-A và HDMI
[Hệ điều hành] Windows 11 Pro, trải nghiệm Windows an toàn nhất từng được xây dựng với thời gian khởi động nhanh, khả năng phản hồi nhanh hơn, đồng thời bổ sung khả năng bảo vệ chống lừa đảo và phần mềm độc hại, đồng thời duy trì thời lượng pin dài.', 'thương hiệu Lenovo
Dòng Lenovo IdeaPad 3i
Kích thước màn hình 15,6 inch
Màu xám
Kích thước đĩa cứng 1 TB
Mẫu CPU Intel Core i5
Bộ nhớ Ram Kích thước cài đặt 8 GB
Hệ điều hành Windows 11 Pro
Mô tả thẻ Tích hợp
Bộ đồng xử lý đồ họa Đồ họa Intel Iris Xe', '100')
, ('13', 'Laptop Lenovo IdeaPad 3i Màu xám', '1', '3', '13.jpg', '999000', '[RAM tốc độ cao và dung lượng lớn] RAM DDR4 20GB để chạy mượt mà nhiều ứng dụng và tab trình duyệt cùng một lúc; Ổ cứng thể rắn 512GB PCIe M.2 cho phép khởi động và truyền dữ liệu nhanh chóng
[Bộ xử lý] Bộ xử lý 2 nhân Intel Core i3-1115G4 3,00 GHz (Bộ nhớ đệm 6 MB, tối đa 4,10 GHz), Đồ họa Intel UHD
[Màn hình rực rỡ] Màn hình cảm ứng HD 15,6 inch với viền hẹp
[Thông số kỹ thuật] 2 x USB loại A siêu tốc, 1 x USB 2.0 loại A, 1 x HDMI, 1 x Combo tai nghe/micrô; Đầu đọc thẻ SD; Wi-Fi 6
[Hệ điều hành] Windows 11 Home-Thiết kế mới đẹp, nhất quán hơn, Tùy chọn bố cục cửa sổ tuyệt vời, Chức năng đa màn hình tốt hơn, Tính năng hiệu suất được cải thiện, Khả năng và lựa chọn trò chơi điện tử mới, Tương thích với Ứng dụng Android', 'thương hiệu Lenovo
Dòng IdeaPad
Kích thước màn hình 15,6 inch
Màu xám
Kích thước đĩa cứng 512 GB
Mẫu CPU Core i3
Bộ nhớ Ram Kích thước đã cài đặt 20 GB
Hệ điều hành Windows 11 Home
Mô tả thẻ Tích hợp
Bộ đồng xử lý đồ họa Đồ họa Intel UHD', '100')
, ('14', 'Điện thoại di động SAMSUNG Galaxy S22 Ultra, phiên bản Mỹ, Bur', '2', '3', '14.jpg', '3000000', 'VIDEO 8K SIÊU ỔN ĐỊNH: Quay những video hoành tráng như cuộc sống của bạn với khả năng quay 8K tuyệt đẹp, độ phân giải ghi cao nhất hiện có trên điện thoại thông minh; Video được quay cực kỳ mượt mà nhờ tính năng Ổn định video tự động lấy nét trên Galaxy S22 Ultra.Form_factor : Điện thoại thông minh
CHẾ ĐỘ NIGHTOGRAPHY cộng với CHẾ ĐỘ CHÂN DUNG: Ghi lại màn đêm với những bức ảnh và video sáng rõ, trong trẻo, bất kể ánh sáng với Chế độ ban đêm; Chế độ chân dung tự động phát hiện và điều chỉnh theo những gì bạn muốn ở phía trước và giữa, làm cho tất cả các bức ảnh của bạn xứng đáng được đưa vào khung hình
ĐỘ PHÂN GIẢI ẢNH 108MP cộng với MÀN HÌNH SÁNG: Ghi lại chi tiết cao cấp với độ phân giải 108MP— độ phân giải cao nhất hiện có trên điện thoại di động; Nội dung yêu thích của bạn sẽ còn hoành tráng hơn nữa trên màn hình sáng nhất từ trước đến nay của chúng tôi với Vision Booster
TƯƠNG PHÁP MÀU SẮC THÍCH ỨNG: Phát trực tuyến khi đang di chuyển, làm việc từ sân hiên của bạn hoặc xem say sưa đến tận đêm khuya. Màn hình thích ứng Galaxy S22 Ultra tự động tối ưu màu sắc và độ sáng, ngoài trời và trong nhà
PIN LÂU DÀI cộng với SẠC NHANH: Cung cấp năng lượng cho mỗi lần cuộn, nhấp, chạm và phát trực tuyến suốt cả ngày và sau đó là một số pin thông minh, lâu dài; Bắt tay vào hành động ngay lập tức với tính năng Sạc siêu nhanh 45W
S PEN NHÚNG: Điện thoại mới, S Pen mới; Giờ đây, bạn có thể thỏa sức sáng tạo trên Galaxy S22 Ultra bằng bút S Pen tích hợp; Chỉnh sửa ảnh và video với độ chính xác tuyệt đối và thực hiện tất cả bằng cảm giác viết trên giấy
THIẾT KẾ & THỦ CÔNG CAO CẤP: Với thiết kế kính-kim loại-kính sang trọng, bắt mắt, chúng tôi đang đặt ra tiêu chuẩn cho điện thoại thông minh; Với khung nhôm chắc chắn nhất của chúng tôi và kính Gorilla Glass mới nhất, điện thoại này nhẹ và bền để giúp chống trầy xước và va đập
Lưu ý: Sản phẩm có phích cắm điện được thiết kế để sử dụng tại Mỹ. Ổ cắm và điện áp khác nhau trên phạm vi quốc tế và sản phẩm này có thể yêu cầu bộ chuyển đổi hoặc bộ chuyển đổi để sử dụng ở nơi bạn đến. Vui lòng kiểm tra khả năng tương thích trước khi mua.
', 'Thương hiệu SAMSUNG
Tên mẫu S22 Ultra
Nhà cung cấp dịch vụ không dây đã được mở khóa
Hệ điều hành Android 12.0
Công nghệ di động GSM, CDMA, HSPA, EVDO, LTE, 5G
Dung lượng lưu trữ bộ nhớ 128 GB
Công nghệ kết nối Bluetooth, Wi-Fi
Màu đỏ tía
Kích thước màn hình 6,8 inch
Công nghệ mạng không dây GSM, CDMA, LTE', '100')
, ('15', 'Điện thoại SAMSUNG Galaxy Z Flip 4 phiên bản Mỹ, Bora Purple', '2', '3', '15.jpg', '4100000', 'FLEX, POSE, POST: Thật dễ dàng để có được bức ảnh solo xứng đáng sau đó với một chiếc điện thoại tự đứng; Đặt Galaxy Z Flip4 ở Chế độ linh hoạt và chụp những bức ảnh selfie rảnh tay, ghi lại những bước nhảy hoành tráng của bạn và không bao giờ phải lo lắng về việc chân máy tạm thời của bạn bị đổ nữa.Form_factor : Flip
CHỤP TRÊN MỘT MÀN HÌNH, VĂN BẢN TRÊN KHÁC: Trò chuyện với bạn bè ở phía trên và tìm bức ảnh hoàn hảo để đăng ở phía dưới; Chế độ linh hoạt giúp thực hiện hai việc cùng lúc một cách dễ dàng
KHÔNG BAO GIỜ BỎ LỠ THÔNG BÁO: Màn hình ngoài có thể tùy chỉnh trên Galaxy Z Flip4 cho phép bạn xem đúng những gì bạn cần trong khi vẫn giữ toàn màn hình ở chế độ riêng tư; Trả lời tin nhắn, bỏ qua bài hát và thay đổi cài đặt trong khi vẫn giữ cho điện thoại di động của bạn nhỏ gọn một cách tiện lợi
KÍCH THƯỚC BỎ TÚI HOÀN HẢO: Bỏ túi và đèn du lịch; Thiết kế nhỏ gọn, có thể gập lại cho phép bạn tạm biệt số lượng lớn mà không phải hy sinh màn hình lớn; Trượt điện thoại thông minh của bạn dễ dàng vào túi trước của bạn
TUYÊN BỐ TUYÊN BỐ THỜI TRANG: Điện thoại của bạn là phụ kiện được sử dụng nhiều nhất, vậy tại sao không biến nó thành một phần mở rộng cho phong cách của bạn, Chọn từ một loạt màu sắc và tùy chỉnh màn hình bìa để điện thoại di động phù hợp với cảm xúc của bạn
GIỮ ĐỒNG BỘ: Luôn cập nhật các thông báo hoặc theo dõi quá trình tập luyện của bạn ngay trên cổ tay; Galaxy Z Flip4 dễ dàng đồng bộ hóa với Galaxy Watch của bạn và với một loạt tùy chọn màu sắc, bạn có thể có được một chiếc phù hợp với tâm trạng của mình
GALAXY Z Flip4 & BUDS CÙNG NHAU TỐT HƠN: Ghép nối Galaxy Z Flip4 của bạn với Galaxy Buds và luôn cập nhật các thông báo hoặc theo dõi danh sách phát hoặc podcast khi đang di chuyển; Đơn giản chỉ cần đồng bộ hóa thiết bị của bạn và giữ cho thế giới của bạn được kết nối', 'Thương hiệu SAMSUNG
Tên mẫu Galaxy Z Flip4
Nhà cung cấp dịch vụ không dây đã được mở khóa
Hệ điều hành Android 12.0
Công nghệ di động LTE, GSM, WCDMA, UMTS
Dung lượng lưu trữ bộ nhớ 128 GB
Công nghệ kết nối Bluetooth, Wi-Fi, USB, NFC
Màu tím Bora
Công nghệ mạng không dây Wi-Fi
Bộ nhớ Ram Kích thước cài đặt 8 GB', '100')
, ('16', 'SAMSUNG Galaxy Z Fold 4 Điện thoại di động S Pen Tương thích, Phiên bản Hoa Kỳ, Màu be', '2', '3', '16.jpg', '2200000', 'CHẾ ĐỘ FLEX: Giải phóng đôi tay của bạn với Chế độ Flex trên Galaxy Z Fold4; Điện thoại thông minh này có thể tự đứng để bạn có thể ghi chú trong cuộc gọi hội nghị hoặc làm theo các video hướng dẫn trong thời gian thực.Form_factor : Gấp
VIDEO Rảnh tay: Đừng dán mắt vào điện thoại di động của bạn; Thiết lập điện thoại của bạn ở Chế độ linh hoạt và kiểm tra việc cần làm của bạn trong khi liên lạc với bạn bè; Trò chuyện video rảnh tay cho phép bạn thực hiện nhiều nhiệm vụ và di chuyển tự do trong khi vẫn ở trong khung hình
CỬA SỔ ĐA XEM: Dễ dàng tham dự cuộc họp công việc ảo và ghi lại các ghi chú quan trọng cùng lúc hoặc xem các chương trình yêu thích khi bạn trả lời tin nhắn; Với nhiều cửa sổ, thực hiện nhiều tác vụ khác nhau thật dễ dàng với Galaxy Z Fold4
S PEN SẴN SÀNG: Biến Galaxy Z Fold4 của bạn thành một thiết bị đa chức năng với S Pen; Nó mang lại cho bạn cảm giác như đang viết trên giấy và giúp bạn dễ dàng ghi chú khi tham dự các cuộc họp ảo, kéo và thả nội dung cũng như làm được nhiều việc hơn
ỨNG DỤNG CỦA BẠN, THEO CÁCH CỦA BẠN: Tối ưu hóa hiển thị ứng dụng cho phép bạn tùy chỉnh cách bạn xem các ứng dụng trên màn hình tràn cạnh của Galaxy Z Fold4; Ngoài ra, hãy sử dụng tối đa tiềm năng của nhiều ứng dụng bằng cách kéo và thả nội dung từ cửa sổ này sang cửa sổ khác
ĐIỆN THOẠI & ĐỒNG HỒ CỦA BẠN HOẠT ĐỘNG NHƯ MỘT: Khám phá các khả năng của Galaxy Z Fold4 được kết nối với Galaxy Watch của bạn; Sử dụng Đồng hồ của bạn để chụp ảnh selfie rảnh tay với Chế độ linh hoạt; Ngoài ra, hãy theo dõi ngày của bạn bằng cách dễ dàng chuyển đổi giữa Galaxy Watch và điện thoại
MÀN HÌNH LỚN, ÂM THANH LỚN: Cần ra ngoài khi bạn đang nghe podcast yêu thích của mình, hãy nhét Galaxy Z Fold4 vào túi của bạn và tiếp tục nghe bằng Galaxy Buds; Mở rộng khả năng kết nối khi điện thoại thông minh của bạn và Buds hoạt động cùng nhau
Lưu ý: Sản phẩm có phích cắm điện được thiết kế để sử dụng tại Mỹ. Ổ cắm và điện áp khác nhau trên phạm vi quốc tế và sản phẩm này có thể yêu cầu bộ chuyển đổi hoặc bộ chuyển đổi để sử dụng ở nơi bạn đến. Vui lòng kiểm tra khả năng tương thích trước khi mua.', 'Thương hiệu SAMSUNG
Tên mẫu Galaxy Z Fold4
Nhà cung cấp dịch vụ không dây đã được mở khóa cho tất cả các nhà cung cấp dịch vụ
Hệ điều hành Android
Công nghệ di động 5G
Dung lượng lưu trữ bộ nhớ 256 GB
Công nghệ kết nối Bluetooth, USB
Màu be màu
Công nghệ mạng không dây Wi-Fi
Bộ nhớ Ram Kích thước đã cài đặt 12 GB', '100')
,('17', 'Apple 2021 iPad 10,2 inch (Wi-Fi, 64GB) - Xám không gian', '2', '3', '17.jpg', '3200000', 'Màn hình Retina 10,2 inch tuyệt đẹp với True Tone
Chip A13 Bionic với Neural Engine
Camera sau rộng 8MP, Camera trước siêu rộng 12MP với Sân khấu trung tâm
Dung lượng lưu trữ lên tới 256GB
Loa âm thanh nổi
Touch ID để xác thực an toàn và Apple Pay
Wi-Fi 802.11ac
Thời lượng pin lên tới 10 giờ
Đầu nối Lightning để sạc và phụ kiện
Hoạt động với Apple Pencil (thế hệ 1) và Bàn phím thông minh', 'Thương hiệu táo
Tên mẫu iPad
Dung lượng lưu trữ bộ nhớ 64 GB
Kích thước màn hình 10,2 inch
Độ phân giải màn hình Tối đa 2160x1620 Pixels', '100')
, ('18', 'iPhone 13 Pro, 256GB, Sierra Blue - Đã mở khóa (Renewed Premium)', '2', '3', '18.jpg', '2650000', 'Đã mở khóa
Đã kiểm tra tình trạng pin và đảm bảo đi kèm pin vượt quá 90% dung lượng ban đầu.
Đã được kiểm tra và đảm bảo hạn chế tối đa hư hỏng về mặt thẩm mỹ, không thể nhận thấy khi thiết bị được giữ ở khoảng cách bằng sải tay. Đã vượt qua thành công bài kiểm tra chẩn đoán đầy đủ để đảm bảo chức năng như mới và xóa mọi thông tin cá nhân của người dùng trước.
Bao gồm một cáp sạc chung, hoàn toàn mới được chứng nhận Mfi (Sản xuất cho iPhone) và một phích cắm tường chung, hoàn toàn mới được chứng nhận UL về hiệu suất và độ an toàn. Cũng bao gồm một công cụ tháo khay SIM nhưng không đi kèm tai nghe hoặc thẻ SIM.
Được hỗ trợ bởi chính sách đảm bảo sự hài lòng trong một năm tương tự như các sản phẩm hoàn toàn mới của Apple.
Lưu ý: Sản phẩm có phích cắm điện được thiết kế để sử dụng tại Mỹ. Ổ cắm và điện áp khác nhau trên phạm vi quốc tế và sản phẩm này có thể yêu cầu bộ chuyển đổi hoặc bộ chuyển đổi để sử dụng ở nơi bạn đến. Vui lòng kiểm tra khả năng tương thích trước khi mua.', 'Thương hiệu táo
Tên mẫu iPhone 13 Pro
Nhà cung cấp dịch vụ không dây đã được mở khóa cho tất cả các nhà cung cấp dịch vụ
Hệ điều hành iOS 16
Công nghệ di động 5G
Dung lượng lưu trữ bộ nhớ 256 GB
Công nghệ kết nối Wi-Fi
Màu xanh Sierra
Kích thước màn hình 6,1 inch
Công nghệ mạng không dây GSM', '100')
,('19', 'iPhone 13, 128GB, Nửa đêm - Đã mở khóa (Renewed Premium)', '2', '3', '19.jpg', '2700000', 'Màn hình Super Retina XDR 6,1 inch. Tải xuống 5G cực nhanh, phát trực tuyến chất lượng cao
Chế độ điện ảnh ở 1080p ở tốc độ 30 khung hình / giây. Quay video Dolby Vision HDR lên tới 4K ở tốc độ 60 khung hình / giây. Phạm vi zoom quang học 2X
Chip Bionic A15. CPU 6 nhân mới với 2 lõi hiệu năng và 4 lõi hiệu quả. GPU 4 nhân mới. Công cụ thần kinh 16 lõi mới
Phát lại video lên tới 19 giờ. ID khuôn mặt. Mặt trước bằng tấm chắn gốm. Nhôm cấp hàng không vũ trụ
Khả năng chống nước ở độ sâu 6 mét trong tối đa 30 phút. Tương thích với các phụ kiện MagSafe và bộ sạc không dây
Lưu ý: Sản phẩm có phích cắm điện được thiết kế để sử dụng tại Mỹ. Ổ cắm và điện áp khác nhau trên phạm vi quốc tế và sản phẩm này có thể yêu cầu bộ chuyển đổi hoặc bộ chuyển đổi để sử dụng ở nơi bạn đến. Vui lòng kiểm tra khả năng tương thích trước khi mua.', 'Thương hiệu táo
Tên mẫu iPhone 13
Nhà cung cấp dịch vụ không dây đã được mở khóa cho tất cả các nhà cung cấp dịch vụ
Hệ điều hành iOS 16
Công nghệ di động 5G
Dung lượng lưu trữ bộ nhớ 128 GB
Công nghệ kết nối Bluetooth
Màu sắc nửa đêm
Kích thước màn hình 6,1 inch
Công nghệ mạng không dây GSM', '100'),
('20', 'Olly Kẹo dẻo làm đẹp không thể phủ nhận, Cho tóc, da, móng, Biotin, Vitamin C, Keratin', '9', '9', '20.jpg', '300000', "VẺ ĐẸP KHÔNG THỂ PHẢI BỎ QUA: Kẹo dẻo làm đẹp OLLY thơm ngon được đóng gói với sự pha trộn hoàn hảo của các hoạt chất giúp giữ cho tóc và móng tay của bạn luôn ở trạng thái tốt nhất và làn da của bạn tỏa sáng*
Lưu ý về sản phẩm: Tiếp xúc với nhiệt hoặc ánh sáng mặt trời có thể dẫn đến tan chảy/hư hỏng sản phẩm. Do đó, khách hàng dự kiến sẽ có mặt trong quá trình giao sản phẩm.
HÀNG HÓA BÊN TRONG: Biotin là chất dinh dưỡng cần thiết để hỗ trợ tóc và móng khỏe mạnh. Vitamin C là chất dinh dưỡng quan trọng trong việc sản xuất collagen (loại protein góp phần mang lại sức khỏe và sự trẻ trung cho làn da của bạn) và Keratin giúp nuôi dưỡng tóc*
CÁCH DÙNG: Nhai hai viên kẹo dẻo, không cần thức ăn hay nước uống
NGON TỰ NHIÊN: Những viên kẹo dẻo làm đẹp này có hương vị Bưởi Glam tự nhiên, không có màu sắc hoặc hương vị nhân tạo và không chứa gluten. 60 viên kẹo dẻo mỗi chai (cung cấp trong 30 ngày)
HỖN HỢP VÀ KẾT HỢP: Các sản phẩm OLLY thơm ngon và thú vị có thể được kết hợp với nhau—pha trộn và kết hợp theo ý muốn
TUYỆT VỜI HƠN NỮA: Chúng tôi tạo ra những sản phẩm vừa hiệu quả vừa thơm ngon—kẹo dẻo, vitamin tổng hợp, viên nang mềm cao cấp và nhiều cách khác để cảm thấy hạnh phúc từ trong ra ngoài
Lưu ý: Sản phẩm có phích cắm điện được thiết kế để sử dụng tại Mỹ. Ổ cắm và điện áp khác nhau trên phạm vi quốc tế và sản phẩm này có thể yêu cầu bộ chuyển đổi hoặc bộ chuyển đổi để sử dụng ở nơi bạn đến. Vui lòng kiểm tra khả năng tương thích trước khi mua.", '
thương hiệu OLLY
Dạng sản phẩm Kẹo dẻo
Loại chế độ ăn kiêng không chứa gluten
Hương vị bưởi Glam
Công dụng sản phẩm Dưỡng móng, Dưỡng tóc, Làm sáng da
Thành phần đặc biệt Collagen
Độ tuổi (Mô tả) Người lớn
Thông tin đóng gói Chai
Đếm đơn vị Đếm 60
Số mục 1', '170'),
('21', 'Pacifica Beauty, Glow Baby Booster Serum dành cho da mặt, Vitamin C và axit Glycolic, Làm sáng và hỗ trợ,', '9', '10', '21.jpg', '250000', "TĂNG CƯỜNG ĐỘ ẨM CHO LÀN DA CỦA BẠN với huyết thanh hoạt tính sinh học đậm đặc này giúp dưỡng ẩm và làm dịu làn da khô, xỉn màu để cải thiện kết cấu và độ sáng
CÔNG THỨC CHO TẤT CẢ CÁC LOẠI DA, huyết thanh tăng cường Glow Baby của chúng tôi có thể được sử dụng riêng hoặc để chuẩn bị cho làn da của bạn trước khi trang điểm để giữ cho làn da trông mềm mại đồng thời giảm thiểu độ bóng
ĐƯỢC LÀM BẰNG CÁC THÀNH PHẦN TỰ NHIÊN VÀ THUẦN CHAY bao gồm vitamin C và axit glycolic, sự kết hợp giữa chất chống oxy hóa mạnh mẽ và AHA mang lại làn da tươi sáng trẻ trung của bạn
CÓ THỂ SỬ DỤNG NGÀY VÀ ĐÊM và bôi lại để làm sạch da bất cứ khi nào cần thêm nước, hoặc thêm vào kem dưỡng ẩm yêu thích của bạn để tăng thêm hiệu quả
KHÔNG CHỨA CHẤT HÓA CHẤT HẤP DẪN bao gồm paraben, phthalates, SLS, dầu khoáng và xăng dầu, cũng như không chứa sunfat và không chứa silicone", 'Có sẵn ở mức giá thấp hơn từ những người bán khác có thể không cung cấp dịch vụ vận chuyển Prime miễn phí.
Loại da Bình thường
Lợi ích sản phẩm
Mùi Hương Vani, Cam
thương hiệu Pacifica
Dạng sản phẩm Huyết thanh', '400'),
('22', 'Real Techniques Mini Miracle Complexion Sponge Máy xay trang điểm, Beauty Sponge For Touch Up', '9', '9', '22.jpg', '150000', 'Miếng bọt biển làm da thần kỳ mini của Real Techniques là miếng bọt biển làm da thần kỳ mini đa chức năng 3 trong 1 mang lại làn da mịn màng và tự nhiên
Bộ 4 miếng bọt biển làm da thần kỳ mini
Sử dụng tốt nhất với kem nền dạng lỏng hoặc dạng kem
Công nghệ tạo bọt mang tính cách mạng không chứa latex được làm từ bọt polyurethane
Tuyệt vời cho việc liên lạc khi đang di chuyển và đi du lịch.
100% không độc hại, thuần chay và không có latex
Món quà tuyệt vời cho con gái, vợ, bạn gái, vợ/chồng hoặc những người quan trọng khác', 'Thương hiệu Real Kỹ thuật
Màu sắc Các loại màu sắc
Chất liệu Bọt, Polyurethane
Kích thước sản phẩm LxWxH 2,91 x 1,69 x 4,31 inch
Loại da Dầu, Hỗn hợp, Nhạy cảm, Khô, Bình thường', '300'),
('23', 'NYX CHUYÊN NGHIỆP MAKEUP Butter Gloss, Son Bóng Không Dính - Sugar Glass', '9', '10', '23.jpg', '120000', "Butter Gloss: Mềm như bơ và mịn mượt, Butter Gloss suy đồi của chúng tôi có sẵn nhiều sắc thái xa hoa; Mỗi màu bóng mang lại độ che phủ từ trung bình đến trung bình, tan chảy trên môi bạn
Đôi môi có thể hôn: Butter Gloss bán chạy nhất của chúng tôi mềm mịn như kem và không bao giờ dính, giúp đôi môi của bạn mềm mại, dẻo dai và dễ hôn; Hãy thử tất cả các màu thơm ngon của chúng tôi, từ Angel Food Cake đến Tiramisu
Sản phẩm môi cho đôi môi hoàn hảo: Tô điểm cho đôi môi của bạn một lớp kem hoàn hảo, lâu trôi; Hãy thử dòng sản phẩm trang điểm môi hoàn chỉnh của chúng tôi bao gồm son môi dạng lỏng, son bóng, son kem, chì kẻ môi và son bóng
Mỹ phẩm không độc ác: Chúng tôi tin rằng động vật thuộc về chúng tôi chứ không phải trong phòng thí nghiệm; Tất cả các sản phẩm trang điểm của chúng tôi đều được PETA chứng nhận và công nhận là thương hiệu không độc hại; Chúng tôi không thử nghiệm bất kỳ sản phẩm nào của mình trên động vật
Khám phá trang điểm chuyên nghiệp NYX: Hãy thử tất cả các sản phẩm trang điểm chuyên nghiệp của chúng tôi ngay hôm nay từ phấn mắt, bút kẻ mắt và mi giả cho đến son môi dạng lỏng, son bóng, kem lót, kem che khuyết điểm, xịt định hình và trang điểm lông mày", 'Thương hiệu NYX TRANG ĐIỂM CHUYÊN NGHIỆP
Màu 54 Đường Thủy Tinh
Loại da Tất cả
Dạng sản phẩm Chất lỏng
Loại hoàn thiện Bóng', '600'),
('24', 'Tree of Life Vitamin C Serum, Retinol Serum và Hyaluronic Acid Serum để làm sáng da', '9', '2', '24.jpg', '300000', "Bộ ba sức mạnh cho làn da đẹp nhất của bạn. Sử dụng Serum Vitamin C, sau đó là Hyaluronic Acid Serum vào buổi sáng để làm sáng rõ rệt, giảm vết thâm, làm mịn và cấp ẩm cho da. Dùng Retinol Serum, sau đó là Hyaluronic Acid Serum vào buổi tối để giảm sự xuất hiện của đường nhăn và nếp nhăn, làm mờ các đốm đồi mồi, hỗ trợ độ đàn hồi và làm dịu da.
Tất cả các sản phẩm của chúng tôi đều không gây độc hại, đã được bác sĩ da liễu thử nghiệm và được sản xuất cho mọi loại da và tông màu. Ngoài ra, chúng còn chứa các thành phần được lựa chọn kỹ lưỡng mà bạn có thể cảm thấy hài lòng.
Hướng dẫn: Thoa Vitamin C Serum vào buổi sáng, sau đó là Hyaluronic Acid Serum. Thoa Retinol Serum vào buổi tối, sau đó là Hyaluronic Acid Serum. Thoa 3-5 giọt lên vùng da khô, sạch trên mặt, cổ và ngực. Sử dụng kem chống nắng hàng ngày vì retinol làm tăng độ nhạy cảm với ánh nắng mặt trời. Để có kết quả tốt nhất, hãy dùng serum với kem dưỡng ẩm.
Sự rạng rỡ thực sự cho việc sử dụng. Tree of Life hướng đến việc chăm sóc da sạch sẽ, hiệu quả và có thể đạt được - và chúng tôi sẽ không cung cấp cho bạn bất cứ điều gì ít hơn.
Chất lượng cốt lõi. Chúng tôi chắc chắn rằng bạn sẽ yêu thích các sản phẩm của chúng tôi nên chúng tôi đưa ra chính sách đảm bảo hoàn tiền trong 30 ngày. Nếu bạn không hoàn toàn hài lòng, bạn có thể trả lại để được hoàn lại tiền đầy đủ.", 'Loại da Tất cả
Lợi ích sản phẩm
Sử dụng cho mặt
Hương trà xanh
Thương hiệu Tree of Life Beauty', '130'),
('25', 'Dầu gội và dầu xả làm dày tóc Love Beauty and Planet Volume và Bounty dành cho tóc dày và mịn Nước dừa', '9', '2', '25.jpg', '260000', 'CAM KẾT CHĂM SÓC TÓC CỦA CHÚNG TÔI: Bộ đôi Dầu gội và Dầu xả làm dày tóc Love Beauty and Planet Coconut Water & Mimosa Flower nhẹ nhàng làm sạch và gỡ rối tóc với công thức dịu nhẹ
DẦU GỘI VÀ DẦU XẢ TÓC CHO TÓC MỎNG: Dầu gội và dầu xả thuần chay của chúng tôi dành cho tóc được pha với Dầu dừa dành cho tóc và cung cấp độ phồng cho tóc mỏng và sợi mỏng
SẢN PHẨM LÀM TÓC TÓC LẤY CẢM HỨNG TỰ NHIÊN: Được pha với nước dừa hữu cơ, bộ đôi dầu gội và dầu xả thể tích này tiếp thêm sinh lực cho tóc với sự bùng nổ của Hoa Mimosa tinh tế
CÓ chăm sóc tóc an toàn cho màu sắc, CÓ dầu gội và dầu xả thuần chay, CÓ với chất tẩy rửa và chất khử rối có nguồn gốc từ thực vật, CÓ Dầu dừa dành cho tóc
CÔNG THỨC DẦU GỘI VÀ DẦU XẢ TÓC: Dầu gội và dầu xả không chứa paraben, Dầu gội và dầu xả không chứa silicone, Dầu gội và dầu xả không chứa chất độc hại
SẢN PHẨM LÀM TÓC: Dầu gội và dầu xả làm dày tóc này an toàn khi sử dụng cho mọi loại tóc, kể cả tóc đã qua xử lý màu.', 'Lợi ích sản phẩm Làm đầy, dưỡng ẩm, làm mềm, làm dày, làm sạch
Loại vật liệu Không chứa silicone, Không chứa Paraben
Hạng mục Tiểu đơn vị rời rạc
Thương hiệu Love Beauty And Planet
Kiểu tóc Đẹp', '160'),
('26', 'Dầu gội và dầu xả Love Beauty And Planet Hope and Repair Tóc khô và hư tổn Dầu dừa', '9', '9', '26.jpg', '299999', 'DẦU GỘI VÀ DẦU XẢ HY VỌNG CHĂM SÓC TÓC: Dầu dừa và Dầu gội Ylang Ylang của chúng tôi có tác dụng phục hồi tóc hư tổn để có mái tóc trông khỏe mạnh.
DẦU DẦU DỪA VÀ DẦU XẢ CHO TÓC KHÔ: hãy để tóc bạn đắm mình trong sự tươi mát buổi sớm của dầu hoa ngọc lan tây với những sản phẩm dành cho tóc hư tổn này
DẦU GỘI VÀ DẦU DẦU DỪA TỰ NHIÊN: Tất cả các sản phẩm tóc Love Beauty And Planet đều được bổ sung Dầu dừa Tự nhiên dành cho tóc
GIÚP NGĂN NGỪA CHẮC CHÁY VÀ CHÁY: Bộ đôi dầu gội và dầu xả phục hồi hư tổn này được bổ sung dầu dừa cho tóc, nuôi dưỡng đồng thời giúp ngăn ngừa tóc gãy và chẻ ngọn
CÓ chăm sóc tóc an toàn màu sắc, CÓ dầu gội và dầu xả thuần chay, CÓ với chất tẩy rửa/chất tẩy rửa có nguồn gốc từ thực vật, CÓ Dầu dừa cho tóc, CÓ công thức không chứa phthalates
Dầu gội và dầu xả không chứa Paraben, Dầu gội và dầu xả không chứa silicone, Dầu gội và dầu xả không chứa chất độc hại, Chăm sóc tóc hư tổn, Dầu gội phục hồi, Dầu xả phục hồi', 'Lợi ích sản phẩm Kiểm soát hư tổn, Bảo vệ màu sắc, Điều trị chẻ ngọn, Phục hồi, Nuôi dưỡng
Loại vật liệu Không chứa silicone, Không chứa Phthalate, Không chứa Paraben
Hạng mục Tiểu đơn vị rời rạc
Thương hiệu Love Beauty And Planet
Loại tóc Khô', '140'),
('27', 'Bộ quà tặng bom tắm LifeAround2Angels 12 loại Fizzies, Shea & Coco Butter sản xuất tại Mỹ Dưỡng ẩm cho da khô, hoàn hảo để tắm bong bóng & spa', '9', '5', '27.jpg', '210000', 'DẦU GỘI VÀ DẦU XẢ HY VỌNG CHĂM SÓC TÓC: Dầu dừa và Dầu gội Ylang Ylang của chúng tôi có tác dụng phục hồi tóc hư tổn để có mái tóc trông khỏe mạnh.
DẦU DẦU DỪA VÀ DẦU XẢ CHO TÓC KHÔ: hãy để tóc bạn đắm mình trong sự tươi mát buổi sớm của dầu hoa ngọc lan tây với những sản phẩm dành cho tóc hư tổn này
DẦU GỘI VÀ DẦU DẦU DỪA TỰ NHIÊN: Tất cả các sản phẩm tóc Love Beauty And Planet đều được bổ sung Dầu dừa Tự nhiên dành cho tóc
GIÚP NGĂN NGỪA CHẮC CHÁY VÀ CHÁY: Bộ đôi dầu gội và dầu xả phục hồi hư tổn này được bổ sung dầu dừa cho tóc, nuôi dưỡng đồng thời giúp ngăn ngừa tóc gãy và chẻ ngọn
CÓ chăm sóc tóc an toàn màu sắc, CÓ dầu gội và dầu xả thuần chay, CÓ với chất tẩy rửa/chất tẩy rửa có nguồn gốc từ thực vật, CÓ Dầu dừa cho tóc, CÓ công thức không chứa phthalates
Dầu gội và dầu xả không chứa Paraben, Dầu gội và dầu xả không chứa silicone, Dầu gội và dầu xả không chứa chất độc hại, Chăm sóc tóc hư tổn, Dầu gội phục hồi, Dầu xả phục hồi', 'Lợi ích sản phẩm Kiểm soát hư tổn, Bảo vệ màu sắc, Điều trị chẻ ngọn, Phục hồi, Nuôi dưỡng
Loại vật liệu Không chứa silicone, Không chứa Phthalate, Không chứa Paraben
Hạng mục Tiểu đơn vị rời rạc
Thương hiệu Love Beauty And Planet
Loại tóc Khô', '170'),
('28', 'Bộ 2 bảng phấn mắt UCANBE Twilight Dusk + Aromas', '9', '5', '28.jpg', '270000', "12 quả bom tắm thủ công độc đáo Chức năng và thư giãn. Những món quà tuyệt vời trong ngày của Mẹ.
Thực sự được sản xuất tại California, Hoa Kỳ với các nguyên liệu tự nhiên cao cấp của Hoa Kỳ - có màu sắc rực rỡ, sẽ không làm ố bồn tắm của bạn!
Bom tắm trị liệu và dưỡng ẩm, dành cho da thường/da khô
Được phát triển và tạo ra bởi chúng tôi, một công ty sản xuất bom tắm với niềm đam mê
Bom tắm được bọc riêng. Ý tưởng quà tặng hoàn hảo cho các bữa tiệc và đám cưới. Bộ quà tặng bom tắm này nằm trong danh sách mong muốn của nhiều người. Hoàn hảo để làm quà tặng Ngày của Cha, quà sinh nhật, quà tặng cho cô ấy, quà tặng spa/tắm, dành cho người đặc biệt, quà tặng hoàn hảo cho mẹ, vợ, bạn gái hoặc những người phụ nữ bạn yêu thương.", 'Thương hiệu Lifearound2angels
Mùi hương Lavender, Vani, Dâu, Dừa, Xoài, Hoa Hồng, Dưa
Độ tuổi (Mô tả) Người lớn
Công dụng khuyến nghị cho sản phẩm Dưỡng ẩm,Dưỡng ẩm,Thư giãn
Lợi ích sản phẩm Dưỡng ẩm, thư giãn', '130'),
('29', 'Son dưỡng môi có màu Honest Beauty | Chiết xuất Acai giàu chất chống oxy hóa + Dầu bơ', '9', '5', '29.jpg', '160000', 'Bảng màu Twilight Dust với 18 sắc thái: 10 màu lì mịn, các sắc thái có sắc tố cao với màu tím và màu đất son rực rỡ, cùng tông màu da cát mềm mại giúp kéo dài thời gian sử dụng. 7 phấn nhũ lấp lánh, ngọc trai ép với các màu mận, đồng và hồng tạo nên lớp nền lung linh, mượt mà, dễ dàng tạo lớp trên lớp phấn lì. 1 kim loại lấp lánh nguyên chất màu vàng cho vẻ ngoài đậm nét
Aromas Palette bao gồm 18 màu là loại bột có kết cấu mịn và mượt, bao gồm 10 màu lì có sắc tố cao, 4 màu phản chiếu, 2 màu lấp lánh, 1 màu ngọc trai ép và 1 màu nền che khuyết điểm.
Thành phần không chứa chất độc hại và công thức nhẹ, mang lại cảm giác thoa như kem bơ. Nó cũng có thể pha trộn và xây dựng được bất kể sử dụng làm màu chuyển tiếp hay màu trên cùng. Không thấm nước và lâu trôi giúp bạn có thể giữ lớp trang điểm mắt tuyệt đẹp suốt cả ngày và không bị nhòe
Cả hai bảng màu đều hoàn hảo cho các cô gái hàng ngày, các sự kiện hoặc dịp đặc biệt, v.v., tất cả các kiểu trang điểm. Chẳng hạn như trang điểm mắt khói chuyên nghiệp, trang điểm đám cưới, trang điểm dự tiệc hoặc trang điểm thường ngày, v.v.
Sản phẩm của chúng tôi đẹp và chất lượng cao nên chúng tôi chắc chắn bạn sẽ thích nó. Phấn mắt có thể bị hỏng trong quá trình vận chuyển, Nếu bạn nhận được hàng bị hỏng hoặc bạn không hài lòng với sản phẩm của chúng tôi. Chúng tôi sẽ cung cấp giải pháp cho bạn. Hài lòng với sản phẩm của chúng tôi. Chúng tôi sẽ cung cấp giải pháp cho bạn.', 'Màu sắc: Hoàng hôn/Hương thơm
Màu Chạng vạng/Hương thơm
Thương hiệu CHARMCODE
Sản phẩm dạng bột
Loại hoàn thiện Ánh sáng lung linh,Lấp lánh,Kim loại,Lấp lánh,Mờ,Nhung,Tự nhiên
Tính năng đặc biệt Lâu trôi, Không thấm nước, Có thể pha trộn, Mịn màng, Đa năng, Không độc hại, Sắc tố cao', '190'),
('30', 'Cọ Trang Điểm Bộ Cọ Trang Điểm - 16 Chiếc BESTOPE PRO Premium', '9', '10', '30.jpg', '250000', 'Hãy nhăn nhó lên các cô gái; Son dưỡng môi thuần chay giúp môi mịn màng và ẩm mượt cả ngày
Vuốt để có màu sắc tuyệt đẹp được nuôi dưỡng và khóa ẩm
Được làm bằng: Chiết xuất Acai giàu chất chống oxy hóa + Dầu bơ; Hoạt động cho mọi loại da
Được sản xuất không có: Petrolatum, Paraffin, Paraben, Nước hoa tổng hợp, Silicone, Dầu khoáng
Được chứng nhận EWG, Đã được bác sĩ da liễu kiểm nghiệm, Đã được bác sĩ kiểm nghiệm, Không độc hại, Thuần chay', 'Thương hiệu Vẻ đẹp trung thực
Sản phẩm dạng son dưỡng
Loại hoàn thiện Tự nhiên
Loại da Khô
Quả vải màu', '600');

INSERT INTO contact (fullname, email, website, subject, content) VALUES
('Nguyễn Văn A', 'nguyenvana@gmail.com', 'www.nguyenvana.com', 'Liên hệ', 'Xin chào, tôi có một số thắc mắc về dịch vụ của bạn.'),
('Trần Thị B', 'tranthib@gmail.com', 'www.tranthib.com', 'Phản hồi', 'Tôi muốn chia sẻ ý kiến về sản phẩm mới của bạn, rất ấn tượng!'),
('Hoàng Văn C', 'hoangvanc@gmail.com', 'www.hoangvanc.com', 'Hỗ trợ', 'Tôi đang gặp vấn đề với tài khoản của mình, bạn có thể giúp tôi không?'),
('Phạm Thị D', 'phamthid@gmail.com', 'www.phamthid.com', 'Liên hệ', 'Tôi quan tâm đến các dịch vụ bạn cung cấp, bạn có thể gửi thêm thông tin được không?'),
('Nguyễn Văn E', 'nguyenvane@gmail.com', 'www.nguyenvane.com', 'Hợp tác', 'Chúng ta có thể hợp tác trong một dự án mới không?'),
('Trần Văn F', 'tranvanf@gmail.com', 'www.tranvanf.com', 'Thắc mắc', 'Tôi cần biết thêm về chính sách đổi trả của bạn, có thể giải đáp giúp tôi không?'),
('Lê Thị G', 'lethig@gmail.com', 'www.lethig.com', 'Yêu cầu Báo giá', 'Tôi quan tâm đến sản phẩm A, bạn có thể gửi báo giá cho tôi được không?'),
('Phan Văn H', 'phanvanh@gmail.com', 'www.phanvanh.com', 'Hỗ trợ Kỹ thuật', 'Tôi đang gặp sự cố kỹ thuật, bạn có thể hỗ trợ giúp tôi không?'),
('Nguyễn Thị I', 'nguyenthii@gmail.com', 'www.nguyenthii.com', 'Liên hệ', 'Tôi muốn biết thêm về chương trình khách hàng thân thiết của bạn.'),
('Lý Văn K', 'lyvank@gmail.com', 'www.lyvank.com', 'Marketing', 'Tôi có ý tưởng về chiến lược tiếp thị, bạn có thể liên hệ để thảo luận không?');



INSERT INTO review (user_id, product_id, content, rating, post_date, status) VALUES
(1, 1, 'Sản phẩm rất tuyệt vời, tôi rất hài lòng!', '5', '2023-10-12 08:30:00', 1),
(2, 1, 'Chất lượng sản phẩm tốt, đáng giá tiền bạc.', '4', '2023-10-13 10:15:00', 0),
(3, 2, 'Giao hàng nhanh chóng và sản phẩm đúng mô tả.', '4.5', '2023-10-14 12:45:00', 1),
(4, 2, 'Thiết kế đẹp mắt, chất lượng ổn định.', '4', '2023-10-15 14:20:00', 1),
(5, 3, 'Tôi rất thích sản phẩm này, đặc biệt là tính năng mới.', '5', '2023-10-16 16:10:00', 0);
