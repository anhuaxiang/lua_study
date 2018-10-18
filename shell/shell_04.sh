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

# echo '按下 <CTRL-D> 退出'
# echo -n '输入你最喜欢的网站名: '
# while read FILM
# do
#     echo "是的！$FILM 是一个好网站"
# done

num1=100
num2=200
if test $num1 -eq $num2
then
	echo '相等'
else
	echo '不相等'
fi

echo $[1+2 ]
echo `expr 1 + 2`

if test -e ./shell_04.sh
then
	echo ./shell.sh 存在
else
	echo ./shell.sh不存在
fi

if test -e ./shell_04.sh -a -e ./shell_03.sh
then
	echo dfdasf
else
	echo nnnn
fi


if test $(ps -ef | grep -c 'bash') -gt 1
then
	echo 'true'
fi

a=10
b=20
if test $a -eq $b
then
	echo a=b
elif test $a -lt $b
then
	echo a\<b
else
	echo a\>b
fi


for i in 1 2 3 4 5
do 
	echo $i
done

i=1
while(($i<=5))
do
	echo $i
	let 'i++'
	i=`expr $i + 1`
done

a=0
until [ $a -gt 10 ] 
do
	echo $a
	a=`expr $a + 1`
done

while [[ true ]]
do
	echo 'input a number(1-4)'
	read num
	case $num in
		1) echo 1
		;;
		2) echo 2
		;;
		3) echo 3
		;;
		4) echo 4
		;;
	esac

	if test $num -gt 4
	then 
		echo 跳出循环
		break
	fi
done

