CREATE ROLE administrator;
CREATE ROLE instructor;
CREATE ROLE student;
CREATE ROLE reviewer;
CREATE ROLE data_analyst;

GRANT INSERT, UPDATE, DELETE, SELECT ON dbo.exams TO administrator;
GRANT INSERT, UPDATE, DELETE, SELECT ON dbo.questions TO administrator;
GRANT INSERT, UPDATE, DELETE, SELECT ON dbo.lessons TO instructor;
GRANT SELECT, INSERT ON dbo.exams TO student;
GRANT SELECT ON dbo.lessons TO student;
GRANT INSERT, UPDATE, DELETE, SELECT ON dbo.questions TO reviewer;
GRANT SELECT ON dbo.vw_performance_students TO data_analyst;