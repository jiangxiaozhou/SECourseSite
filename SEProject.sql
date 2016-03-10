CREATE DATABASE jfinal;

USE jfinal;

create table user (
	username char(50),
    passwords char(50),
    rank int,
    email char(50),
    sno char(50)
);

insert into user values('teacher','teacher',3,'842764685@qq.com', 0);

create table files (
	filename char(100)
);

create table beinguser (
	username char(50),
    passwords char(50),
    rank int,
    email char(50),
    sno char(50)
);


create table notice (
	title char(50),
    time timestamp,
    content mediumtext,
    releaser char(20),
    id int
);

create table homework (
	title char(50),
    deadline timestamp,
    content mediumtext,
    releaser char(20),
    id int
);

create table homeworkRecord (
	id int,
    submittime timestamp,
    filename char(100),
    savedir mediumtext,
    homeworkid int,
    sno char(50)
);