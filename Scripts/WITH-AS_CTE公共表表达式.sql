-- CommonTableExpression
-- 公用表表达式是一个命名的临时结果集，仅在单个SQL语句(例如SELECT，INSERT，UPDATE或DELETE)的执行范围内存在。
-- 与派生表类似，CTE不作为对象存储，仅在查询执行期间持续。 
-- 与派生表不同，CTE可以是自引用(递归CTE)，也可以在同一查询中多次引用。 
-- 此外，与派生表相比，CTE提供了更好的可读性和性能。
WITH temp AS(
SELECT ac.*, w.name, w.url, ap.app_name, ap.url as app_url, w.country FROM 
(access_log ac 
LEFT JOIN websites w ON ac.site_id=w.id
LEFT JOIN apps ap ON w.id=ap.site_id)
)
-- SELECT * FROM temp;
SELECT country, COUNT(country) FROM temp
GROUP BY country;