create database  projectK;
 use projectK;
 create table publishers (
 publisher_id int primary key,
 publisher_name varchar(250) not null 
 );
  
  insert into publishers values(1432,'bhogaraju');
  insert into publishers values(1434,'sai');
  insert into publishers values(1436,'bharadwaj');
  
  select * from publishers;
   
   create table categories (
   category_id int primary key,
   category_name varchar(250) unique not null
   );
   
   insert into categories values(1532,'vaddemani');
   insert into categories values(1534,'srikanth');
   insert into categories values(1536,'reddy');
   
   select * from categories;
   
   create table users (
   user_id int primary key,
   user_name varchar(250) not null,
   email varchar(250) unique not null,
   phone_number bigint unique not null
   );
   
   insert into users values(1632,'sow','abc@123',9277497575);
   insert into users values(1634,'sri','xyz@123',9277497565);
   insert into users values(1636,'bho','dsp@123',9277497585);
   
   select * from users;
   
   create table books (
    book_id int primary key,
    title varchar(250) not null,
    ISBN  int unique not null,
    publication_year date not null,
    publisher_id int,
    category_id int,
    auther_name varchar(250) check(auther_name is not null),
    foreign key (publisher_id) references publishers(publisher_id) on delete cascade,
    foreign key (category_id) references categories(category_id) on delete cascade 
    );
    
    insert into books values(1732,'glassmet',69,'2001-08-12',1432,1532,'raju');
     insert into books values(1734,'classmet',70,'2002-08-12',1434,1534,'chinna');
      insert into books values(1736,'massmet',79,'2003-08-12',1436,1536,'ram');
    
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
   
    insert into Borrowings values(1832,1632,1732,'2001-08-12','2001-08-12');
    insert into Borrowings values(1834,1634,1732,'2001-08-12','2001-08-12');
    insert into Borrowings values(1836,1632,1736,'2001-08-12','2001-08-12');
  
  select * from Borrowings;
  select * from  books , categories , publishers , users , Borrowings  ;