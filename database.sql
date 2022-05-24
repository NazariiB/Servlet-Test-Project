drop database if exists db_test;
create database db_test;
use db_test;

create table users(
	id int auto_increment unique,
	first_name varchar(50),
    last_name varchar(50),
    username varchar(50),
    password varchar(50),
    address varchar(50),
    contact varchar(50),
    session_id varchar(100)
);

insert into users values(default, 'naz', 'naz', 'naz', 'naz', 'Lviv', '09876544321', '');

create table trains(
	first varchar(50),
    final varchar(50),
    free_seats int
);

insert into trains values('Charkiv','Lviv',30);
insert into trains values('Lviv','Charkiv',23);
insert into trains values('Ujgorod','Kyiv',34);
insert into trains values('Ujgorod','Kyiv',23);
insert into trains values('Lviv','Odessa',3);
insert into trains values('Charkiv','Kyiv',34);

drop table tickets;
create table tickets(
	user_id int,
    first varchar(50),
    final varchar(50)
);