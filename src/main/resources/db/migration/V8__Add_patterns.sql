create table pattern(
    id int8 not null,
    img_filename varchar(255) not null,
    html_filename varchar(255) not null,
    name varchar(255) not null,
    description varchar(2048),
    primary key(id)
);