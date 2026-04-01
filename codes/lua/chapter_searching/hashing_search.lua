-- @script hashing_search.lua
-- @date 2025-11-15
-- @author fisheryv (yue.fisher2025@gdhfi.com)

-- 添加模块搜索路径
package.path = package.path .. ";codes/lua/modules/?.lua"

local list_node = require("list_node")
local list_to_linked_list = list_node.list_to_linked_list


--- 哈希查找（数组）
--- @param hmap table 哈希表，key为目标元素，value为索引
--- @param target integer 目标值
--- @return integer 目标元素的索引，不存在则返回-1
--- @warning Lua table 索引从 1 开始
local function hashing_search_array(hmap, target)
    return hmap[target] or -1
end

--- 哈希查找（链表）
--- @param hmap table 哈希表，key为目标元素，value为节点对象
--- @param target integer 目标值
--- @return ListNode|nil 目标节点对象，不存在则返回nil
local function hashing_search_linkedlist(hmap, target)
    return hmap[target]
end

-- Driver Code
local function main()
    local target = 3

    -- 哈希查找（数组）
    local nums = { 1, 5, 3, 2, 4, 7, 5, 9, 10, 8 }

    -- 初始化哈希表
    local map0 = {}
    for i, num in ipairs(nums) do
        map0[num] = i -- key: 元素，value: 索引
    end

    local index = hashing_search_array(map0, target)
    print("目标元素 3 的索引 =", index)

    -- 哈希查找（链表）
    local head = list_to_linked_list(nums)

    -- 初始化哈希表
    local map1 = {}
    local current = head
    while current do
        map1[current.val] = current -- key: 节点值，value: 节点
        current = current.next
    end

    local node = hashing_search_linkedlist(map1, target)
    print("目标节点值 3 的对应节点对象为 " .. tostring(node))
end

-- 执行主函数
main()
