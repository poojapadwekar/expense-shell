echo mysql module disable
dnf module disable mysql -y >/tmp/expense.log

echo copying the content to the configuration file
cp mysql.repo /etc/yum.repos.d/mysql.repo >/tmp/expense.log

echo installing the mysql server
dnf install mysql-community-server -y >/tmp/expense.log

echo starting the mysql service
systemctl enable mysqld
systemctl start mysqld

mysql_secure_installation --set-root-pass ExpenseApp@1
