-- Defining Professor Profile
Set serveroutput on;
Create or Replace Procedure Createprofileanduser
As
BEGIN

Execute Immediate 'Create profile PROFESSOR_P limit 
                    SESSIONS_PER_USER UNLIMITED
                    CPU_PER_SESSION UNLIMITED 
                    CONNECT_TIME 30 
                    FAILED_LOGIN_ATTEMPTS 5 
                    PASSWORD_LIFE_TIME 90';

-- Creating Professor User
Execute Immediate 'Create USER Professor1 
                    IDENTIFIED BY Dmddprojectteam2 
                    PROFILE PROFESSOR_P 
                    ACCOUNT UNLOCK';
Execute Immediate 'GRANT create session TO Professor1';
--Creating roles and granting priveledges to professor
Execute Immediate 'create role Prof_Read_Data';



Execute Immediate 'grant select on DEPARTMENT to Prof_Read_Data';
Execute Immediate 'grant select on ADDRESS to Prof_Read_Data';
Execute Immediate 'grant select on CITY to Prof_Read_Data';
Execute Immediate 'grant select on STATE to Prof_Read_Data';
Execute Immediate 'grant select on COUNTRY to Prof_Read_Data';
Execute Immediate 'grant select on PROGRAM to Prof_Read_Data';
Execute Immediate 'grant select on COURSE to Prof_Read_Data';
Execute Immediate 'grant select on CLASS to Prof_Read_Data';
Execute Immediate 'grant select on REGISTRATION to Prof_Read_Data';
Execute Immediate 'grant select on GRADE to Prof_Read_Data';
Execute Immediate 'grant select on PROFESSOR to Prof_Read_Data';
Execute Immediate 'grant select on STUDENT to Prof_Read_Data';
Execute Immediate 'grant select on PROFESSOR_SCHEDULE to Prof_Read_Data';



Execute Immediate 'create role Prof_DML_Operation';



Execute Immediate 'grant update,insert,delete on PROFESSOR_SCHEDULE to Prof_DML_Operation';
Execute Immediate 'grant update on PROFESSOR to Prof_DML_Operation';
Execute Immediate 'grant update on GRADE to Prof_DML_Operation';
Execute Immediate 'grant update on ADDRESS to Prof_DML_Operation';
Execute Immediate 'grant update on CITY to Prof_DML_Operation';
Execute Immediate 'grant update on STATE to Prof_DML_Operation';
Execute Immediate 'grant update on COUNTRY to Prof_DML_Operation';



Execute Immediate 'grant Prof_DML_Operation to Professor1';
Execute Immediate 'grant Prof_Read_Data to Professor1';



-- Defining Student Profile
Execute Immediate 'Create profile STUDENT_P limit
SESSIONS_PER_USER UNLIMITED
CPU_PER_SESSION UNLIMITED
CONNECT_TIME 30
FAILED_LOGIN_ATTEMPTS 5
PASSWORD_LIFE_TIME 90';

-- Creating Student User
Execute Immediate 'CREATE USER Student1
IDENTIFIED BY Dmddproject4
PROFILE STUDENT_P
ACCOUNT UNLOCK';



Execute Immediate 'GRANT create session TO Student1';
--- Creating roles and granting priveledges to professor
Execute Immediate 'create role Student_Read_Data';




Execute Immediate 'grant select on ADDRESS to Student_Read_Data';
Execute Immediate 'grant select on CITY to Student_Read_Data';
Execute Immediate 'grant select on STATE to Student_Read_Data';
Execute Immediate 'grant select on COUNTRY to Student_Read_Data';
Execute Immediate 'grant select on PROGRAM to Student_Read_Data';
Execute Immediate 'grant select on COURSE to Student_Read_Data';
Execute Immediate 'grant select on CLASS to Student_Read_Data';
Execute Immediate 'grant select on REGISTRATION to Student_Read_Data';
Execute Immediate 'grant select on GRADE to Student_Read_Data';
Execute Immediate 'grant select on STUDENT to Student_Read_Data';
Execute Immediate 'grant select on FEE to Student_Read_Data';



Execute Immediate 'create role Student_DML_Operation';




Execute Immediate 'grant update on STUDENT to Student_DML_Operation';
Execute Immediate 'grant update on REGISTRATION to Student_DML_Operation';
Execute Immediate 'grant update on ADDRESS to Prof_DML_Operation';
Execute Immediate 'grant update on CITY to Prof_DML_Operation';
Execute Immediate 'grant update on STATE to Prof_DML_Operation';
Execute Immediate 'grant update on COUNTRY to Prof_DML_Operation';



Execute Immediate 'grant Student_DML_Operation to Student1';
Execute Immediate 'grant Student_Read_Data to Student1';
DBMS_OUTPUT.PUT_LINE('Executed successfully');
commit;
Exception
When others then
DBMS_OUTPUT.PUT_LINE('Exception raised user not created');
end;
/

EXEC Createprofileanduser();

