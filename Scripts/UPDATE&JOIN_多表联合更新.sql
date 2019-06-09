# 健临时表
CREATE TABLE envelope(id int, user_id int, preview varchar(100));
CREATE TABLE docs(idnum int, pageseq int, doctext varchar(100));

INSERT INTO envelope(id, user_id) VALUES
  (1,1),
  (2,2),
  (3,3);

INSERT INTO docs(idnum,pageseq) VALUES
  (1,5),
  (2,6),
  (null,0);

# 开始！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！
UPDATE (docs INNER JOIN envelope ON envelope.id=docs.idnum) 
SET docs.doctext=CONCAT('example ', docs.pageseq), envelope.preview=CONCAT('title ', docs.pageseq);

SELECT * FROM envelope;
SELECT * FROM docs;
-- 结果
-- INNERJOIN连接表不包含第三行，没有处理，默认为NULL）

#SQLServer写法
-- UPDATE docs SET doctext=pageseq FROM docs INNER JOIN envelope ON envelope.id=docs.idnum
-- WHERE EXISTS (
--   SELECT 1 FROM docs
--   WHERE id=envelope.id
-- );


# 删除临时表!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
DROP TABLE envelope;
DROP TABLE docs;


