-- @script linked_stack.lua
-- @date 2025-11-11
-- @author fisheryv (yue.fisher2025@gdhfi.com)


-- 添加模块搜索路径
package.path = package.path .. ";codes/lua/modules/?.lua"

local list_node = require("list_node")
local ListNode = list_node.ListNode

--- @class LinkedListStack
--- 基于链表实现的栈
--- @field _peek ListNode 栈顶节点
--- @field _size integer 栈的长度
local LinkedListStack = {}
LinkedListStack.__index = LinkedListStack

--- 构造方法
--- @return LinkedListStack 新的栈实例
function LinkedListStack.new()
    local obj = {}
    setmetatable(obj, LinkedListStack)
    obj._peek = nil -- 栈顶节点
    obj._size = 0   -- 栈的长度
    return obj
end

--- 获取栈的长度
--- @return integer
function LinkedListStack:size()
    return self._size
end

--- 判断栈是否为空
--- @return boolean
function LinkedListStack:is_empty()
    return self._size == 0
end

--- 入栈
--- @param val number
function LinkedListStack:push(val)
    local node = ListNode.new(val)
    node.next = self._peek
    self._peek = node
    self._size = self._size + 1
end

--- 出栈
--- @return number
function LinkedListStack:pop()
    local num = self:peek()
    self._peek = self._peek.next
    self._size = self._size - 1
    return num
end

--- 访问栈顶元素
--- @return number 栈顶元素
--- @raise 栈为空时抛出错误
function LinkedListStack:peek()
    if self:is_empty() then
        error("栈为空")
    end
    return self._peek.val
end

---转化为列表用于打印
---@return table
function LinkedListStack:to_list()
    local arr = {}
    local node = self._peek
    while node do
        table.insert(arr, 1, node.val) -- 在头部插入，相当于 reverse
        node = node.next
    end
    return arr
end

-- Driver Code
local function main()
    -- 初始化栈
    local stack = LinkedListStack.new()

    -- 元素入栈
    stack:push(1)
    stack:push(3)
    stack:push(2)
    stack:push(5)
    stack:push(4)
    print("栈 stack = [" .. table.concat(stack:to_list(), ", ") .. "]")

    -- 访问栈顶元素
    local peek = stack:peek()
    print("栈顶元素 peek = " .. peek)

    -- 元素出栈
    local pop = stack:pop()
    print("出栈元素 pop = " .. pop)
    print("出栈后 stack = [" .. table.concat(stack:to_list(), ", ") .. "]")

    -- 获取栈的长度
    local size = stack:size()
    print("栈的长度 size = " .. size)

    -- 判断是否为空
    local is_empty = stack:is_empty()
    print("栈是否为空 = " .. tostring(is_empty))
end

-- 执行主函数
main()
