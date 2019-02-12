create table TutorSubjectMapping(
	TutorID Integer Not Null ,
	SubjectCode VarChar(45) Not Null,
	Primary Key (TutorID,SubjectCode),
	CONSTRAINT TutorSubjectMapping_SubjectCode_fkey Foreign Key (SubjectCode)
	references Subject(SubjectCode) MATCH SIMPLE ON UPDATE 
	NO ACTION ON DELETE NO ACTION
	

);
create table TutorClassMapping(
	TutorID Integer Not Null ,
	ClassCode VarChar(45) Not Null,
	Primary Key (TutorID,ClassCode Code),
	CONSTRAINT TutorClassMapping_ClassCode_fkey Foreign Key (ClassCode)
	references Class(ClassCode) MATCH SIMPLE ON UPDATE 
	NO ACTION ON DELETE NO ACTION
	

);



create table tutor (
ID integer Primary key ,
	Constraint tutor_subjectID_fkey foreign Key (ID)
	References tutorsubjectmapping (TutorID) Match Simple on 
	Update No Action ON delete No action ,
	
	Constraint tutor_classID_fkey foreign Key (ID)
	References tutorclassmapping (TutorID) Match Simple on 
	Update No Action ON delete No action ,
	
	Constraint tutor_tutorID_fkey foreign Key (ID)
	References timingtutormapping (TutorID) Match Simple on 
	Update No Action ON delete No action ,
	
	Constraint tutor_profileID_fkey foreign Key (ID)
	References profile(ID) Match Simple on 
	Update No Action ON delete No action 
)
;

create table tutoring (
TutorID integer Unique not Null,
	TuteeID Integer  Not null ,
	Timingrequested TSRANGE Unique Not Null ,
	Primary key (TutorID,TuteeID),
	Constraint tutoring_tutorID_fkey foreign Key (TutorID)
	References tutor (ID) Match Simple on 
	Update No Action ON delete No action ,
	Constraint tutoring_TuteeID_fkey foreign Key (TuteeID)
	References profile (ID) Match Simple on 
	Update No Action ON delete No action ,
	Constraint tutoring_Timing_fkey foreign Key (Timingrequested)
	References timing (timing) Match Simple on 
	Update No Action ON delete No action 
	
	
);

Create table timing (
time tsrange Primary Key 


);
