---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Administrator.
--- DateTime: 2018/10/26 13:35
---


local lfs = require("lfs")
local all_file_path = {}


function print_lfs_version()
    print(lfs._VERSION)
end


function print_current_dir()
    local root_path = lfs.currentdir()
    print(root_path)
end


function get_all_files(root_path)
    for child in lfs.dir(root_path) do
        if child ~= "." and child ~= ".." then
            local path = root_path .. "\\" ..child
            local attr = lfs.attributes(path)
            assert(type(attr) == "table")
            if attr.mode == "directory" then
                get_all_files(path)
            elseif attr.mode == "file" then
                table.insert(all_file_path, path)
            end
        end
    end
end


function print_table(tb, level)
    local level  = level or 1
    local indent_str = ""
    for i = 1, level do
        indent_str = indent_str .. "  "
    end

    print(indent_str .. "{")

    for k, v in pairs(tb) do
        local item_str = string.format("%s%s = %s", indent_str .. "  ", tostring(k), tostring(v))
        print(item_str)
        if type(v) == "table" then
            print_table(v, level + 1)
        end
    end
    print(indent_str .. "}")
end



function main()
    local root_path = lfs.currentdir()
    print_lfs_version()
    print_current_dir()
    get_all_files(root_path)
    print_table(all_file_path)
end


--main()

function fun(...)
    print(...)
    x, y, z = ...
    print(x, y, z)

end

fun(1, 2, 3)