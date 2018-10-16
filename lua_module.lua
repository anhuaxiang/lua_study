module = {}
module.constant = '这是一个常量'

function module.fun01()
	io.write('这是模块中的共有函数')
end

local function fun02()
	print('这是模块中的私有函数')
end

function module.fun03()
	fun02()
end

return module
