#! /bin/bash
echo "hello word!"

your_name="he he"
echo $your_name

for skill in ada coff ad ja; do
	echo "i am good at ${skill} script"
done

your_name="tom"
echo $your_name

my_url="anhuaxiang.cn"
echo $my_url
readonly my_url
echo $my_url
my_url="baidu.com"
echo $my_url

you_url="taobao.com"
echo you_url
unset $you_url
echo "----------"
echo $you_url

string="this is string"
str="hello, i know you are \"${string}\" !\n"
echo $str
echo ""
your_name="your"
g1="hello, "$your_name""
echo $g1
g2="hello, $your_name"
echo $g2

g3='hello, '$your_name''
g4='hello, $your_name'
echo $g3, $g4

string="DSFeadsfadskjfdskaljfdsakjfdsakljfdsak"
echo ${#string}

echo ${string:0:5}

echo `expr index "$string" ad`
echo ''
echo ""
echo ''
echo '---------------------------------'
array_name=(1 2 3 4 5 6)
echo $array_name
array_name=(
	1
	2
	3
	4
	5
	6
	)
echo $array_name
arr[1]='a'
arr[2]='b'
arr[b]='cbfadfdfa'
echo ${arr[1]}
echo ${arr[2]}
echo ${arr[b]}
echo ${arr[@]}
echo ${#array_name[@]}, ${#arr[@]}
echo ${#array_name[*]}, ${#arr[*]}
echo ${#array_name[0]}, ${#arr[b]}

# 这是注释
# 这是单行注释
:<<EOF
EOF 可以换成 ' 或者 ！（前后都换）
这是多行注释
fdaf
fadsf
afa
这是多行注释
EOF
echo '测试注释'