
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
		print(j, '*', i, '=', i*j, '\\')
	end
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

