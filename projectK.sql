create database  projectBooks;
 use projectBooks;
 create table publishers (
 publisher_id int primary key,
 publisher_name varchar(250) not null 
 );
  
  insert into publishers values(1432,'Drac Von Stoller');
  insert into publishers values(1434,'Blackstone Audio lnc');
  insert into publishers values(1436,'Blake pierce');
  
  select * from publishers;
   
   create table categories (
   category_id int primary key,
   category_name varchar(250) unique not null
   );
   
   insert into categories values(1532,'horror');
   insert into categories values(1534,'comedy');
   insert into categories values(1536,'triller');
   
   select * from categories;
   
   create table users (
   user_id int primary key,
   user_name varchar(250) not null,
   email varchar(250) unique not null,
   phone_number bigint unique not null
   );
   
   insert into users values(1632,'siri','siri@gmail.com',9277497575);
   insert into users values(1634,'sri','sri@gmail.com',9277497565);
   insert into users values(1636,'sai','sai@gmail.com',9277497585);
   
   select * from users;
   
   create table books (
    book_id int primary key,
    title varchar(250) not null,
    ISBN  bigint unique not null,
    publication_year date not null,
    publisher_id int,
    category_id int,
    auther_name varchar(250) check(auther_name is not null),
    foreign key (publisher_id) references publishers(publisher_id) on delete cascade,
    foreign key (category_id) references categories(category_id) on delete cascade 
    );
    
    insert into books values(1732,'house of horrors',9781430866346,'2024-06-10',1432,1532,'Droc Von Stoller');
	insert into books values(1734,'The divine Comedy',978143089409,'2007-07-01',1434,1534,'Dante Alighieri');
	insert into books values(1736,'Let Her Go',9781094327112,'2023-03-28',1436,1536,'Blake pierce');
    
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
   
    insert into Borrowings values(1832,1632,1732,'2024-08-12','2024-08-17');
    insert into Borrowings values(1834,1634,1732,'2024-07-13','2024-07-18');
    insert into Borrowings values(1836,1632,1736,'2024-09-12','2024-09-19');
  
  select * from Borrowings;
  
  select publisher_name, category_name, user_name,email,phone_number,title,ISBN,publication_year,auther_name,borrow_id,borrow_date,return_date 
  from books b join publishers p on(b.publisher_id=p.publisher_id)join categories c on(b.category_id=c.category_id)
  join Borrowings br on(b.book_id=br.book_id)join users u on(br.user_id=u.user_id);