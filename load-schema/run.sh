if [ "${db_type}" == "mysql" ];
then
git clone https://github.com/RoboShop1/r-shipping.git /app
cd /app
for i in `ls db`; do
mysql -h ${mysql_host} -u${mysql_username} -p${mysql_password} < /app/db/${$i}.sql
done

if [ "${db_type}" == "mongo" ];
then
git clone https://github.com/RoboShop1/r-catalogue.git /app
cd /app
for i in `ls db`; do
mongosh --host ${mongo_host} </app/db/master-data.js
done
