create database if not exists testdb;
use testdb;
create external table if not exists employee_rises (
  eid int,
  date_of_rise date 
)
row format delimited
fields terminated by ','
lines terminated by '\n'
stored as textfile location 'hdfs://namenode:8020/user/hive/warehouse/testdb.db/employee_rises';