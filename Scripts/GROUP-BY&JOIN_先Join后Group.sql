# 先GroupBy后Join
# BAD -- 2 SELECT
SELECT g.site_id, w.name, g.avg FROM 
(SELECT a.site_id, AVG(a.count) avg
FROM access_log a
GROUP BY a.site_id) g
INNER JOIN websites w ON g.site_id=w.id
ORDER BY g.avg DESC;

# 先Join后GroupBy
# GOOD -- 1 SELECT
SELECT a.site_id, w.name, AVG(a.count) avg FROM
access_log a INNER JOIN websites w ON a.site_id=w.id
GROUP BY a.site_id
ORDER BY AVG(a.count) DESC;