wget -O - http://debian.neo4j.org/neotechnology.gpg.key|  apt-key add -
touch /etc/apt/sources.list.d/neo4j.list
echo 'deb http://debian.neo4j.org/repo stable/' > /etc/apt/sources.list.d/neo4j.list
apt-get update && apt-get -y install neo4j-enterprise
sed "s/#org.neo4j.server.webserver.address/org.neo4j.server.webserver.address/g" /etc/neo4j/neo4j-server.properties > /etc/neo4j/neo4j-server-updated.properties
cat /etc/neo4j/neo4j-server-updated.properties > /etc/neo4j/neo4j-server.properties
/etc/init.d/neo4j-service restart
