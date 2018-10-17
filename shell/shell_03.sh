#!/bin/bash

# 运算符
val=`expr 2 + 2`
echo 两数之和为：$val


a=10
b=20
echo 两数相加：`expr $a + $b`
echo 两数相减：`expr $a - $b`
echo 两数相乘：`expr $a \* $b`
echo 两数相除：`expr $a / $b`
echo 两数取余：`expr $a % $b`
echo $[1 == 2] # 0
echo $[2 != 1] # 1

echo `expr $1 + $2`	

# 关系运算符
if [ $a == $b ]
then
	echo a=b
fi
if [ $a != $b ] 
then
	echo a!=b
fi

if [ $a -eq $b ]
then
	echo a = b
else
	echo a != b
fi

if [ $a -ne $b ]
then
	echo a = b
else
	echo a != b
fi

if [ $a -gt $b ]
then
	echo a \> b
else
	echo a \< b
fi

if [ $a -lt $b ]
then
	echo a \< b
else
	echo a \> b
fi

if [ $a -ge $b ]
then
	echo a \>= b
else
	echo a \<= b
fi

if [ $a -le $b ]
then
	echo a \<= b
else
	echo a \>= b
fi

# 布尔运算符
if [ $a -lt 100 -a $b -gt 15 ]
then
	echo a\<100 and b\>15
fi

# 逻辑运算符
if [[ $a -lt 100 && $b -gt 100 ]]
then
	echo true
else
	echo false
fi

if [[ $a -lt 100 || $b -gt 100 ]]
then
	echo true
else
	echo false
fi

# 字符串运算符
a="abc"
b="edg"

if [ $a = $b ]
then
	echo a=b
else
	echo a!=b
fi

# -z 字符长度为0， true
# -n 字符长度不为0， true
# $ 字符不为空， true
if [ -z $a ]
then
	echo a长度为0
else
	echo a长度不为0
fi

if [ -n $a ]
then
	echo a长度不为0
else
	echo a长度为0
fi

if [ $a ]
then
	echo a不为空
else
	echo a为空
fi

if [ $c ]
then
	echo c不为空
else
	echo c为空
fi