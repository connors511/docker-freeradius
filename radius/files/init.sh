#!/bin/bash
## http://stackoverflow.com/questions/7364709/bash-script-check-if-mysql-database-exists-peform-action-based-on-result
## --user=XXXXXX --password=XXXXXX *may* not be necessary if run as root or you have unsecured DBs but
##   using them makes this script a lot more portable.  Thanks @billkarwin
RESULT=`mysqlshow --host=mysql --user=radius --password=radpass radius| grep -v Wildcard | grep -o radius`
if [ "$RESULT" != "radius" ]; then
    echo "Database not present"
    mysql -u radius -p radpass -h mysql < /etc/freeradius/sql/mysql/schema.sql
    mysql -u radius -p radpass -h mysql < /etc/freeradius/sql/mysql/nas.sql
    echo "Database created"
fi

freeradius -X