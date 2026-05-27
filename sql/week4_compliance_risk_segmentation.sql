SELECT
    CASE
        WHEN compliance_risk_score >= 80 THEN 'High Risk'
        WHEN compliance_risk_score >= 40 THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS risk_level,
    COUNT(*) AS total_students
FROM (
    SELECT
        (
            CASE WHEN deposit_status = 'No' THEN 40 ELSE 0 END
            +
            CASE WHEN i20_status = 'No' THEN 40 ELSE 0 END
            +
            CASE WHEN assigned IS NULL THEN 20 ELSE 0 END
        ) AS compliance_risk_score
    FROM merged_data
) risk_scores
GROUP BY risk_level
ORDER BY total_students DESC;