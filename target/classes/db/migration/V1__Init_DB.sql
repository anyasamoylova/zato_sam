create sequence hibernate_sequence start 1 increment 1;

create table tracker(
    id int8 not null,
    filename varchar(255),
    price int4,
    tracker_name varchar(255) not null ,
    user_id int8,
    primary key (id)
);

create table user_role (
    user_id int8 not null,
     roles varchar(255)
);
create table usr (
    id int8 not null,
    active boolean not null,
    password varchar(255) not null,
    username varchar(255) not null,
    primary key (id)
);

alter table if exists tracker
    add constraint tracker_user_fk
     foreign key (user_id) references usr;

alter table if exists user_role
 add constraint user_role_user_fk
  foreign key (user_id) references usr;
