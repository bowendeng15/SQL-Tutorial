# 1. 奇数偶数
SELECT * FROM access_log WHERE aid%2=0;

# 2. 多行连接成一个字符串（SQl Server版本: for xml path）
SELECT GROUP_CONCAT(DISTINCT name SEPARATOR ';' ) FROM websites;

# 3. IN 的特殊用法
# 	'a' IN ('a', 'b', 'c')
# 	'a' IN (col1, col2, col3)
SELECT * FROM apps WHERE  "QQ APP" IN (app_name, url);
#	LIKE与%通配符
#		"N%"：以N开头
#		"%N"：以N结尾
#		"%N%"：包含N
SELECT * FROM apps WHERE app_name LIKE "%QQ%";

# 4. 常量的特殊用法
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

# 5. 如何区分 字符、数字
# 		思路：数字大小写一致（UPPER()/UCASE();LOWER()/LCASE()）
# CAST(xx as TYPE) 这里MySQL大小写不敏感，BINARY二进制对大小写有区分
SELECT UPPER('tom'), LOWER('tom'), 
IF(CAST(UPPER('tom') as BINARY)=CAST(LOWER('tom') as BINARY), 'equal', 'not equal')
UNION ALL
SELECT UPPER(3), LOWER(3), 
IF(CAST(UPPER(3) as BINARY)=CAST(LOWER(3) as BINARY), 'equal', 'not equal');

# 6. 计算大于100的总和 与 小于等于100的总和
# 方法一
SELECT SUM(count) FROM access_log WHERE count>100
UNION ALL
SELECT SUM(count) FROM access_log WHERE NOT count>100;
# 方法二
SELECT SUM(CASE
	WHEN count>100 THEN count
	ELSE 0
END
),
SUM(CASE
	WHEN NOT count>100 THEN count
	ELSE 0
END) FROM access_log;

# 7. 筛选某一列/某几列重复的记录
# 	一列
SELECT site_id, count(site_id) num FROM access_log
GROUP BY site_id
HAVING count(site_id)>1;
# 	两列
SELECT site_id, date, count(site_id) FROM access_log
GROUP BY site_id, date
HAVING count(site_id)>1;

# 8. 把378.89拆成378和89（数字拆分TRUNCATE()；取整ROUND()）
SELECT net_value, TRUNCATE(net_value, 0),
ROUND(net_value-TRUNCATE(net_value, 0), 2)*100 FROM websites;
