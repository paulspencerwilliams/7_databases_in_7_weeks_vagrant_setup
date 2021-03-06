apt-get update
apt-get -y install build-essential
apt-get -y install tcl8.5
wget http://redis.googlecode.com/files/redis-2.6.0-rc3.tar.gz
tar xzf redis-2.6.0-rc3.tar.gz
cd redis-2.6.0-rc3
make
make install
make test
mkdir /etc/redis
mv redis.conf /etc/redis/redis.conf
sed -i.bak 's/127.0.0.1/0.0.0.0/g' /etc/redis/redis.conf
sed -i.bak 's/daemonize no/daemonize yes/g' /etc/redis/redis.conf
sed -i.bak 's/dir .\//dir \/var\/lib\/redis/g' /etc/redis/redis.conf

cd src/
wget https://raw.github.com/gist/1053791/880a4a046e06028e160055406d02bdc7c57f3615/redis-server
mv redis-server.1 /etc/init.d/redis-server
mv redis-cli /etc/init.d/redis-cli
chmod +x /etc/init.d/redis-server
sed -i.bak 's/DAEMON=\/usr\/bin\/redis-server/DAEMON=\/usr\/local\/bin\/redis-server/g' /etc/init.d/redis-server 
useradd redis
mkdir -p /var/lib/redis
mkdir -p /var/log/redis
chown redis.redis /var/lib/redis
chown redis.redis /var/log/redis
update-rc.d redis-server defaults
/etc/init.d/redis-server start
cd /etc/init.d/
echo ./redis-cli 
echo http://blog.hemantthorat.com/install-redis-2-6-on-ubuntu/

apt-get -y install python-software-properties python g++ make
add-apt-repository -y ppa:chris-lea/node.js
apt-get update
apt-get -y install nodejs

npm install hiredis redis csv
apt-get install couchdb -y


wget -O - http://debian.neo4j.org/neotechnology.gpg.key|  apt-key add -
touch /etc/apt/sources.list.d/neo4j.list
echo 'deb http://debian.neo4j.org/repo stable/' > /etc/apt/sources.list.d/neo4j.list
apt-get update && apt-get -y install neo4j-enterprise
sed "s/#org.neo4j.server.webserver.address/org.neo4j.server.webserver.address/g" /etc/neo4j/neo4j-server.properties > /etc/neo4j/neo4j-server-updated.properties
cat /etc/neo4j/neo4j-server-updated.properties > /etc/neo4j/neo4j-server.properties
/etc/init.d/neo4j-service restart
