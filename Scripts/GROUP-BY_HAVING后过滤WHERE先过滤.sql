# 1 GROUP BY 语句用于结合聚合函数，根据一个或多个列对结果集进行分组。
# 聚合列 用 聚合函数（例如：SUM，COUNT，MAX，AVG, etc.) !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

# 单表，多列
SELECT site_id, date, SUM(count), COUNT(count), AVG(count) FROM access_log
GROUP BY site_id, date; # 根据多列进行聚合 

# 多表，单列
SELECT a.site_id, w.`name`, SUM(a.count) AS 'nums' FROM 
(access_log AS a LEFT JOIN websites AS w ON a.site_id=w.id)
-- GROUP BY w.`name` # error
GROUP BY a.site_id
ORDER BY nums DESC;



# 2 HAVING, WHERE 的区别
#		1.	如果没有用group by, where 和 having 是等价的
#		2.	如果使用了group, 
#				where 在group by 之前过滤, having 对group by 之后数据进行过滤
#				HAVING 过滤的一定是 聚合函数的结果（例如：SUM，COUNT，MAX，AVG, etc.) !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

SELECT a.site_id, w.`name`, w.alexa, SUM(a.count) AS 'nums' FROM 
(access_log AS a LEFT JOIN websites AS w ON a.site_id=w.id)
WHERE w.alexa<300 #where 在group by 之前过滤
GROUP BY a.site_id 
HAVING SUM(a.count)>10 #having 对group by 之后数据进行过滤
ORDER BY nums DESC;


