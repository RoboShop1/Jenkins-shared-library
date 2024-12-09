if [[ -v db_type ]]; then echo ""; else echo  "** db_type ** variable is missing" && exit 1 ; fi

if [ "${db_type}" == "mysql" ];
then
    if [[ -v mysql_host &&  -v mysql_username && -v mysql_password ]] ; then
      echo ""
      else
      echo "** mysql_host ** check variables"
      echo "** mysql_username ** check variables"
      echo "** mysql_password ** check variables"
      exit 1
      fi
git clone https://github.com/RoboShop1/r-shipping.git /app
cd /app
echo "mysql -h ${mysql_host} -u${mysql_username} -p${mysql_password} < db/app-user.sql"
mysql -h ${mysql_host} -u${mysql_username} -p${mysql_password} < db/app-user.sql


echo "mysql -h ${mysql_host} -u${mysql_username} -p${mysql_password} < db/master-data.sql"
mysql -h ${mysql_host} -u${mysql_username} -p${mysql_password} < db/master-data.sql

echo "mysql -h ${mysql_host} -u${mysql_username} -p${mysql_password} < db/schema.sql"
mysql -h ${mysql_host} -u${mysql_username} -p${mysql_password} < db/schema.sql

fi


if [ "${db_type}" == "mongo" ];
then
    if [[ -v mongo_host ]] ; then
      echo ""
      else
      echo "** mongo_host ** check variables"
      exit 1
      fi
git clone https://github.com/RoboShop1/r-catalogue.git /app
cd /app
for i in `ls db`; do
mongosh --host ${mongo_host} < db/${i}
done
fi
