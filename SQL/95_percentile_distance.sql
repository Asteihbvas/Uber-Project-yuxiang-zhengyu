WITH tmp AS (
    SELECT straight_distance
    FROM yellow_taxi
    WHERE STRFTIME('%Y-%m', pickup_datetime) = '2013-07'
    UNION ALL
    SELECT straight_distance
    FROM uber
    WHERE STRFTIME('%Y-%m', pickup_datetime) = '2013-07'
)
SELECT straight_distance '95% percentile'
FROM tmp
ORDER BY straight_distance
LIMIT 1
OFFSET(
    SELECT CAST(COUNT(*)*0.95 AS INT)
    FROM tmp
)