function test_closure()
	-- body
	local i = 0
	return function()
		i = i + 1
		return i
	end
end

c1 = test_closure()
c2 = test_closure()

print(c1())
print(c1())
print(c2())


function test_closure02()
	-- body
	local i = 0
	function wrapper()
		i = i + 1
		return i
	end
	return wrapper
end

c3 = test_closure02()
print(c3())
print(c3())
print(c3())
print('-------------')
print()
print()

function list_iter(t)
	-- body
	local i = 0
	local n = table.getn(t)
	return function()
		-- body
		i = i + 1
		if i <= n then
			return t[i]
		end
	end
end
t = {1, 2, 3}
for i in list_iter(t) do
	print(i)
end