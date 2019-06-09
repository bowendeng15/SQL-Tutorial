# NULL既不属于筛选条件1 也不属于条件2
SELECT 'NA' AS 'condition', COUNT(*) AS 'result' FROM access_log
UNION ALL
SELECT "BETWEEN '2016-05-10' AND '2016-05-14'", COUNT(*) FROM access_log WHERE date BETWEEN '2016-05-10' AND '2016-05-14'
UNION ALL
SELECT "NOT BETWEEN '2016-05-10' AND '2016-05-14'", COUNT(*) FROM access_log WHERE date NOT BETWEEN '2016-05-10' AND '2016-05-14';

# NULL既不属于筛选条件1 也不属于条件2
SELECT 'NA' AS 'condition', COUNT(*) AS 'result' FROM access_log
UNION ALL
SELECT "site_id=3", COUNT(*) FROM access_log WHERE site_id=3
UNION ALL
SELECT "site_id<>3", COUNT(*) FROM access_log WHERE site_id<>3;


-- # COUNT(column_name) 函数返回指定列的值的数目（NULL 不计入）：
-- SELECT COUNT(date) FROM access_log;
-- 
-- # COUNT(*) 函数返回表中的记录数：
-- SELECT COUNT(*) FROM access_log;
-- 
-- # COUNT(DISTINCT column_name) 函数返回指定列的不同值的数目：
-- SELECT COUNT(DISTINCT date) FROM access_log;