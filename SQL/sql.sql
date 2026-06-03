/* 1. User Upcoming Events */
SELECT u.full_name, e.title, e.start_date
FROM Users u
JOIN Registrations r ON u.user_id = r.user_id
JOIN Events e ON r.event_id = e.event_id
WHERE e.status = 'upcoming'
ORDER BY e.start_date;

/* 2. Top Rated Events */
SELECT e.title, AVG(f.rating) AS avg_rating
FROM Events e
JOIN Feedback f ON e.event_id = f.event_id
GROUP BY e.event_id
ORDER BY avg_rating DESC;

/* 3. Inactive Users */
SELECT *
FROM Users
WHERE user_id NOT IN (
    SELECT user_id FROM Registrations
);

/* 4. Peak Session Hours */
SELECT event_id, COUNT(*) AS total_sessions
FROM Sessions
WHERE HOUR(start_time) BETWEEN 10 AND 12
GROUP BY event_id;

/* 5. Most Active Cities */
SELECT city, COUNT(*) AS registrations
FROM Users
GROUP BY city
ORDER BY registrations DESC
LIMIT 5;

/* 6. Event Resource Summary */
SELECT event_id, COUNT(*) AS total_resources
FROM Resources
GROUP BY event_id;

/* 7. Low Feedback Alerts */
SELECT u.full_name, e.title, f.comments
FROM Feedback f
JOIN Users u ON f.user_id = u.user_id
JOIN Events e ON f.event_id = e.event_id
WHERE f.rating < 3;

/* 8. Sessions per Upcoming Event */
SELECT e.title, COUNT(s.session_id) AS sessions
FROM Events e
LEFT JOIN Sessions s ON e.event_id = s.event_id
WHERE e.status = 'upcoming'
GROUP BY e.event_id;

/* 9. Organizer Event Summary */
SELECT organizer_id, status, COUNT(*) AS total_events
FROM Events
GROUP BY organizer_id, status;

/* 10. Feedback Gap */
SELECT e.title
FROM Events e
LEFT JOIN Feedback f ON e.event_id = f.event_id
WHERE f.feedback_id IS NULL;

/* 11. Daily New User Count */
SELECT registration_date, COUNT(*) AS users
FROM Users
GROUP BY registration_date;

/* 12. Event with Maximum Sessions */
SELECT event_id, COUNT(*) AS total_sessions
FROM Sessions
GROUP BY event_id
ORDER BY total_sessions DESC
LIMIT 1;

/* 13. Average Rating per City */
SELECT e.city, AVG(f.rating) AS avg_rating
FROM Events e
JOIN Feedback f ON e.event_id = f.event_id
GROUP BY e.city;

/* 14. Most Registered Events */
SELECT event_id, COUNT(*) AS registrations
FROM Registrations
GROUP BY event_id
ORDER BY registrations DESC
LIMIT 3;

/* 15. Event Session Time Conflict */
SELECT s1.event_id
FROM Sessions s1
JOIN Sessions s2
ON s1.event_id = s2.event_id
AND s1.session_id <> s2.session_id
AND s1.start_time < s2.end_time
AND s1.end_time > s2.start_time;

/* 16. Unregistered Active Users */
SELECT *
FROM Users
WHERE user_id NOT IN (
    SELECT user_id FROM Registrations
);

/* 17. Multi-Session Speakers */
SELECT speaker_name, COUNT(*) AS sessions
FROM Sessions
GROUP BY speaker_name
HAVING COUNT(*) > 1;

/* 18. Resource Availability Check */
SELECT e.title
FROM Events e
LEFT JOIN Resources r
ON e.event_id = r.event_id
WHERE r.resource_id IS NULL;

/* 19. Completed Events with Feedback Summary */
SELECT e.title,
COUNT(f.feedback_id) AS feedback_count,
AVG(f.rating) AS avg_rating
FROM Events e
LEFT JOIN Feedback f
ON e.event_id = f.event_id
WHERE e.status = 'completed'
GROUP BY e.event_id;

/* 20. User Engagement Index */
SELECT u.full_name,
COUNT(DISTINCT r.event_id) AS events_attended,
COUNT(DISTINCT f.feedback_id) AS feedbacks
FROM Users u
LEFT JOIN Registrations r
ON u.user_id = r.user_id
LEFT JOIN Feedback f
ON u.user_id = f.user_id
GROUP BY u.user_id;

/* 21. Top Feedback Providers */
SELECT u.full_name, COUNT(*) AS feedbacks
FROM Users u
JOIN Feedback f
ON u.user_id = f.user_id
GROUP BY u.user_id
ORDER BY feedbacks DESC
LIMIT 5;

/* 22. Duplicate Registrations Check */
SELECT user_id, event_id, COUNT(*) AS duplicate_count
FROM Registrations
GROUP BY user_id, event_id
HAVING COUNT(*) > 1;

/* 23. Registration Trends */
SELECT MONTH(registration_date) AS month,
COUNT(*) AS registrations
FROM Registrations
GROUP BY MONTH(registration_date);

/* 24. Average Session Duration per Event */
SELECT event_id,
AVG(TIMESTAMPDIFF(MINUTE, start_time, end_time)) AS avg_duration
FROM Sessions
GROUP BY event_id;