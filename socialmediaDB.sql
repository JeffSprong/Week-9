create database if not exists socialmedia;

Use socialmedia;

Drop table if exists comments;
Drop table if exists posts;
Drop table if exists users;

create table users (
		id int(11) not null auto_increment,
		email_address varchar(25) not null,
		password varchar (20) not null,
		first_name varchar(20) not null,
		last_name varchar(20) not null,
		street varchar(25),
		city varchar(20),
		state char(2) not null,
		zip_code char (5),
		primary key (id)
);

create table posts (
		id int(11) not null auto_increment,
		user_id int(11) not null,
		time_created datetime default current_timestamp,
		post_data varchar(255) not null,
		primary key (id),
		foreign key (user_id) references users(id)
);

create table comments (
		id int(11) not null auto_increment,
		user_id int(11) not null,
		post_id int(11) not null,
		time_created datetime default current_timestamp,
		comment_data varchar(255) not null,
		primary key (id),
		foreign key (user_id) references users(id),
		foreign key (post_id) references posts(id)
);