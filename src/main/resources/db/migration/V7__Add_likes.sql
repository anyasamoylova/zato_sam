create table trackers_likes(
    user_id int8 not null references usr,
    tracker_id int8 not null references tracker,
    primary key(user_id,tracker_id)
)