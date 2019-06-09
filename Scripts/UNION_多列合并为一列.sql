-- 第一问：union 和 union all 之间的区别
-- 1.	union 会去重排序,union all不会
-- 2.	union all 性能更加好

-- Union：合并列


# 下面的 SQL 语句从 "Websites" 和 "apps" 表中选取所有不同的country（只有不同的值）： 
SELECT country FROM Websites
UNION
SELECT country FROM apps;

# 下面的 SQL 语句使用 UNION ALL 从 "Websites" 和 "apps" 表中选取所有的country（也有重复的值）：
SELECT country FROM Websites
UNION ALL
SELECT country FROM apps
ORDER BY country;



# UNION 内部的 SELECT 语句必须拥有相同数量的列。列也必须拥有相似的数据类型。
# 缺少的列用NULL替代！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！

# 如何加条件查询？（例子：country='CN'）
# 错误方法（无效）
SELECT country, `name`, url, alexa FROM Websites
UNION
SELECT country, app_name, url, NULL FROM apps
WHERE country='CN'; # WHERE作用于最近的一个SELECT

# 方法一：
SELECT country, `name`, url, alexa FROM Websites
WHERE country='CN'
UNION
SELECT country, app_name, url, NULL FROM apps
WHERE country='CN';

#方法二：
SELECT * FROM(
SELECT country, `name`, url, alexa FROM Websites
UNION
SELECT country, app_name, url, NULL FROM apps
) AS temp_table # 1248 - Every derived table must have its own alias(别名)
WHERE country='CN';