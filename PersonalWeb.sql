create table product(
ProductCode varchar(10) not null default'' primary key,
ProductName nvarchar(255)not null default'',
ProductDescription nvarchar(255) not null default'',
ProductImage varchar(100) not null default '',
ProductPrice decimal(9,2) not null default'0.00',
CategoryId varchar(10) not null default'',
foreign key (CategoryId) references category(CategoryId)

);
drop table product ;
insert into product values('P001','Tứ quý khổng tước','size:30x72x4cm.Nhà sản xuất:	DIE LIAN HUA','tuquykhongtuoc.jpg','2970000','CG005');
insert into product values('P002','Gối thuê con dê','size:45X113.Nhà sản xuất:LECAI','goithueconde.jpg','151000','CG006');
insert into product values('P003','Đồng hồ cá heo','size:45x45cm.Nhà sản xuất:	DIE LIAN HUA','donghocaheo.jpg','128000','CG007'),
('P004','Đồng hồ chữ phúc','size:76.Nhà sản xuất:	DIE LIAN HUA','donghochuphuc.jpg','128000','CG007'),
('P005','Tiền vô cửa nhà 1.5m*1m','size:150x100cm.Nhà sản xuất:	Monalisa','tienvocuanha.jpg','480000','CG001'),
('P006','Hoa ban hồng sắc xuân','size:202*109CM.Nhà sản xuất:	Monalisa','caycothu.jpg','1020000','CG001'),
('P007','Thôn quê thanh bình','70x45 cm.Nhà sản xuất:	DIE LIAN HUA','thonque.jpg','252000','CG001'),
('P008','Phú quý đại cát','size:39x88cm.Nhà sản xuất:	DIE LIAN HUA','phuquydaicat.jpg','190000','CG003'),
('P009','Mã đáo thành công','size:153x72cm.Nhà sản xuất:	Monalisa','madaothanhcong.jpg','680000','CG003'),
('P010','Bình hoa khoe sắc','size:51X59cm.Nhà sản xuất:	DIE LIAN HUA','hoa.jpg','120000','CG002');


select* from product;
drop table product;
create table User(UserId bigint(20) not null primary key, 
Email varchar(255) default null,
Password varchar(255) default null,
UserRole bit(1) default null);
create table line_item(LineItemId int not null auto_increment primary key,
ProductCode varchar(10) not null default '',
InvoiceId int not null default '0',
Quantity int not null default '0',
foreign key(InvoiceId) references Invoice(InvoiceId),
foreign key(ProductCode) references product(ProductCode));

drop table line_item;

create table Invoice(InvoiceId int not null auto_increment primary key,
UserId int not null ,
InvoiceDate datetime not null default'0000-00-00 00:00:00',
TotalAmount float not null default'0',
IsProcessed enum('y','n')default null,
foreign key(UserId)references User(UserId));

create table category(CategoryId varchar(10) not null primary key,
CategoryName nvarchar(50) not null default ''
);

drop table category;
insert into category values('CG001','Tranh phong cảnh'),('CG002','Tranh hoa'),('CG003','Tranh động vật'),('CG004','Động vật'),('CG005','Tranh tứ quý'),('CG006','Gối thêu');
insert into category values('CG007','Đồng hồ');
select* from category;


select * from line_item;
select* from user;
 insert into user values('1','admin','tphuongid524@gmail.com','admin','','','','','','','');