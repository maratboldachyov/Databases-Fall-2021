create table students(
    full_name text PRIMARY KEY,
    age smallint NOT NULL,
    birth_date VARCHAR(14) NOT NULL,
    gender char(1) NOT NULL,
    avg_grd numeric(3,2) NOT NULL CHECK (avg_grd >= 0.00 and avg_grd <= 4.00),
    info_about_yourself text,
    dormitory boolean NOT NULL,
    add_info text
);
create table instructors(
    full_name text PRIMARY KEY,
    speaking_languages text NOT NULL,
    work_experience text,
    possibility_of_remote_lessons boolean NOT NULL
);
create table participants(
    lesson_title text NOT NULL,
    teaching_instructors text NOT NULL REFERENCES instructors(full_name),
    studying_students text NOT NULL REFERENCES students(full_name),
    room_number smallint NOT NULL UNIQUE
);