create database ACCESSORIES_MANUFACTURING_AND_SALES_SYSTEM;
use ACCESSORIES_MANUFACTURING_AND_SALES_SYSTEM;

create table products(
productID int not null,
productName int,
Quantity   int ,
price decimal(10,2)
);

create table customer (
customerID  varchar(20) not null,
customerName varchar(34) ,
customerAddress varchar(25)
);

create table Orders(
orderID int not null,
productID int,
customerID int,
Order_Quantity int ,
DateofOrder date,

);
alter table products
  drop constraint  uq_product_name
alter table products 
alter column  productName varchar(20)

alter table orders 
add  constraint pk_order primary key (orderID)
 

 alter table orders 
add foreign key (productID) references products(productID),
foreign key (customerID) references customer(customerID);

alter table orders 
alter column DateofOrder date not null
alter table products  
add constraint uq_product_name unique (productName),
 primary key (productID)

 alter table products
 add constraint ck_product_price check(price>0) 

 alter table customer 
 add constraint pk_cutomer primary key (customerID);

 alter table customer 
 alter column  customerName varchar(34)  not null;



 insert into products values (101, 'USB Cable', 150, 5.99);
 insert into products values (102, 'Power bank ', 75,19.99);
 insert into products values (103 , 'Headphones' , 200, 35.50);
 insert into products values (104,'Monitor Adapter ', 90 , 12.00);
 insert into products values (105 , 'keeybaord' , 150, 25.49);

 insert into customer values (1,' customer A' ,' Address 1');
 insert into customer values (2, ' customer B' ,' Address 2');
 insert into customer values (3,' customer C' ,' Address 3');
 insert into customer values (4,' customer D' ,' Address 4');
 insert into customer values (5,' customer E' ,' Address 5');


 insert into Orders values (1001,  101,1, 2, '2025-10-25');
 insert into orders values (1002,102,2, 4 , '2025-10-26');
 insert into orders values (1003,103 , 4,  3, '2025-10-27');
 insert into orders values (1004, 104,5,  5, '2025-10-28');
 insert into orders values (1005,  105 ,4, 1,'2025-10-29');

 select * from  Orders

 select P.productName ,
  count(O.orderID) as totalOders,
  sum(P.price) As totalPrice
  from products p join orders O on  O.productID = P.productID
   group by P.productName;

 -- select max() As higherprice,
        -- min(price) As lowerpirce;
		

 
 select  C.customerName,
         C.customerAddress,
		O.orderID,
		O.DateofOrder , 
	    P.Productname ,
	  O.Order_Quantity,
	  P.price ,(O.Order_Quantity * P.price) As totalprice  from customer C join orders O on C.customerID = O.customerID
	  join products P on O.productID = P.productID;



