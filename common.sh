a=/tmp/expense.log

download and extract(){
  curl -o /tmp/$component.zip https://expense-artifacts.s3.amazonaws.com/$component.zip >>$a
  echo unzipping
  unzip /tmp/$component >>$a
}