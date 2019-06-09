# 奇数偶数
SELECT * FROM access_log WHERE aid%2=0;

# 多行连接成一个字符串（SQl Server版本: for xml path）
SELECT GROUP_CONCAT(DISTINCT name SEPARATOR ';' ) FROM websites;

# 'a' IN ('a', 'b', 'c')
# 'a' IN (col1, col2, col3)
SELECT * FROM apps WHERE  "QQ APP" IN (app_name, url);
SELECT * FROM apps WHERE app_name LIKE "%QQ%";

# 这里的n：相当于rownum * n
SELECT SUM(1) FROM apps;
SELECT SUM(3) FROM apps;

# 这里的n：SELECT列中的第n列
SELECT * 
FROM access_log ORDER BY 2;

SELECT site_id, count 
FROM access_log ORDER BY 2;
-- # 会报错
-- SELECT count
-- FROM access_log ORDER BY 2

# 如何区分 字符、数字
# 		思路：数字大小写一致
-- UPPER(col) = LOWER(col)

-- ALTER TABLE websites ADD net_value FLOAT;
# TRUNCATE(), ROUND(), SUBSTR(), CAST()
SELECT net_value, TRUNCATE(net_value, 0), 
ROUND(net_value-TRUNCATE(net_value, 0),2)*100
FROM websites;

SELECT net_value, TRUNCATE(net_value, 0) billion, 
SUBSTR(net_value-TRUNCATE(net_value, 0), 3, 3) million_str,
CAST(SUBSTR(net_value-TRUNCATE(net_value, 0), 3, 2) as SIGNED) million_int
FROM websites;