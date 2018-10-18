#/bin/bash

demo_fun(){
	echo "只是shell测试函数"
}
echo "调用函数"
demo_fun
echo "调用结束"

fun_with_return(){
	echo "求两数之和"
	echo "输入第一个数"
	read a
	echo "输入第二个数"
	read b
	return $(($a+$b))
}

fun_with_return
echo "结果为：$?"


fun_with_param(){
	echo "第一个参数为 $1 !"
    echo "第二个参数为 $2 !"
    echo "第十个参数为 $10 !"
    echo "第十个参数为 ${10} !"
    echo "第十一个参数为 ${11} !"
    echo "参数总数有 $# 个!"
    echo "作为一个字符串输出所有参数 $* !"
}
fun_with_param 1 2 3 4 5 6 7 8 9 10 11 12

url="anhuaxiang.cn"