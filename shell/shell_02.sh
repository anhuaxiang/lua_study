#!/bin/bash

echo "执行文件名 $0"
echo "第一个参数 $1"
echo "第二个参数 $2"
echo "第三个参数 $3"
echo "第四个参数 $4"
echo "传递参数个数 $#"
echo "当前进程ID号 $$"
echo "传递的参数作为一个字符串显示：$*"

my_array=(A B "C" D)
echo "第一个元素为: ${my_array[0]}"
echo "第二个元素为: ${my_array[1]}"
echo "第三个元素为: ${my_array[2]}"
echo "第四个元素为: ${my_array[3]}"
echo "数组所有元素为： ${my_array[*]}"
echo "数组长度为： ${#my_array[*]}"