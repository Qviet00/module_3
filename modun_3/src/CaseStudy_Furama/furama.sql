drop database if exists furama_servlet;
create database furama_servlet;
use furama_servlet;
create table `position` (
id int primary key auto_increment,
`name` varchar(45)
);
create table education_degree(
id int primary key auto_increment,
`name` varchar(45)
);
create table division(
id int primary key auto_increment,
`name` varchar(45)
);
create table `role`(
role_id int primary key auto_increment,
role_name varchar(255)
);
create table `user`(
username varchar(255) primary key,
`password` varchar(255)
);
create table user_role(
role_id int,
foreign key(role_id) references `role`(role_id),
user_name varchar(255),
foreign key(user_name) references `user`(username)
);
create table employee(
id int primary key auto_increment,
`name` varchar(45) not null,
birthday date not null,
id_card varchar(45) not null,
salary double not null,
phone_number varchar(45) not null,
email varchar(45),
address varchar(45),
position_id int,
education_degree_id int,
division_id int,
username varchar(255),
foreign key(position_id) references `position` (id),
foreign key(education_degree_id) references education_degree (id),
foreign key(division_id) references division(id),
foreign key(username) references `user`(username)
);
create table customer_type(
id int primary key auto_increment,
`name` varchar(45)
);
create table customer(
id int primary key auto_increment,
`name` varchar(45) not null,
birthday date not null,
gender bit(1) null,
id_card varchar(45) not null,
phone_number varchar(45) not null,
email varchar(45),
address varchar(45),
customer_type_id int,
foreign key(customer_type_id) references customer_type(id)
);
create table facility_type(
id int primary key auto_increment,
`name` varchar(45)
);
create table rent_type(
id int primary key auto_increment,
`name` varchar(45)
);
create table facility(
id int primary key auto_increment,
`name` varchar(45) not null,
area int,
cost double not null,
max_people int,
standard_room varchar(45),
description_other_convenience varchar(45),
pool_area double,
number_of_floors int,
facility_free text,
rent_type_id int,
facility_type_id int,
foreign key(rent_type_id) references rent_type(id),
foreign key(facility_type_id) references facility_type(id)
);
create table contract(
id int primary key auto_increment,
start_date date not null,
end_date date not null,
deposit double not null,
employee_id int,
customer_id int,
facility_id int,
foreign key(employee_id) references employee(id),
foreign key(customer_id) references customer(id),
foreign key(facility_id) references facility(id)
);
create table attach_facility(
id int primary key auto_increment,
`name` varchar(45) not null,
cost double not null,
unit  varchar(45) not null,
`status` varchar(45)
);
create table contract_detail(
id int primary key auto_increment,
quanity int not null,
contract_id int,
attach_facility_id int,
foreign key(contract_id) references contract(id),
foreign key(attach_facility_id) references attach_facility(id)
);
insert into `position`(`name`)
values
("Lễ tân"),
("Phục vụ"),
("Chuyên viên"),
("Giám sát"),
("Quản lý"),
("Giám đốc");
insert into education_degree(`name`)
values
("Trung cấp"),
("Cao đẳng"),
("Đại học"),
("Sau đại học");
insert into division(`name`)
values
("Sale – Marketing"),
("Hành Chính"),
("Phục vụ"),
("Quản lý");
insert into employee(`name`, birthday, id_card, salary, phone_number, email,address, position_id, education_degree_id, division_id)
values
('Nguyễn Văn An', '1994-01-08','456231786','10000000','0901234121','annguyen@gmail.com','295 Nguyễn Tất Thành, Đà Nẵng',1,3,1),
('Lê Văn Bình', '1997-04-09','654231234','7000000','0934212314','binhlv@gmail.com','22 Yên Bái, Đà Nẵng',1,2,2),
('Hồ Thị Yến','1995-12-12','999231723','14000000','0412352315','thiyen@gmail.com','K234/11 Điện Biên Phủ, Gia Lai',1,3,2),
('Võ Công Toản','1980-04-04','123231365','17000000','0374443232','toan0404@gmail.com','77 Hoàng Diệu, Quảng Trị',1,4,4),
('Nguyễn Bỉnh Phát','1999-12-09','454363232','6000000','0902341231','phatphat@gmail.com','43 Yên Bái, Đà Nẵng',2,1,1),
('Khúc Nguyễn An Nghi','2000-11-08','964542311','7000000','0978653213','annghi20@gmail.com','294 Nguyễn Tất Thành, Đà Nẵng',2,2,3),
('Nguyễn Hữu Hà','1993-01-01','534323231','8000000','0941234553','nhh0101@gmail.com','4 Nguyễn Chí Thanh, Huế',2,3,2),
('Nguyễn Hà Đông','1989-09-03','234414123','9000000','0642123111','donghanguyen@gmail.com','111 Hùng Vương, Hà Nội',2,4,4),
('Tòng Hoang','1982-09-03','256781231','6000000','0245144444','hoangtong@gmail.com','213 Hàm Nghi, Đà Nẵng',2,4,4),
('Nguyễn Công Đạo','1994-01-08','755434343','8000000','0988767111','nguyencongdao12@gmail.com','6 Hoà Khánh, Đồng Nai',2,3,2);
insert into customer_type(`name`)
values
('Diamond'),
('Platinium'),
('Gold'),
('Silver'),
('Member');
insert into customer(`name`, birthday,gender,id_card, phone_number, email, address, customer_type_id)
values
('Nguyễn Thị Hào','1970-11-07',0,'643431213','0945423362','thihao07@gmail.com','23 Nguyễn Hoàng, Đà Nẵng',5),
('Phạm Xuân Diệu','1992-08-08',1,'865342123','0954333333','xuandieu92@gmail.com','K77/22 Thái Phiên, Quảng Trị',3),
('Trương Đình Nghệ','1990-02-27',1,'488645199','0373213122','nghenhan2702@gmail.com','K323/12 Ông Ích Khiêm, Vinh',1),
('Dương Văn Quan','1981-07-08',1,'543432111','0490039241','duongquan@gmail.com','K453/12 Lê Lợi, Đà Nẵng',1),
('Hoàng Trần Nhi Nhi','1995-12-09',0,'795453345','0312345678','nhinhi123@gmail.com','224 Lý Thái Tổ, Gia Lai',4),
('Tôn Nữ Mộc Châu','2005-12-06',0,'732434215','0988888844','tonnuchau@gmail.com','37 Yên Thế, Đà Nẵng',4),
('Nguyễn Mỹ Kim','1984-04-08',0,'856453123','0912345698','kimcuong84@gmail.com','K123/45 Lê Lợi, Hồ Chí Minh',1),
('Nguyễn Thị Hào','1999-04-08',1,'965656433','0763212345','haohao99@gmail.com','55 Nguyễn Văn Linh, Kon Tum',3),
('Trần Đại Danh','1994-07-01',1,'344343432','0987654321','danhhai99@gmail.com','24 Lý Thường Kiệt, Quảng Ngãi',1),
('Nguyễn Tâm Đắc','1989-07-01',1,'432341235','0643343433','dactam@gmail.com','22 Ngô Quyền, Đà Nẵng',2);
insert into facility_type(`name`)
values
("Villa"),
("House"),
("Room");
insert into rent_type(`name`)
values
("Năm"),
("Tháng"),
("Ngày"),
("Giờ");
insert into facility(`name`, area, cost, max_people, standard_room, description_other_convenience, pool_area, number_of_floors, facility_free, rent_type_id, facility_type_id)
values
('Villa Beach Front','25000','10000000',10,'vip','Có hồ bơi',500,4,null,3,1),
('House Princess 01','14000','5000000',7,'vip','Có thêm bếp nướng',null,3,null,2,2),
('Room Twin 01','5000','1000000',2,null,null,null,null,'1 Xe máy, 1 Xe đạp',4,3),
('Villa No Beach Front','22000','9000000',8,'normal','Có hồ bơi',300,3,null,3,1),
('House Princess 02','10000','4000000',5,'normal','Có thêm bếp nướng',null,2,null,3,2),
('Room Twin 02','3000','900000',2,null,null,null,null,'1 xe máy',4,3);
insert into contract(start_date, end_date, deposit, employee_id, customer_id, facility_id)
values
('2020-12-08','2020-12-08','0',3,1,3),
('2020-07-14','2020-07-21','200000',7,3,1),
('2021-03-15','2021-03-17','50000',3,4,2),
('2021-01-14','2021-01-18','100000',7,5,5),
('2021-07-14','2021-07-15','0',7,2,6),
('2021-06-01','2021-06-03','0',7,7,6),
('2021-09-02','2021-09-05','100000',7,4,4),
('2021-06-17','2021-06-18','150000',3,4,1),
('2020-11-19','2020-11-19','0',3,4,3),
('2021-04-12','2021-04-14','0',10,3,5),
('2021-04-25','2021-04-25','0',2,2,1),
('2021-05-25','2021-05-27','0',7,10,1);
insert into attach_facility(`name`,cost,unit,`status`)
values
('Karaoke','10000','giờ','tiện nghi, hiện tại'),
('Thuê xe máy','10000','chiếc','hỏng 1 xe'),
('Thuê xe đạp','20000','chiếc','tốt'),
('Buffet buổi sáng','15000','suất','đầy đủ đồ ăn, tráng miệng'),
('Buffet buổi trưa','90000','suất','đầy đủ đồ ăn, tráng miệng'),
('Buffet buổi tối','16000','suất','đầy đủ đồ ăn, tráng miệng');
insert into contract_detail(quanity, contract_id, attach_facility_id)
values
(5,2,4),
(8,2,5),
(15,2,6),
(1,3,1),
(11,3,2),
(1,1,3),
(2,1,2),
(2,12,2);

delimiter //
create procedure employee_delete(in p_id int)
begin
update employee
 set is_delete = 1
 where employee_id = p_id;
end//
delimiter ;

select * from employee;
