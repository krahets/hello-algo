-- @script: hash_map.lua
-- @date 2025-11-12
-- @author fisheryv (yue.fisher2025@gdhfi.com)

-- 添加模块搜索路径
package.path = package.path .. ";codes/lua/modules/?.lua"

local print_util = require("print_util")

--- 根据 key 删除 table 中的元素
--- @param tbl table
--- @param key any
--- @return table
local function remove_by_key(tbl, key)
    -- Lua table 不支持按 key 删除元素，因此需要重构整张 table
    local new_table = {}
    for _key, _value in pairs(tbl) do
        if _key ~= key then
            new_table[_key] = _value
        end
    end
    return new_table
end

-- Driver Code
local function main()
    -- 初始化哈希表
    -- Lua 内置的表（table）本身就是哈希表
    local hmap = {}

    -- 添加操作
    -- 在哈希表中添加键值对 (key, value)
    hmap[12836] = "小哈"
    hmap[15937] = "小啰"
    hmap[16750] = "小算"
    hmap[13276] = "小法"
    hmap[10583] = "小鸭"
    print("\n添加完成后，哈希表为\nKey -> Value")
    print_util.print_dict(hmap)

    -- 查询操作
    -- 向哈希表中输入键 key ，得到值 value
    local name = hmap[15937]
    print("\n输入学号 15937 ，查询到姓名 " .. name)

    -- 删除操作
    -- 在哈希表中删除键值对 (key, value)
    hmap = remove_by_key(hmap, 10583)
    print("\n删除 10583 后，哈希表为\nKey -> Value")
    print_util.print_dict(hmap)

    -- 遍历哈希表 - 键值对
    print("\n遍历键值对 Key->Value")
    for key, value in pairs(hmap) do
        print(key .. " -> " .. value)
    end

    -- 单独遍历键
    print("\n单独遍历键 Key")
    for key in pairs(hmap) do
        print(key)
    end

    -- 单独遍历值
    print("\n单独遍历值 Value")
    for _, value in pairs(hmap) do
        print(value)
    end
end

-- 执行主函数
main()
