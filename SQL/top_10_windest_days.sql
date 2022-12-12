WITH full_trips AS (
    SELECT STRFTIME('%m-%d', pickup_datetime) date
    FROM yellow_taxi
    WHERE STRFTIME('%Y', pickup_datetime) = '2014'
    UNION ALL
    SELECT STRFTIME('%m-%d', pickup_datetime) date
    FROM uber
    WHERE STRFTIME('%Y', pickup_datetime) = '2014'
)
SELECT a.date, b.daily_average_wind_speed, COUNT(*) trip_cnt
FROM full_trips a
JOIN daily_weather b
ON a.date = STRFTIME('%m-%d', b.date)
WHERE STRFTIME('%Y', b.date) = '2014'
GROUP BY a.date
ORDER BY b.daily_average_wind_speed DESC
LIMIT 10