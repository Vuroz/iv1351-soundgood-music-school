WITH ts_en AS (
    SELECT
        ts.id AS ts_id,
        DATE_PART('week', ts.start_time) AS time_week,
        LEFT(to_char(ts.start_time, 'Day'), 3) AS time_day,
        en.genre,
        en.max_students
    FROM time_slot AS ts
    INNER JOIN ensemble AS en
    ON ts.id = en.time_slot_id 
    WHERE TRIM(to_char(ts.start_time, 'YYYY')) = '2024'
),
sts_ts AS (
    SELECT
        ts_en.ts_id,
        COALESCE(COUNT(sts.time_slot_id), 0) AS students
    FROM ts_en
    LEFT JOIN student_time_slot AS sts
    ON sts.time_slot_id = ts_en.ts_id
    GROUP BY ts_en.ts_id
)
SELECT
    ts_en.time_day AS "Day",
    ts_en.genre AS "Genre",
    CASE
        WHEN (ts_en.max_students - sts_ts.students) = 0 THEN 'No Seats'
        WHEN (ts_en.max_students - sts_ts.students) < 3 THEN '1 or 2 Seats'
    ELSE
        'Many Seats'
    END AS "No of Free Seats"
FROM ts_en
INNER JOIN sts_ts
ON ts_en.ts_id = sts_ts.ts_id
WHERE ts_en.time_week = 12