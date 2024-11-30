SELECT
    f.siblings - 1 AS "No of Siblings",
    COUNT(*) * f.siblings AS "No of Students"
FROM (
    SELECT
        s.sibling_id AS s_id,
        COUNT(*) AS siblings
    FROM 
        student AS s
    GROUP BY
        s.sibling_id
) AS f
GROUP BY f.siblings
ORDER BY f.siblings ASC