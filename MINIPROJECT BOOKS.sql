create database MINIPROJECTBOOKS1;
use MINIPROJECTbooks1;

 create table publishers (
 publisher_id int primary key,
 publisher_name varchar(230) not null 
 );
  
  insert into publishers values(10,'Drac Von Stoller');
  insert into publishers values(11,' Blackstone Audio lnc');
  insert into publishers values(12,' Blake pierce');
  
  select * from publishers;
   
   create table categories (
   category_id int primary key,
   category_name varchar(230) unique not null
   );
   
   insert into categories values(10, 'horror');
   insert into categories values(11, 'comedy');
   insert into categories values(12, 'triller');
   
  select * from categories;
  
   create table users (
   user_id int primary key,
   user_name varchar(230) not null,
   email varchar(230) unique not null,
   phone_number bigint unique not null
   );
   
   insert into users values(100,'bhogaraju','bho123@gmail.com',9111243576);
   insert into users values(101,'sai','sai456@gmail.com',9109876879);
   insert into users values(102,'bharathwaj','bharath789@gmail.com',9123409764);
   
select * from users;
   
   create table books (
    book_id int primary key,
    title varchar(230) not null,
    ISBN  bigint unique not null,
    publication_year date not null,
    publisher_id int,
    category_id int,
    auther_name varchar(230) check(auther_name is not null),
    foreign key (publisher_id) references publishers(publisher_id) on delete cascade,
    foreign key (category_id) references categories(category_id) on delete cascade 
    );
    
    insert into books values(1000,'house of horrors',9781430866346,'2024-06-10',10,10,'Droc Von Stoller ');
	insert into books values(1001,'The divine Comedy',978143089409,'2007-07-01',11,11,'Alighieri Dante ');
	insert into books values(1002,'Let Her Go',9781094327112,'2023-03-28',12,12,'Blake pierce');
    
    select * from books;
    
   create table Borrowings (
    Borrow_id int primary key,
    user_id int,
	book_id int,
    Borrow_date date not null,
    return_date date not null,
    foreign key(user_id) references users (user_id) on delete cascade,
    foreign key(book_id) references books (book_id) on delete cascade
   );

    insert into Borrowings values(2000,100,1000,'2024-12-14','2024-12-18');
    insert into Borrowings values(2001,101,1001,'2024-12-17','2024-12-19');
    insert into Borrowings values(2002,102,1002,'2024-12-23','2014-12-28');

    
    select * from borrowings;
	
select publisher_name,category_name,user_name,email,phone_number,title,ISBN, publication_year,  auther_name,Borrow_id, Borrow_date, return_date from books b
join publishers p on (b.publisher_id=p.publisher_id)
join categories c on (b.category_id=c.category_id)
join Borrowings  br on (b.book_id=br.book_id)
join users u on (br.user_id=u.user_id);