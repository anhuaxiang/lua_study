local lfs = require("lfs")

-- 配置设备的ip
function ipconfig()
	print('input name')
	name = io.read()
	print('input ip')
	ip = io.read()
	print('input mask')
	mask = io.read()
	r = os.execute("ifconfig " .. name .. " " .. ip .. " netmask " .. mask)
	if r then
		print("success")
	else
		print("Operation not permitted")
	end
end


function get_card_name()
	local base_path = "/sys/class/net"
	local name_list = {}
    for name in lfs.dir(base_path) do
        if name ~= "." and name ~= ".." and name ~= "lo" then
            table.insert(name_list, name)
        end
    end
    return name_list
end


-- 查看设备
function show_ipconfig()
    for i, name in pairs(get_card_name()) do
        execute_result  = io.popen("ifconfig " .. name)
        io.input(execute_result)
        s = io.read("*all")
        for a, b, c, d in string.gmatch(s, 'HWaddr ([%a%d:]+)[%s]+inet addr:([%d.]+)  Bcast:([%d.]+)  Mask:([%d.]+)') do
            io.write("name-", name, '  HWaddr-', a, '  ip-', b, '  bcast-', c, '  mask:-', d, "\n")
            io.close()
        end
    end
end


-- 菜单选择
function main()
	print("---------------select menu---------------------")
	print("---------------1: ipconfig---------------------")
	print("---------------2: show ipconfig----------------")
	io.write("input id:")
	local select_id = io.read()
	if select_id == "1" then ipconfig() end
	if select_id == "2" then show_ipconfig() end
end


main()
