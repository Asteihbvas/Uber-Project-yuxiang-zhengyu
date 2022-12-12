SELECT STRFTIME('%H', pickup_datetime) hour, count(*) trip_cnt
FROM yellow_taxi
GROUP BY hour
ORDER BY trip_cnt DESC