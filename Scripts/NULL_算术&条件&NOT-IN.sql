-- 原因很简单：由于NULL不能进行如何的“操作”

-- 1 如果null参与算术运算，则该算术表达式的值为null。（例如：+，-，*，/ 加减乘除）
SELECT COUNT(*)+NULL FROM access_log;

-- 2 如果null参与比较运算，则结果可视为false。（例如：>=,<=,<>  大于，小于，不等于）
SELECT * FROM access_log WHERE date>'1997-05-16';

-- 3 如果null参与聚集运算
select 'count(*)' 操作,count(*) 结果 from access_log #13
union all
select 'count(count)',count(count) from access_log #12
union all
select 'sum(count)',sum(count) from access_log #24976
union all
select 'avg(count)',avg(count) from access_log #2081.333 = sum(col)/count(col) = 24976/12
;

-- NOT IN：IN 操作符允许您在 WHERE 子句中规定多个值。
-- NOT IN：IN 操作符允许您在 WHERE 子句中规定多个值。
-- NOT IN：IN 操作符允许您在 WHERE 子句中规定多个值。
-- NOT IN：IN 操作符允许您在 WHERE 子句中规定多个值。

-- 4 如果在not in子查询中有null值的时候,则不会返回数据。  （最简单的解释请参考下面的评论说明）     
#没有在表access_log内记录的website
SELECT * FROM websites WHERE id NOT IN (SELECT site_id FROM access_log);
