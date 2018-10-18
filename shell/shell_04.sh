printf "%-10s %-8s %-4s \n" 姓名 性别 体重
printf "%-10s %-8s %-4.2f \n " 郭靖 男 36.1515511

for loop in 1 2 3 4 5
do
    echo "The value is: $loop"
done

int=1
while(( $int<=5 ))
do
    echo $int
    let "int++"
done

echo '按下 <CTRL-D> 退出'
echo -n '输入你最喜欢的网站名: '
while read FILM
do
    echo "是的！$FILM 是一个好网站"
done