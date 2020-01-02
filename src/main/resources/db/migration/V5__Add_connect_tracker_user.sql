create table users_trackers (
    user_id int8 not null,
    tracker_id int8 not null
);

alter table if exists users_trackers
    add constraint users_trackers_user_fk
     foreign key (user_id) references usr;

alter table if exists users_trackers
    add constraint users_trackers_tracker_fk
     foreign key (tracker_id) references tracker;