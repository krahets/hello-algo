-- @script linear_search.lua
-- @date 2025-11-15
-- @author fisheryv (yue.fisher2025@gdhfi.com)

-- 添加模块搜索路径
package.path = package.path .. ";codes/lua/modules/?.lua"

local list_node = require("list_node")
local list_to_linked_list = list_node.list_to_linked_list

--- 线性查找（数组）
--- @param nums table 数组
--- @param target integer 目标值
--- @return integer 找到返回索引，未找到返回-1
--- @warning Lua table 索引从 1 开始
local function linear_search_array(nums, target)
    -- 遍历数组
    for i = 1, #nums do
        if nums[i] == target then -- 找到目标元素，返回其索引
            return i              -- 注意：Lua索引从1开始
        end
    end
    return -1 -- 未找到目标元素，返回-1
end

--- 线性查找（链表）
--- @param head ListNode|nil 链表头节点
--- @param target integer 目标值
--- @return ListNode|nil 找到返回节点，未找到返回nil
local function linear_search_linkedlist(head, target)
    -- 遍历链表
    local current = head
    while current do
        if current.val == target then -- 找到目标节点，返回之
            return current
        end
        current = current.next
    end
    return nil -- 未找到目标节点，返回nil
end

-- Driver Code
local function main()
    local target = 3

    -- 在数组中执行线性查找
    local nums = { 1, 5, 3, 2, 4, 7, 5, 9, 10, 8 }
    local index = linear_search_array(nums, target)
    print("目标元素 3 的索引 = " .. index)

    -- 在链表中执行线性查找
    local head = list_to_linked_list(nums)
    local node = linear_search_linkedlist(head, target)
    print("目标节点值 3 的对应节点对象为: " .. tostring(node))
end

-- 执行主函数
main()
