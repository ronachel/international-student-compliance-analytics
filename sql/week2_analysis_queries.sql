-- Deposit Status Distribution
SELECT
    deposit_status,
    COUNT(*) AS total_students
FROM merged_data
GROUP BY deposit_status
ORDER BY total_students DESC;

-- I-20 Status Distribution
SELECT
    i20_status,
    COUNT(*) AS total_students
FROM merged_data
GROUP BY i20_status
ORDER BY total_students DESC;

-- Compliance Risk Cluster Analysis
SELECT
    deposit_status,
    i20_status,
    COUNT(*) AS student_count
FROM merged_data
GROUP BY deposit_status, i20_status
ORDER BY student_count DESC;

-- Assignment Workload Distribution
SELECT
    assigned,
    COUNT(*) AS assigned_students
FROM merged_data
GROUP BY assigned
ORDER BY assigned_students DESC;

-- University Distribution
SELECT
    university,
    COUNT(*) AS total_students
FROM merged_data
GROUP BY university
ORDER BY total_students DESC;

-- High Risk Students
SELECT
    COUNT(*) AS high_risk_students
FROM merged_data
WHERE deposit_status = 'No'
AND i20_status = 'No';