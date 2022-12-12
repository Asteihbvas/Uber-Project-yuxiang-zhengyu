WITH tmp AS (
    SELECT STRFTIME('%Y-%m-%d', pickup_datetime) date, straight_distance
    FROM yellow_taxi
    WHERE STRFTIME('%Y', pickup_datetime) = '2009'
    UNION ALL
    SELECT STRFTIME('%Y-%m-%d', pickup_datetime) date, straight_distance
    FROM uber
    WHERE STRFTIME('%Y', pickup_datetime) = '2009'
)
SELECT date, COUNT(*) trip_cnt, AVG(straight_distance) average_distance
FROM tmp
GROUP BY date
ORDER BY trip_cnt DESC
LIMIT 10