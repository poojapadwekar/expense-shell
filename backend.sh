echo curl the nodesource
curl -sL https://rpm.nodesource.com/setup_lts.x | bash >/tmp/expense.log

echo dwonloading the node js
dnf install nodejs -y >/tmp/expense.log

useradd expense
cp backend.service /etc/systemd/system/backend.service >/tmp/expense.log
rm -rf /app >/tmp/expense.log
mkdir /app >/tmp/expense.log
echo curl
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/backend.zip >/tmp/expense.log
cd /app
unzip /tmp/backend.zip >/tmp/expense.log

npm install >/tmp/expense.log

systemctl daemon-reload >/tmp/expense.log

systemctl enable backend >/tmp/expense.log
systemctl start backend >/tmp/expense.log

dnf install mysql -y >/tmp/expense.log

mysql -h mysql.saujpoo.online -uroot -pExpenseApp@1 < /app/schema/backend.sql