CREATE TABLE district_incident_counts AS
SELECT "Council District", COUNT(*) AS incident_count
FROM crime_reports
GROUP BY "Council District";


CREATE TABLE clearance_rates AS
SELECT "Highest Offense Description",
       COUNT(*) AS total_incidents,
       SUM(CASE WHEN "Clearance Status" = 'C' THEN 1 ELSE 0 END) AS cleared_incidents,
       (SUM(CASE WHEN "Clearance Status" = 'C' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS clearance_rate
FROM crime_reports
GROUP BY "Highest Offense Description";

SELECT * FROM crime_reports LIMIT 5;
