WITH date_iid AS (
    WITH gl_en AS (
        SELECT 
            tl.start_time AS date_time, 
            le.iid
        FROM time_slot AS tl
        INNER JOIN (
            SELECT gl.time_slot_id AS tsi, l.instructor_id AS iid 
            FROM group_lesson AS gl
            INNER JOIN lesson AS l ON l.id = gl.lesson_id
            UNION ALL
            SELECT en.time_slot_id AS tsi, en.instructor_id AS iid 
            FROM ensemble AS en
        ) AS le
        ON le.tsi = tl.id
    ),
    les AS (
        SELECT
            b.date_time,
            l.instructor_id AS iid
        FROM
            lesson AS l
        INNER JOIN booking AS B
        ON l.id = b.lesson_id
    )
    SELECT * FROM gl_en
    UNION ALL
    SELECT * FROM les
)
SELECT
    d_i.iid AS "Instructor Id",
    p.name AS "Name",
    COUNT(d_i.iid) AS "No of Lessons"
FROM date_iid AS d_i
INNER JOIN person AS p
ON d_i.iid = p.id
WHERE TRIM(to_char(d_i.date_time, 'YYYY Month')) = '2023 December'
GROUP BY d_i.iid, p.name