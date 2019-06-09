# 找到第5大的count（去重DISTINCT）

SELECT DISTINCT count FROM access_log
ORDER BY count DESC
LIMIT 4, 1;

-- select * from Customer LIMIT 10;--检索前10行数据，显示1-10条数据
-- select * from Customer LIMIT 1,10;--检索从第2行开始，累加10条id记录，共显示id为2....11
-- select * from Customer LIMIT 5,10;--检索从第6行开始向前加10条数据，共显示id为6,7....15
-- 
-- 其他数据库语法
-- SQLServer：TOP
-- MySQL：LIMIT
-- Oracle：ROWNUM