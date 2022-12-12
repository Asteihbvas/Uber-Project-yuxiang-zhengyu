SELECT STRFTIME('%w', pickup_datetime) day_of_week, count(*) trip_cnt
FROM uber
GROUP BY day_of_week
ORDER BY trip_cnt DESC