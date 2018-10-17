local function add(a, b)
	assert(type(a) == "number", "a is not number")
	assert(type(b) == "number", "b is not number")
	return a+b
end 
print(add(10, 2))

--Lua 协程
co = coroutine.create(
	function (i)
		print(i)
	end
)
coroutine.resume(co, 1)
print(coroutine.status(co))
print('---------------')

co = coroutine.wrap(
	function (i)
		print(i)
	end
)
co(1)
print('------------------')

co2 = coroutine.create(
	function()
		for i=1, 10 do
			print(i)
			if i == 3 then
				print(coroutine.status(co2))
				print(coroutine.running())
			end
			coroutine.yield()
		end
	end
)
coroutine.resume(co2)
coroutine.resume(co2)
coroutine.resume(co2)
print(coroutine.status(co2))
print(coroutine.running())
print('----------------')
print()
print()
print()


function foo(a)
	print('foo输出', a)
	return coroutine.yield(2 * a)
end

co = coroutine.create(
	function(a, b)
		print('第一次协程执行输出', a, b)
		local r = foo(a + 1)

		print('第二次协程执行输出', r)
		local r, s = coroutine.yield(a + b, a - b)

		print('第三次协程执行输出', r, s)
		return b, '协同程序结束'
	end
)
print('main', coroutine.resume(co, 1, 10))
print('分割线')
print('main', coroutine.resume(co, 'y'))
print('分割线')
print('main', coroutine.resume(co, 'x', 'y'))
print('分割线')
print('main', coroutine.resume(co, 'x', 'y'))
print('分割线')
print('-----------------')
print()
print()
print()


--Lua productor, consumer
-- local new_productor

-- function productor()
-- 	local i = 0
-- 	while true do
-- 		i = i + 1
-- 		send(i)
-- 	end
-- end

-- function consumer()
-- 	while true do
-- 		local i = receive()
-- 		print(i)
-- 	end
-- end

-- function receive()
-- 	local status, value = coroutine.resume(new_productor)
-- 	return value
-- end

-- function send(x)
-- 	coroutine.yield(x)
-- end

-- new_productor = coroutine.create(productor)
-- consumer()
