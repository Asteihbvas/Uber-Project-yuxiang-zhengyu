WITH RECURSIVE hours AS (
    SELECT DATETIME('2012-10-22') as date
    UNION ALL
    SELECT DATETIME(date, '+1 hour')
    FROM hours
    WHERE date < DATETIME('2012-11-06 23:00:00')
),
full_trips AS (
    SELECT STRFTIME('%Y-%m-%d %H', pickup_datetime) date
    FROM yellow_taxi
    WHERE pickup_datetime between datetime('2012-10-22') and datetime('2012-11-07')
    UNION ALL
    SELECT STRFTIME('%Y-%m-%d %H', pickup_datetime) date
    FROM uber
    WHERE pickup_datetime between datetime('2012-10-22') and datetime('2012-11-07')
),
trip_stats AS (
    SELECT STRFTIME('%Y-%m-%d %H', hours.date) hour, COUNT(*) trip_cnt
    FROM hours
    LEFT JOIN full_trips a
    ON STRFTIME('%Y-%m-%d %H', hours.date) = a.date
    GROUP BY hour
)
SELECT a.hour, trip_cnt, hourly_precipitation, hourly_wind_speed
FROM trip_stats a
LEFT JOIN hourly_weather b
ON a.hour = STRFTIME('%Y-%m-%d %H', b.date)