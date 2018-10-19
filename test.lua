os.execute('ipconfig')

local a = 1
do 
	local b = 2
	print(a, b)
end
print(a, b)


function function_name(a, b)
	return a, b
end

print((function_name(1, 3)))
print(a, b)

function in_count(n)
	n = n or 1
	count = count + n
end

count = 0
in_count()
in_count()
in_count()
print(count)


function unpack (t, i)
	i = i or 1
	if t[i] ~= nil then
		return t[i], unpack(t, i + 1)
	end
end
print(unpack({1, 2, 3}))


function fun01(n)
	if n == 0 then
		return 0
	end
	if n == 1 then
		return 1
	end
	if n == 2 then
		return 2
	end
	return fun01(n-1) + fun01(n-2)
end

print(fun01(5))
print('------------')
printResult = ""
function haha( ... )
	print(arg)
	for i, v in ipairs(arg) do
		print(i, v)
		printResult = printResult .. tostring(v) .. "\t"
	end
	printResult = printResult .. "\n"
end

haha(0, 1, 2)
print(printResult)
print("***********************")

function select(n, ... )
	return arg[n]
end
print(string.find("hello hello", " hel"))
print(select(1, string.find("hello hello", " hel")))
print("++++++++++++++++++++++++++++++++")

function named_arguments(args)
	print(args.a, args.b)
end

named_arguments {1, 2, 3, a=1, b=10}
print('--------------------------------')

 network = {
	{name = "grauna",  IP = "210.26.30.34"},
	{name = "arraial", IP = "210.26.30.23"},
	{name = "lua",     IP = "210.26.23.12"},
	{name = "derain",  IP = "210.26.23.20"},
}
table.sort(network, function (a, b) return (a.name < b.name) end)
for k1, t in ipairs(network) do
	for k2, v in pairs(t) do
		io.write(k2, ':',v , '\t\t')
	end
	print()
end

print('***************************************')
TermSize = {w = 80, h = 24}
function eraseTerminal ()
	io.write("\27[2J")
end
function mark (x, y)
	io.write(string.format("\27[%d;%dH*", y, x))
end
function plot(f)
	eraseTerminal()
	for i=1, TermSize.w do
		local x = (i/TermSize.w) * 2 -1
		local y = (f(x) + 1) / 2 * TermSize.h
		mark(i, y)
	end
	io.read()
end
plot(function(x) return math.sin(x*2*math.pi) end)