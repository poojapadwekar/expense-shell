source common.sh
echo Installing the nginx
dnf install nginx -y >>$a

Removing the congiguration
rm -rf /usr/share/nginx/html/* >>$a
cp expense.conf /etc/nginx/default.d/expense.conf >>$a

curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip >>$a

echo unzipping
cd /usr/share/nginx/html >>$a
unzip /tmp/frontend.zip >>$a


echo starting the service
systemctl enable nginx >>/tmp/expense.log
systemctl restart nginx >>/tmp/expense.log