-- Criando views estratégicas para o dashboard
CREATE VIEW vw_average_scores_per_student AS
SELECT s.name, AVG(eh.score) AS average_score
FROM students s
JOIN exams_history eh ON s.id = eh.student_id
GROUP BY s.name;
GO;

CREATE VIEW vw_exams_count_per_student AS
SELECT s.name, COUNT(e.id) AS total_exams
FROM students s
JOIN exams e ON s.id = e.student_id
GROUP BY s.name;
GO;

CREATE VIEW vw_overall_exam_performance AS
SELECT AVG(score) AS avg_score, MIN(score) AS min_score, MAX(score) AS max_score
FROM exams_history;
GO;

CREATE VIEW vw_most_watched_lessons AS
SELECT l.title, COUNT(sl.id) AS total_views
FROM lessons l
JOIN students_lessons sl ON l.id = sl.lesson_id
GROUP BY l.title;
GO;

CREATE VIEW vw_questions_reviewed_per_reviewer AS
SELECT r.name, COUNT(q.id) AS total_questions_reviewed
FROM reviewers r
JOIN questions q ON r.id = q.id
GROUP BY r.name;
GO;