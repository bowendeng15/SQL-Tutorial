SELECT date, IFNULL(date, DATE_FORMAT(NOW(),'%Y-%m-%d')) 
FROM access_log;

SELECT date, IF(date, DATE_ADD(date, INTERVAL 1 DAY), DATE_FORMAT(NOW(),'%Y-%m-%d')) 
FROM access_log;

SELECT date, IF(date>'2016-05-14', 'after', 'before') 
FROM access_log;


#IFNULL()相当于Oracle的NVL()
#IF()相当于Oracle的NVL2()