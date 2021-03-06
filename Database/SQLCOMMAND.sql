create table Course (
  CourseID  int primary key ,
  CourseName nvarchar(150),
  GroupName nvarchar(150),
  
);

drop table Course


ALTER TABLE GroupMain
ADD FOREIGN KEY (CourseID) REFERENCES Course(CourseID);

ALTER TABLE GroupMain
ADD FOREIGN KEY (LectureId) REFERENCES Lecture(LectureId);

ALTER TABLE  StudentGroup
ADD FOREIGN KEY (StudentId) REFERENCES GroupMain(StudentId);

ALTER TABLE GroupMain
ADD FOREIGN KEY (SessionId) REFERENCES Session(SessionId);

drop table GroupMain

create table GroupMain(
GroupID int primary key,
 CourseID  int  ,
 GroupName nvarchar(150),
 LectureId int,
 CourseName nvarchar(150),
 SessionId int ,
 StudentId int
);



create table Lecture(
  LectureId int Primary key,
  LectureName nvarchar(150),
  LectureCode nvarchar(150),
);

create table Student(
  StudentId int Primary key,
  StudentName nvarchar(150),
  StudentCode nvarchar(150),
  GroupName nvarchar(150),
  Status nvarchar(150)
);

create table Session (
   SessionId int primary key,
   RoomId int,
   SlotId int 
);

drop table Session

ALTER TABLE Session
ADD FOREIGN KEY (SlotId) REFERENCES Slot(SlotId);

ALTER TABLE Session
ADD FOREIGN KEY (RoomId) REFERENCES Room(RoomId);

create table Slot(
  SlotId int primary key,
  SessionId int ,
  RoomId int 
);

create table Room(
 RoomId int primary key,
 RoomName nvarchar(150),
 SessionId int
);

create table Attndance(
 StudentId int primary key,
 StudentName nvarchar(150),
 SessionId int
);

ALTER TABLE Attndance
ADD FOREIGN KEY (SessionId) REFERENCES Session(SessionId);

ALTER TABLE Student
ADD FOREIGN KEY (StudentId) REFERENCES Attndance(StudentId);


create table StudentGroup(
StudentId int,
GroupId int ,
Constraint PK_StudentGroup PRIMARY KEY(StudentId,GroupId)
)

drop table StudentGroup

/*select cac thong tin cua 1 group co CourseID = > */
Select g.GroupID,g.GroupName,g.LectureId,c.CourseId,c.CourseName from [GroupMain] g join Course c On g.CourseId = c.CourseId
Where c.CourseId = ?


/* select tat cac cac sinh vien co groupID = ? */
Select s.StudentId,s.StudentName,s.StudentCode,
g.GroupId,g.GroupName,g.LectureId,g.CourseID 
from Student s join StudentGroup sg on s.StudentID = sg.StudentId
join [GroupMain] g on sg.GroupId = g.GroupId
Where g.GroupId = ?
