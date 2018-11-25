#mysql official image
FROM mysql:latest

#enviroment variable to change root password
ENV MYSQL_ROOT_PASSWORD=wjotek123  \
    MYSQL_DATABASE=Travel \
    MYSQL_USER=admin \
    MYSQL_PASSWORD=wjotek123


#copy sql file to directory with auto exec in thi image
COPY sql /docker-entrypoint-initdb.d/

#open docker ports
EXPOSE 3306 33060

#start mysql
CMD ["mysqld"]