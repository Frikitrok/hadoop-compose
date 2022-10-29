docker-compose up -d
docker-compose down
docker-compose stop
docker-compose start

docker exec -it namenode bash
alias h="hadoop fs"

h -mkdir /test