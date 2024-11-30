SELECT 
    to_char(to_date(ts.start_time, 'YYYY Month'), 'Month') AS "Month",
    COALESCE(bo.individual, 0) + COALESCE(gl.group_lessons, 0) + COALESCE(en.ensembles, 0) AS "Total",
    COALESCE(bo.individual, 0) AS "Individual",
    COALESCE(gl.group_lessons, 0) AS "Group",
    COALESCE(en.ensembles, 0) AS "Ensemble"
FROM (
    SELECT DISTINCT to_char(times.start_time, 'YYYY Month') AS start_time
    FROM (
        SELECT start_time AS start_time FROM time_slot
        UNION ALL
        SELECT date_time AS start_time FROM booking
    ) AS times
) AS ts
LEFT JOIN (
    SELECT
        to_char(bo.date_time, 'YYYY Month') AS year_date,
        COUNT(*) AS individual
        FROM
            booking as bo
        GROUP BY
            year_date
) AS bo
ON ts.start_time = bo.year_date
LEFT JOIN (
    SELECT
        to_char(ts.start_time, 'YYYY Month') AS year_date,
        COUNT(*) AS group_lessons
    FROM 
        time_slot AS ts,
        group_lesson AS gl
    WHERE
        ts.id = gl.time_slot_id
    GROUP BY
        year_date
) AS gl
ON ts.start_time = gl.year_date
LEFT JOIN (
    SELECT
        to_char(ts.start_time, 'YYYY Month') AS year_date,
        COUNT(*) AS ensembles
    FROM 
        time_slot AS ts,
        ensemble AS en
    WHERE
        ts.id = en.time_slot_id
    GROUP BY
    year_date
) AS en
ON ts.start_time = en.year_date
WHERE ts.start_time LIKE '2023%'
ORDER BY to_date(ts.start_time, 'YYYY Month') ASC