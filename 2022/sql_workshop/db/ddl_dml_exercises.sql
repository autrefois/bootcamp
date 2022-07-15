CREATE TABLE
    eds_sandbox.tbl_accounts
    (
        account_id INT,
        first_name VARCHAR(100),
        last_name VARCHAR(100),
        age INT,
        email VARCHAR(50),
        phone_number VARCHAR(50),
        CONSTRAINT acc_id PRIMARY KEY(account_id)
    ) ;

CREATE TABLE
    eds_sandbox.tbl_books
    (
        book_id INT PRIMARY KEY,
        author VARCHAR(100),
        title VARCHAR(50),
        genre_id INT,
        amount INT
    ) ;
    

CREATE TABLE
    eds_sandbox.tbl_book_rentals
    (
        account_id INT,
        book_id INT,
        date_rented DATE,
        date_returned DATE,
        details VARCHAR(200),
        CONSTRAINT books_fk FOREIGN KEY(account_id) REFERENCES  eds_sandbox.tbl_accounts(account_id)
      );

CREATE TABLE
    eds_sandbox.tbl_genres
    (
        genre_id INT PRIMARY KEY,
        name VARCHAR(100),
        description VARCHAR(200)
    ) ;

ALTER TABLE eds_sandbox.tbl_books add constraint genre_fk FOREIGN KEY(genre_id) references eds_sandbox.tbl_genres(genre_id);


select * from eds_sandbox.tbl_genres;
select * from eds_sandbox.tbl_books;
select * from eds_sandbox.tbl_book_rentals;
select * from eds_sandbox.tbl_accounts;

truncate table  eds_sandbox.tbl_genres;
truncate table  eds_sandbox.tbl_books;
truncate table  eds_sandbox.tbl_book_rentals;
truncate table  eds_sandbox.tbl_accounts;


--Genres Table
insert into eds_sandbox.tbl_genres values (10,'Adventure', 'Adventure books');
insert into eds_sandbox.tbl_genres values (11,'Sci-Fi', 'Science fiction books');
insert into eds_sandbox.tbl_genres values (12,'Tragedy', 'Tragedy books');
insert into eds_sandbox.tbl_genres values (13,'Classics', 'Classics books');
insert into eds_sandbox.tbl_genres values (14,'Romance', 'Romance books');
insert into eds_sandbox.tbl_genres values (15,'Humor', 'Humor books');
insert into eds_sandbox.tbl_genres values (16,'Crime', 'Crime books');
insert into eds_sandbox.tbl_genres values (17,'Mistery', 'Mistery books');


--Books Table
insert into eds_sandbox.tbl_books values (100,'Miguel de Cervantes','Don Quixote',10,2);
insert into eds_sandbox.tbl_books values (101,'Alexandre Dumas','The Three Musketeers',10,4);
insert into eds_sandbox.tbl_books values (102,'Robert Louis Stevenson','Treasure Island',10,6);

insert into eds_sandbox.tbl_books values (200,'H.G. Wells','The Time Machine',11,22);
insert into eds_sandbox.tbl_books values (201,'Mary Shelley','Frankenstein',11,14);
insert into eds_sandbox.tbl_books values (202,'Dan Simmons','Hyperion',11,3);
insert into eds_sandbox.tbl_books values (203,'Joe Haldeman','The Forever War',11,3);

insert into eds_sandbox.tbl_books values (300,'Aeschylus','The Oresteia',12,32);
insert into eds_sandbox.tbl_books values (301,'William Shakespeare','Hamlet',12,9);


insert into eds_sandbox.tbl_books values (400,'Louisa May Alcott','Little Women',13,5);

insert into eds_sandbox.tbl_books values (500,'Tayari Jones','An American Marriage',14,32);
insert into eds_sandbox.tbl_books values (501,'Amy Byler','The Overdue Life of Amy Byler',14,23);
insert into eds_sandbox.tbl_books values (502,'Julia Quinn','Bridgerton: The Duke & I',14,17);
insert into eds_sandbox.tbl_books values (503,'Sally Thorne','99 Percent Mine: A Novel',14,25);
insert into eds_sandbox.tbl_books values (504,'Talia Hibbert','Take a Hint, Dani Brown: A Novel',14,19);


insert into eds_sandbox.tbl_books values (600,'Abbi Waxman','The Bookish Life of Nina Hill',15,32);
insert into eds_sandbox.tbl_books values (601,'Richard Roper','How Not to Die Alone',15,14);
insert into eds_sandbox.tbl_books values (602,'Balli Kaur Jaswal','The Unlikely Adventures of the Shergill Sisters',15,31);


insert into eds_sandbox.tbl_books values (700,'Sarah Weinman','Scoundrel',16,21);
insert into eds_sandbox.tbl_books values (701,'Patrick Radden Keefe','Empire of Pain',16,31);
insert into eds_sandbox.tbl_books values (702,'Becky Cooper','We Keep the Dead Close',16,27);
insert into eds_sandbox.tbl_books values (703,'Casey Cep','Furious Hours',16,51);
insert into eds_sandbox.tbl_books values (704,'John Carreyrou','Bad Blood',16,29);
insert into eds_sandbox.tbl_books values (705,'Elon Green','Last Call',16,25);
insert into eds_sandbox.tbl_books values (706,'Rachel Monroe','Savage Appetites',16,16);


insert into eds_sandbox.tbl_books values (800,'James Patterson','I, Alex Cross',17,21);
insert into eds_sandbox.tbl_books values (801,'Anne Frank','The Diary of Anne Frank',17,5);


--Accounts table

insert into eds_sandbox.tbl_accounts values (1,'James','Scott',17,'james.scott@mail.com','0712345678');
insert into eds_sandbox.tbl_accounts values (2,'Kate','Smith',27,'kate.smith@mail.com','0712345654');
insert into eds_sandbox.tbl_accounts values (3,'Michael','Taylor',21,'michael.taylor@mail.com','0712345623');
insert into eds_sandbox.tbl_accounts values (4,'Lena','White',40,'lena.white@mail.com','0712345689');
insert into eds_sandbox.tbl_accounts values (5,'Kevin','Wood',34,'kevinwood@mail.com','0712345643');
insert into eds_sandbox.tbl_accounts values (6,'Tom','Byrne',60,'tom.byrne@mail.com','0712345624');
insert into eds_sandbox.tbl_accounts values (7,'Allen','Lee',55,'allen.lee@mail.com','0712345676');
insert into eds_sandbox.tbl_accounts values (8,'Lucy','Green',39,'lucy.green@mail.com','0712345612');
insert into eds_sandbox.tbl_accounts values (9,'Nick','Johnson',20,'nick.johnson@mail.com','0712345611');
insert into eds_sandbox.tbl_accounts values (10,'Nicole','Barr',24,'nicole.barr@mail.com','0712345623');
insert into eds_sandbox.tbl_accounts values (11,'Susan','Connor',43,'susan.connor@mail.com','0712345633');
insert into eds_sandbox.tbl_accounts values (12,'Roger','Kings',37,'roger.kings@mail.com','0712345650');
insert into eds_sandbox.tbl_accounts values (13,'Melvin','Stone',61,'melvin.stone@mail.com','0712345695');

insert into eds_sandbox.tbl_accounts values (14,'Casey','Cep',24,'casey.cep@mail.com','0754345695');
insert into eds_sandbox.tbl_accounts values (15,'James','Scott',18,'james.scott123@mail.com','0712345603');



--Book Rentals table
insert into eds_sandbox.tbl_book_rentals values (1,800,'2022-06-11','2022-06-16','return after 5 days');
insert into eds_sandbox.tbl_book_rentals values (1,701,'2022-06-11','2022-06-21','return after 10 days');

insert into eds_sandbox.tbl_book_rentals values (2,400,'2022-07-11',null,'return after 10 days');
insert into eds_sandbox.tbl_book_rentals values (2,500,'2022-07-01','2022-07-08','return after 7 days');
insert into eds_sandbox.tbl_book_rentals values (2,702,'2022-06-01','2022-06-06','return after 5 days');


insert into eds_sandbox.tbl_book_rentals values (3,504,'2022-06-15','2022-06-22','return after 7 days');
insert into eds_sandbox.tbl_book_rentals values (3,706,'2022-06-11','2022-06-30','return after 19 days');
insert into eds_sandbox.tbl_book_rentals values (3,301,'2022-06-05','2022-06-20','return after 15 days');
insert into eds_sandbox.tbl_book_rentals values (3,704,'2022-06-13',null,'return after 60 days');


insert into eds_sandbox.tbl_book_rentals values (4,800,'2022-07-02','2022-07-10','return after 8 days');


insert into eds_sandbox.tbl_book_rentals values (5,301,'2022-06-11',null,'return after 50 days');


insert into eds_sandbox.tbl_book_rentals values (6,201,'2022-07-11',null,'return after 15 days');
insert into eds_sandbox.tbl_book_rentals values (6,202,'2022-07-11',null,'return after 15 days');
insert into eds_sandbox.tbl_book_rentals values (6,203,'2022-07-01',null,'return after 10 days');
insert into eds_sandbox.tbl_book_rentals values (6,504,'2022-07-03','2022-07-10','return after 7 days');
insert into eds_sandbox.tbl_book_rentals values (6,602,'2022-07-03','2022-07-10','return after 7 days');


insert into eds_sandbox.tbl_book_rentals values (7,203,'2022-07-04','2022-07-10','return after 6 days');
insert into eds_sandbox.tbl_book_rentals values (7,400,'2022-07-01','2022-07-10','return after 9 days');


insert into eds_sandbox.tbl_book_rentals values (8,101,'2022-07-12',null,'return after 10 days');
insert into eds_sandbox.tbl_book_rentals values (8,102,'2022-07-12',null,'return after 10 days');
insert into eds_sandbox.tbl_book_rentals values (8,704,'2022-07-12',null,'return after 10 days');
insert into eds_sandbox.tbl_book_rentals values (8,502,'2022-07-12',null,'return after 10 days');
insert into eds_sandbox.tbl_book_rentals values (8,202,'2022-07-12',null,'return after 10 days');


insert into eds_sandbox.tbl_book_rentals values (9,101,'2022-06-20','2022-06-25','return after 5 days');
insert into eds_sandbox.tbl_book_rentals values (9,503,'2022-06-25','2022-06-30','return after 5 days');
insert into eds_sandbox.tbl_book_rentals values (9,702,'2022-06-30','2022-07-10','return after 10 days');

insert into eds_sandbox.tbl_book_rentals values (10,602,'2022-07-01',null,'return after 25 days');
insert into eds_sandbox.tbl_book_rentals values (10,200,'2022-07-05','2022-07-16','return after 11 days');

insert into eds_sandbox.tbl_book_rentals values (11,504,'2022-06-02','2022-06-10','return after 8 days');
insert into eds_sandbox.tbl_book_rentals values (11,600,'2022-06-02','2022-06-10','return after 8 days');
insert into eds_sandbox.tbl_book_rentals values (11,602,'2022-06-05','2022-06-20','return after 15 days');


insert into eds_sandbox.tbl_book_rentals values (12,100,'2022-07-11',null,'return after 15 days');

insert into eds_sandbox.tbl_book_rentals values (13,300,'2022-07-07','2022-07-10','return after 3 days');
insert into eds_sandbox.tbl_book_rentals values (13,601,'2022-07-05','2022-07-11','return after 6 days');
insert into eds_sandbox.tbl_book_rentals values (13,500,'2022-07-02','2022-07-12','return after 10 days');
insert into eds_sandbox.tbl_book_rentals values (13,101,'2022-07-03','2022-07-13','return after 10 days');


insert into eds_sandbox.tbl_book_rentals values (14,102,'2022-07-11',null,'return after 10 days');
insert into eds_sandbox.tbl_book_rentals values (14,301,'2022-07-11',null,'return after 15 days');

insert into eds_sandbox.tbl_book_rentals values (15,402,'2022-06-17','2022-06-24','return after 7 days');
insert into eds_sandbox.tbl_book_rentals values (15,501,'2022-06-20','2022-06-26','return after 6 days');
insert into eds_sandbox.tbl_book_rentals values (14,703,'2022-06-20','2022-06-26','return after 6 days');


insert into eds_sandbox.tbl_book_rentals values (16,500,'2022-06-07','2022-06-16','return after 9 days');
insert into eds_sandbox.tbl_book_rentals values (16,602,'2022-06-07','2022-06-16','return after 9 days');
insert into eds_sandbox.tbl_book_rentals values (16,301,'2022-06-09','2022-06-16','return after 7 days');
insert into eds_sandbox.tbl_book_rentals values (16,202,'2022-06-09','2022-06-16','return after 7 days');
insert into eds_sandbox.tbl_book_rentals values (16,401,'2022-06-10','2022-06-16','return after 6 days');
insert into eds_sandbox.tbl_book_rentals values (16,800,'2022-06-10','2022-06-16','return after 6 days');


insert into eds_sandbox.tbl_book_rentals values (17,103,'2022-06-23','2022-06-27','return after 4 days');
insert into eds_sandbox.tbl_book_rentals values (17,402,'2022-06-24','2022-06-28','return after 4 days');
insert into eds_sandbox.tbl_book_rentals values (17,706,'2022-06-25','2022-06-29','return after 4 days');






/*
1. Get the list with FULL NAMES and ages of the accounts ordered by age.
2. Get the number of rentals (per day) from the last 10 days in descending order (by the number of rental).
3. Create a query to display all the Romance authors (without duplicates) in ascending order.
4. Get the list of the emails, book_names, return_date for the accounts that rented a book yesterday, yesterday -1 . 
5. Get all the rentals for the book_ids and titles that were rented at least twice
6. Select all the accounts and all the rentals. (without acc id 16,17)
7. Get the total number of rentals for each genre. 
8. Find all the authors that also rented books from the same library.
9. Get the total number of accounts grouped by the first letter of their last name in alphabetical order.
10. Get the total number of characters, display the 4th  word and replace it with ‘Jane’ for the title = ‘The Diary of Anne Frank’
11. Find all the email addresses of the accounts that were registered multiple times (based on their full names)
12. A rare book is one for which the library has at most 3 copies (amount field). Please write the SQL that returns all the accounts (Name, Email, Phone Number) that have at least 2 rare books rented not returned.
*/