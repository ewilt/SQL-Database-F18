USE school_management_sys;

SELECT students.uid, CONCAT(last_name, ', ', first_name) AS full_name, cumulative_gpa
FROM students JOIN general_directory ON students.uid = general_directory.uid
WHERE cumulative_gpa >
	(SELECT AVG(cumulative_gpa)
    FROM students)
ORDER BY full_name; 