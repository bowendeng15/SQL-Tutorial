-- 第二问：说明join不同join类型
-- 1.	内连接inner join (cross join /product join)
-- 2.	外连接outer join left right
-- 3.	注意左连接有后面的表有多条记录,左表也会显示多条记录

-- INNER JOIN：如果表中有至少一个匹配，则返回行
-- LEFT JOIN：即使右表中没有匹配，也从左表返回所有的行，右表无匹配的值以NULL替代
-- RIGHT JOIN：即使左表中没有匹配，也从右表返回所有的行，左表无匹配的值以NULL替代
-- FULL JOIN：只要其中一个表中存在匹配，则返回行（MySQL不支持）
-- CROSS JOIN：笛卡尔积。例子：表access_log行数12，表websites行数6 => CROSS JOIN行数72

-- SQL INNER JOIN 语法
-- SELECT column_name(s)
-- FROM table1
-- INNER JOIN table2
-- ON table1.column_name=table2.column_name
-- ORDER BY access_log.count DESC;

# INNER JOIN：左右表ON列值都不为NULL, 返回行
# 		即：去掉左右表ON列互不匹配的行
SELECT * FROM
-- SELECT websites.`name`, access_log.count, access_log.date FROM
(access_log INNER JOIN websites
ON access_log.site_id=websites.id)
-- ORDER BY access_log.count DESC
;

# LEFT JOIN：以左表ON列为准（值可以为NULL），无论右表有没有值匹配（无匹配，则NULL）
# 		即：至少返回左表所有行
SELECT * FROM
-- SELECT websites.`name`, access_log.count, access_log.date FROM
(access_log LEFT JOIN websites
ON access_log.site_id=websites.id)
-- ORDER BY access_log.count DESC
;

# RIGHT JOIN：以右表ON列为准（值可以为NULL），无论左表有没有值匹配（无匹配，则NULL）
# 		即：至少返回右表所有行
SELECT * FROM
-- SELECT websites.`name`, access_log.count, access_log.date FROM
(access_log RIGHT JOIN websites
ON access_log.site_id=websites.id)
-- ORDER BY access_log.count DESC
;

# 多次连接/多表连接
SELECT ac.*, w.name, w.url, ap.app_name, ap.url as app_url, w.country FROM 
(access_log ac 
LEFT JOIN websites w ON ac.site_id=w.id
LEFT JOIN apps ap ON w.id=ap.site_id);

# CROSS JOIN：笛卡尔积
# 		例子：表access_log行数12，表websites行数6 => CROSS JOIN行数72
#简写
SELECT * FROM websites, access_log; 
#正常写法
-- SELECT * FROM 
-- (websites CROSS JOIN access_log)