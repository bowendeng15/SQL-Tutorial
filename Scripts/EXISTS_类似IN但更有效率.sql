-- in
-- 1.	in作用于结果集
-- 2.	不能作用于顺序结果,在虚拟表中,多个列
-- 3.	会对结果集每一个进行比较
-- 4.	在大结果集情况下,很慢
-- exist
-- 1 可以用于虚表中
-- 2 用于 相关查询
-- 3 匹配后才会进行比较
-- 4 相对来说会快一些,在大的结果集


# 找出2016-05-14有记录的网站名字

# IN
SELECT `name` FROM websites WHERE id IN
(SELECT site_id FROM access_log WHERE date='2016-05-14');


# EXISTS：EXISTS运算符用于指定子查询以测试行的存在。

# 		将外查询表的每一行，代入EXISTS内查询作为检验。
# 		如果内查询返回的结果取非空值，则EXISTS子句返回TRUE，这一行行可作为外查询的结果行。否则不能作为结果。
SELECT `name` FROM websites WHERE
EXISTS (SELECT 1 FROM access_log 
WHERE websites.id=access_log.site_id AND access_log.date='2016-05-14');

# NULL的处理
# 		这是因为EXISTS运算符仅检查子查询返回的行的存在。 行是否为NULL无关紧要。
# 		子查询返回NULL，但EXISTS运算符仍然计算为true
SELECT `name` FROM websites WHERE
EXISTS (SELECT NULL);


# 拓展：查询选修了全部课程的学生姓名
-- 学生表（学号，名字）student(sno,sname)
-- 选课表（学号，课程号）sc(sno,cno)
-- 课程表（课程号，课程名）course(cno,cname)
-- 注：不是每个学生都会选课
-- 
-- select sname
-- from student
-- where not exists
--    (select *
--      from course
--      where not exists
--          (select *
--           from sc
--           where sno=student.sno
--                 and cno=course.cno))
-- 解释：
-- 看这个子句:
-- (select *
--   from course
--   where not exists
--   (select *
--   from sc
--   where sno=student.sno
--   and cno=course.cno))
-- 查找任一课程,该课程未被主查询中的学生编号选上.
-- 回到最外层，如果只要有一个课程被检索到,那就存在了结果,主查询中的 not exists 就不满足条件,因此,此学生编号所对应的姓名不被查出.
-- 反之,只有当没有一个课程不被该学号学生选中时,not exists 就满足条件了,所以被主查询查出.
