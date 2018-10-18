
print("hello")
--print("单行注释")
--[[
    多行注释
	多行注释
]]--


print("nihao")
a, b = 10, 20
f = 20 / 3
g = 20 / 3
print(a, b)
print(f)
print(j)



a = 5
print(a)


local a = 6

function joke()
	c = 5
	local  a = 4
end
joke()
print(a, c)
a = a + 1
print(a)
print(a, b)

a, b = b, a
print(a, b)

a, b, c = 10, 1
print(a, b, c)
a, b = 1, 2, 3, 4
print(a, b)

a = {}
a['key'] = "value"
print(a.key)

print(type(type(abc)), abc)
print(type(1), 1)
print(type(1.0), 1.0)
print(joke, type(joke))
a, b, c = 1, 2, 1
print(a==c, a~=b, (a==c and a~=b), not false)

c, d = "a", "b"
print(c..d)
print(#c..d)


if a and b
then
	print('ha')
else
	print('bb')
end


local a = 1
while a < 10
do
	print(a)
	a = a + 1
end
print('---------------')
for i=10,-2,-2
do
   print(i)
end

for i=1, 9, 1
do
	for j=1, i, 1
	do
		io.write(j, '*', i, '=',  i*j, '\t')
	end
	print()
end
print("分割线")
j =2
for i=2,10 do
   for j=2, (i/j) , 2 do
      if(not(i%j))
      then
         break
      end
      if(j > (i/j)) then
         print("Value of i is",i)
      end
   end
end

print('-----------------------')
local a = 10
while a < 20 do
	print('value of a', a)
	a = a +1
	if a > 15 then
		break
	end
end
print('-------------------')

a = 22
if a < 20 then
	print('a<20')
else
	print('a>20')
end
print('-------------------')

a = 100
if a == 10 then
	print('a=10')
elseif a == 20 then
	print('a=20')
elseif a == 30 then
	print('a=30')
else 
	print('不符合条件')
end
print('-------------------')
a = 4
if a < 10 then
	print('a<10')
	if a < 5 then
		print('a<5')
	end
end
print('-------------------')

function max(a, b)
	if a >= b then
		return a
	else
		return b
	end
end
print(max(1, 2))
print('-------------------')

myprint = function(param)
	print('param=', param)
end
function sum(a, b, fun_print)
	fun_print(a+b)
end
print(myprint(5))
sum(5, 6, myprint)
print('-------------------')
function average( ... )
	result = 0
	local args = {...}
	for i,v in ipairs(args) do
		print(i, v)
		result = result + v
	end
	return result / #args
end
print(average(10, 5, 6, 4))


str1 = "lua"
print(str1)
str2 = 'LUA'
print(str2)
str3 = [["Lua"\'dfdfa']]
print(str3)

print(string.sub(str1, 1, -1))
print(string.gsub(str1, 'u', 'a'))
print(string.format('%d', 5))
print(string.find(str1, 'a'))
print(string.match(str1, '%a+'))
for word in string.gmatch(str1, '%a') do
	print(word)
end

array = {1, 2, 3}
for i=1, 3, 1 do
	print(array[i])
end
print('-------------------')
array = {}
for i=-2, 2 do
	array[i] = i * 2
end
for i = -2, 2 do
	print(array[i])
end
print('数组长度', #array, array)
print('--------多维数组---------')

array = {}
for i=1, 3 do
	array[i] = {}
	for j=1, 3 do
		array[i][j] = i*j
	end
end
print(array)
for i=1, 3 do
	for j=1, 3 do
		print(array[i][j])
	end
end
print('-----------------------')
-- 初始化数组
array = {}
maxRows = 3
maxColumns = 3
for row=1,maxRows do
	for col=1,maxColumns do
    	array[row*maxColumns +col] = row*col
	end
end

-- 访问数组
for row=1,maxRows do
	for col=1,maxColumns do
		print(array[row*maxColumns +col])
	end
end
print('-----------------------')
-- array = {1, 2, 3}
array = {1,3,[5]=5,name="kaikai",age=12, 89}
for k, v in pairs(array) do
	print(k, v)
end
print('---')
for k, v in ipairs(array) do
	print(k, v)
end
print('---------------------')

function square(iterator_max_count, current_number)
	if current_number < iterator_max_count then
		current_number = current_number + 1
	return current_number, current_number * current_number
	end
end
for i, n in square, 3, 0 do
	print(i, n)
end
print('------------------------------')
print('------------------------------')
print('------------------------------')

function iter(a, i)
	i = i + 1
	local v = a[i]
	if v then
		return i, v
	end
end
function my_ipairs(a)
	return iter, a, 0
end

array = {1, 4, 2, 4, 6}
for i, n in my_ipairs(array) do
	print(i, n)
end
print('---------------')
array = {'lua', 'python'}
function element_iterator(collction)
	local index = 0
	local length = #collction
	return function ()
		index = index  + 1
		if index <= length then
			return collction[index]
		end
	end
end

for ele in element_iterator(array) do
	print(ele)
end
print('------------------------------')
print('------------------------------')
print('------------------------------')
--lua table
function print_table(array)
	print('------', array, '-------------')
	for k, v in pairs(array) do
		print(k, v)
	end
end

my_table = {}
print(type(my_table))

my_table[1] = 'Lua'
my_table['user'] = 'xiaoyan'
print_table(my_table)

copy_table = my_table
print_table(copy_table)

copy_table['user'] = 'xiaoxiao'
print_table(my_table)
print_table(copy_table)
copy_table = nil
print_table(my_table)
print(copy_table)

my_table = {'xiaoyan', 'xiaofang', 'xiaoxiao'}
print(table.concat(my_table))
print(table.concat(my_table, ','))
print(table.concat(my_table, ',', 2, 3))

table.insert(my_table, 'xiaodeng')
print_table(my_table)
table.insert(my_table, 2, 'xiaohei')
print_table(my_table)
table.remove(my_table)
print_table(my_table)
table.remove(my_table, 1)
print_table(my_table)
table.sort(my_table)
print_table(my_table)
--table.maxn 返回table的长度
print(my_table[table.maxn(my_table)])
your_table = {1, 5}
print(table.maxn(your_table))

function table_maxn(t)
	local mn = t[1]
	for k, v in pairs(t) do
		if v and v > mn then
			mn = v
		end
	end
	return mn
end
print(table_maxn(my_table))