echo Installing the nginx
dnf install nginx -y >/tmp/expense.log

Removing the congiguration
rm -rf /usr/share/nginx/html/* >/tmp/expense.log
cp expense.conf /etc/nginx/default.d/expense.conf >/tmp/expense.log

curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip >/tmp/expense.log

echo unzipping
cd /usr/share/nginx/html >/tmp/expense.log
unzip /tmp/frontend.zip >/tmp/expense.log


echo starting the service
systemctl enable nginx >/tmp/expense.log
systemctl restart nginx >/tmp/expense.log