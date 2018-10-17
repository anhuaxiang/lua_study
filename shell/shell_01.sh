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