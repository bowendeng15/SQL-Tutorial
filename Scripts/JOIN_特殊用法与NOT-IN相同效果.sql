# 查询：a表存在，b表不存在的数据

# 1. NOT IN
SELECT * FROM websites WHERE id NOT IN (SELECT site_id FROM access_log 
WHERE site_id is not null #例表特殊，需除去null
);

# 2. NOT EXISTS
SELECT * FROM websites WHERE NOT EXISTS(
SELECT 1 FROM access_log WHERE access_log.site_id=websites.id);

# 3. LEFT JOIN & WHERE is null
SELECT * FROM 
websites LEFT JOIN access_log ON access_log.site_id=websites.id
WHERE access_log.site_id is NULL;


# 增加列
-- ALTER TABLE apps ADD site_id INT;
# 删除列
-- ALTER TABLE apps DROP COLUMN site_id;


