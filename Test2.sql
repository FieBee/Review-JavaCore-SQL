create table Classes(
                        id int ,
                        name nvarchar(200),
                        primary key (id)
);

create table Student(
                        id int,
                        name nvarchar(200),
                        age int,
                        email varchar(250),
                        primary key (id)
);

create table Class_Student(
                              studentid int,
                              classesid int
);

create table marks(
                      mark int,
                      subjectid int,
                      studentid int,
                      foreign key (subjectid) references subject(id) ,
                      foreign key (studentid) references student(id)
);

create table subject(
                        id int ,
                        name nvarchar(250),
                        primary key (id)
);

ALTER TABLE Class_Student
    ADD FOREIGN KEY (studentid) REFERENCES student(id);
ALTER TABLE Class_Student
    ADD FOREIGN KEY (classesid) REFERENCES classes(id);


insert into student values (1,"Nguyen Quang An", 18, "an@yahoo.com");
insert into student values (2,"Nguyen Cong Vinh", 20, "vinh@gmail.com");
insert into student values (3,"Nguyen Van Quyen", 19, "quyen");
insert into student values (4,"Pham Thanh Binh", 25, "binh@com");
insert into student values (5,"Nguyen Van Tai Em", 30, "taiem@sport.vn");

insert into classes values (1, "C0706L");
insert into classes values (2, "C0708G");

insert into class_student values (1, 1);
insert into class_student values (2, 1);
insert into class_student values (3, 2);
insert into class_student values (4, 2);
insert into class_student values (5, 2);

insert into subject values (1, "SQL");
insert into subject values (2, "Java");
insert into subject values (3, "C");
insert into subject values (4, "Visual Basic");

insert into marks value (8,1,1);
insert into marks value (4,2,1);
insert into marks value (9,1,1);
insert into marks value (7,1,3);
insert into marks value (3,1,4);
insert into marks value (5,2,5);
insert into marks value (8,3,3);
insert into marks value (1,3,5);
insert into marks value (3,2,4);


select * from student;
select * from subject;
select * from marks;

select avg(m.mark) as "diem trung binh" from marks as m;

-- Học sinh có điểm cao nhất
select s.id, max(m.mark) as "diem cao nhat", s.name from marks as m
                                                             join student as s on m.studentid = s.id
group by s.id
having max(m.mark) >= all(select max(m.mark) from marks as m );

-- Môn học có hs đạt điểm cao nhất
select s.id, s.name, max(m.mark)  as "diem cao nhat", st.name from subject as s
                                                                       join marks as m on s.id = m.subjectid
                                                                       join student as st on m.studentid = st.id
group by s.id
having max(m.mark) >= All(select max(m.mark) from marks as m);

-- Điểm giảm dần
select m.mark, s.name from marks as m
                               join student as s on m.studentid = s.id
order by m.mark desc;

-- Đổi kiểu dữ liệu cột
alter table subject
    modify column name nvarchar(250);

-- Viet Check Constraint de kiem tra do tuoi nhap vao trong bang Student yeu cau Age >15 va Age < 50
alter table student
    modify age int not null check (age >15 and age <50);

-- Xóa khóa ngoại

-- Xóa bản ghi
delete from student where id = 1;

-- Thêm cột
alter table Student add status bit Default 1;

-- Xoa' cot
alter table student drop statuss;

-- update status
update student set status =0;
