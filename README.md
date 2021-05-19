docker pull infracloudio/csvserver:latest

docker run -d --name csvserver infracloudio/csvserver
#step 2
docker ps |grep csvserver

docker logs csvserver

#step 3 
vi gencsv.sh 
./gencsv.sh
#step4 
cat <<-EOF! >Dockerfile
   FROM infracloudio/csvserver
   COPY ./inputFile /csvserver/inputdata
 EOF
docker build -t csvserver . 
docker run -d --name csvserver csvserver:latest

#step 5 
docker exec -it csvserver bash 
netstat -tuplen|grep LISTEN
exit 
#or to check port we can use docker ps and find port 

docker ps |grep csvserver

docker stop csvserver
docker rm csvserver

#step 6 
docker run -d -p 9393:9300 --name test -e CSVSERVER_BORDER=Orange csserver:latest
curl localhost:9300

