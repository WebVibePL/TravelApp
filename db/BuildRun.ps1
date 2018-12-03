docker container rm $(docker container ls -a -q) -f
docker image rmi $(docker image ls -q) -f
docker build -t i_mysqltravel .
docker container run --name=c_mysqltravel -p 3306:3306 -v //d/GitRepositories/TravelApp/db/bindmount:/var/lib/mysql i_mysqltravel
