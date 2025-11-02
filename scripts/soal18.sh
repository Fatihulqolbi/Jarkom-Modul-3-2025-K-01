Di Palantir (Master) — IP 10.64.4.3

Instal & konfigurasi:

apt-get update
apt-get install -y mariadb-server
cp /etc/mysql/mariadb.conf.d/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf.bak

cat >> /etc/mysql/mariadb.conf.d/50-server.cnf <<'EOF'
server-id = 1
log_bin = /var/log/mysql/mysql-bin.log
binlog_do_db = laravel_db
bind-address = 0.0.0.0
EOF

mkdir -p /var/log/mysql
chown -R mysql:mysql /var/log/mysql
chmod 750 /var/log/mysql

systemctl restart mariadb


Buat user replikasi & catat master status:

mysql -e "CREATE DATABASE IF NOT EXISTS laravel_db;"
mysql -e "CREATE USER 'replication_user'@'%' IDENTIFIED BY 'replication_password'; GRANT REPLICATION SLAVE ON *.* TO 'replication_user'@'%'; FLUSH PRIVILEGES;"
mysql -e "FLUSH TABLES WITH READ LOCK; SHOW MASTER STATUS\G" > /tmp/master_status.txt
mysqldump -u root laravel_db > /tmp/laravel_db.sql
mysql -e "UNLOCK TABLES;"
cat /tmp/master_status.txt


Catat File dan Position dari SHOW MASTER STATUS.

Salin /tmp/laravel_db.sql ke Narvi (scp atau share).

Di Narvi (Slave) — IP 10.64.4.2

Instal & konfigurasi:

apt-get update
apt-get install -y mariadb-server
cp /etc/mysql/mariadb.conf.d/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf.bak

cat >> /etc/mysql/mariadb.conf.d/50-server.cnf <<'EOF'
server-id = 2
relay-log = /var/log/mysql/mysql-relay-bin.log
log_bin = /var/log/mysql/mysql-bin.log
binlog_do_db = laravel_db
bind-address = 0.0.0.0
EOF

mkdir -p /var/log/mysql
chown -R mysql:mysql /var/log/mysql
chmod 750 /var/log/mysql

systemctl restart mariadb
mysql -e "CREATE DATABASE IF NOT EXISTS laravel_db;"
# copy /tmp/laravel_db.sql from master to /tmp/ on Narvi then:
mysql laravel_db < /tmp/laravel_db.sql


Konfigurasi slave (ganti MASTER_LOG_FILE dan MASTER_LOG_POS dengan nilai yang kamu catat):

mysql -e "STOP SLAVE;
CHANGE MASTER TO
  MASTER_HOST='10.64.4.3',
  MASTER_USER='replication_user',
  MASTER_PASSWORD='replication_password',
  MASTER_LOG_FILE='mysql-bin.000001',
  MASTER_LOG_POS=  328;
START SLAVE;"
mysql -e "SHOW SLAVE STATUS\G"

Verifikasi replikasi

Di Master:

mysql -e "USE laravel_db; CREATE TABLE IF NOT EXISTS test_replication (id INT AUTO_INCREMENT PRIMARY KEY, message VARCHAR(255)); INSERT INTO test_replication (message) VALUES ('from master');"
mysql -e "SELECT * FROM laravel_db.test_replication;"


Di Slave (setengah detik/tunggu 2–5 detik):

mysql -e "USE laravel_db; SHOW TABLES;"
mysql -e "USE laravel_db; SELECT * FROM test_replication;"
mysql -e "SHOW SLAVE STATUS\G" | egrep "Slave_IO_Running|Slave_SQL_Running|Seconds_Behind_Master|Last_Error"