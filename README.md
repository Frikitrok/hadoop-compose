docker-compose up -d
docker-compose down
docker-compose stop
docker-compose start

docker exec -it namenode bash

alias h="hadoop fs"

h -mkdir -p /test/user
echo "test word" > file.txt
h -put file.txt /test/user/file.txt
h -ls /test/user/
h -cat /test/user/file.txt
h -rm /test/user/file.txt
h -ls /test/user/