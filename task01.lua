-- 配置设备的ip
function ipconfig()
	print('input name')
	name = io.read()
	print('input ip')
	ip = io.read()
	print('input mask')
	mask = io.read()
	a = os.execute("ifconfig " .. name .. " " .. ip .. " netmask " .. mask)
	if a then
		print("success")
	else
		print("Operation not permitted")
	end
end


-- 查看设备
function show_ipconfig()
	execute_result  = io.popen("ifconfig")
	io.input(execute_result)
	s = io.read("*all")
	for a, b, c, d in string.gmatch(s, 'HWaddr ([%a%d:]+)[%s]+inet addr:([%d.]+)  Bcast:([%d.]+)  Mask:([%d.]+)') do
	io.write('HWaddr为 ', a, '  ip为 ', b, '  bcast为 ', c, '  mask:为 ', d, "\n")
	io.flush()
	end
end


-- 菜单选择
function menu()
	print("---------------select menu---------------------")
	print("---------------1: ipconfig---------------------")
	print("---------------2: show ipconfig----------------")
	io.write("input id:")
	local select_id = io.read()
	if select_id == "1" then ipconfig() end
	if select_id == "2" then show_ipconfig() end
end


menu()
