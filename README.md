```
docker-compose up -d
docker-compose down
docker-compose stop
docker-compose start

docker exec -it namenode bash

alias h="hadoop fs"

h –help
h -mkdir -p /test/user
echo "test word" > file.txt
h -put file.txt /test/user/file.txt
h -ls /test/user/
h -cat /test/user/file.txt
h -rm /test/user/file.txt
h -ls /test/user/
```

lab 4
```
cat purchases.txt | python3 ./map.py | sort -t 1 | python3 ./reduce.py

docker exec -it nodemanager bash
apt update && apt install python3 -y
cd /tmp
curl -L -o purchases.txt.gz http://content.udacity-data.com/courses/ud617/purchases.txt.gz
gzip -d purchases.txt.gz
alias h="hadoop fs"
h -put purchases.txt /test/user/
h -ls /test/user/

docker cp map.py nodemanager:/root/map.py
docker cp reduce.py nodemanager:/root/reduce.py

cd /root
hadoop jar /opt/hadoop-3.2.1/share/hadoop/tools/lib/hadoop-streaming-3.2.1.jar -files map.py,reduce.py -mapper map.py -reducer reduce.py -input /test/user/purchases.txt -output /test/user/purchases.results

h -ls /test/user/purchases.results
h -cat /test/user/purchases.results/part-00000

h -rmr /test/user/purchases.results
```

lab 5
http://localhost:16010/
```
docker exec -it hbase bash
hbase shell

status
version

# Use the create command to create a new table. You must specify the table name and the ColumnFamily name.
create 'test', 'cf'
list 'test'
describe 'test'

# Populate data
put 'test', 'row1', 'cf:a', 'value1'
put 'test', 'row2', 'cf:b', 'value2'
put 'test', 'row3', 'cf:c', 'value3'
scan 'test'

# Drop row
delete 'test', 'row2', 'cf:b'
deleteall 'test', 'row1'

# Update data
put 'test', 'row2', 'cf:b', 'value5'

# Get data
scan 'test',  {TIMERANGE => [1668619944913, 1668619944914]}
get 'test', 'row2'

# Delete table
disable 'test'
enable 'test'
drop 'test'
```