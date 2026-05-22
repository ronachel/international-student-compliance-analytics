-- Total Students
SELECT COUNT(reference_id) AS total_students
FROM merged_data;

-- Deposit Completed
SELECT COUNT(reference_id) AS deposit_completed
FROM merged_data
WHERE deposit_status = 'Yes';

-- I20 Approved
SELECT COUNT(reference_id) AS i20_approved
FROM merged_data
WHERE i20_status = 'Yes';

-- Unassigned Students
SELECT COUNT(reference_id) AS unassigned_students
FROM merged_data
WHERE assigned IS NULL;

-- Advisor Workloads
SELECT assigned, COUNT(reference_id) AS total_students
FROM merged_data
GROUP BY assigned
ORDER BY total_students DESC;

-- Deposit vs I20 Compliance
SELECT deposit_status,
       i20_status,
       COUNT(reference_id) AS total_students
FROM merged_data
GROUP BY deposit_status, i20_status
ORDER BY total_students DESC;