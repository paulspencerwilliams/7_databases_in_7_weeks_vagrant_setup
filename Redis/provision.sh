sudo apt-get update
sudo apt-get -y install build-essential
sudo apt-get -y install tcl8.5
wget http://redis.googlecode.com/files/redis-2.6.0-rc3.tar.gz
tar xzf redis-2.6.0-rc3.tar.gz
cd redis-2.6.0-rc3
make
sudo make install
make test
sudo mkdir /etc/redis
sudo mv redis.conf /etc/redis/redis.conf
sudo vi /etc/redis/redis.conf 
cd src/
wget https://raw.github.com/gist/1053791/880a4a046e06028e
160055406d02bdc7c57f3615/redis-server
ls
wget https://raw.github.com/gist/1053791/880a4a046e06028e160055406d02bdc7c57f3615/redis-server
ls
ls redis-server
sudo mv redis-server.1 /etc/init.d/redis-server
sudo mv redis-cli /etc/init.d/redis-cli
sudo chmod +x /etc/init.d/redis-server
sudo vi /etc/init.d/redis-server 
sudo useradd redis
sudo mkdir -p /var/lib/redis
sudo mkdir -p /var/log/redis
sudo chown redis.redis /var/lib/redis
sudo chown redis.redis /var/log/redis
sudo update-rc.d redis-server defaults
sudo /etc/init.d/redis-server start
cd /etc/init.d/
./redis-cli 
http://blog.hemantthorat.com/install-redis-2-6-on-ubuntu/
