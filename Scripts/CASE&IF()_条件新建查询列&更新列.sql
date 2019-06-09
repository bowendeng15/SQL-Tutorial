-- 知识点1：
-- 		NULL判断（SELECT WHERE）需用is
-- 				例子：SELECT * FROM access_log WHERE date is NULL;
-- 		NULL赋值（UPDATE SET）需用=
-- 				例子：UPDATE access_log SET date=NULL WHERE aid=2;
-- 
-- 知识点2：CASE WHEN 的两种写法
-- 
-- 知识点3：CASE 与 IF
-- 		IF()不像CASE那样可以多条件判断，IF()只能判断“真”、“假”
-- 		IF()是个函数


# 正确写法！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！
SELECT *, CASE 
	WHEN date is NULL THEN
		'Yes'
	ELSE
		'No'
END
AS 'MISSING'
FROM access_log;

# 只有两种情况时：可用IF()
SELECT *, IF(date, 'No', 'Yes') AS 'MISSING'
FROM access_log;

# 错误写法！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！
SELECT *, (CASE date
	WHEN NULL THEN
		'Yes'
	ELSE
		'No'
END)'MISSING'
FROM access_log;

-- case sex
--   when '1' then '男'
--   when '2' then '女’
--   else '其他' end
-- 
-- case when sex = '1' then '男'
--      when sex = '2' then '女'
--      else '其他' end  

# 更新：条件为其他列
UPDATE apps SET site_id=(CASE id
	WHEN 1 THEN 7
	WHEN 2 THEN 4
	WHEN 3 THEN 2
	ELSE id 
END);
SELECT * FROM apps; # 展示结果

# 更新：条件为本身列
UPDATE websites SET alexa=CASE alexa
	WHEN 1 THEN alexa+1
	WHEN 2 THEN alexa-1
	WHEN 3 Then alexa+3
	WHEN 6 THEN alexa-3
	ELSE alexa
END;
SELECT * FROM websites; # 展示结果

# 错误写法
# 1048 - Column 'alexa' cannot be null：因为设计表时alexa不能为null
UPDATE websites SET alexa=CASE alexa
	WHEN 1 THEN alexa+1
	WHEN 2 THEN alexa-1
	WHEN 3 Then alexa+3
	WHEN 6 THEN alexa-3
	# 省略ELSE <=> 不处理 <=> ELSE null
END;
SELECT * FROM websites; # 展示结果

