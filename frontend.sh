source common.sh
common=frontend
echo Installing the nginx
dnf install nginx -y >>$a

Removing the congiguration
rm -rf /usr/share/nginx/html/* >>$a
cp expense.conf /etc/nginx/default.d/expense.conf >>$a
cd /usr/share/nginx/html >>$a
download and extarct


echo starting the service
systemctl enable nginx >>/tmp/expense.log
systemctl restart nginx >>/tmp/expense.log