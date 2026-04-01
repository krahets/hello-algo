-- @script: array_stack.lua
-- @date 2025-11-11
-- @author fisheryv (yue.fisher2025@gdhfi.com)

--- @class ArrayStack
--- 基于数组实现的栈
--- @field _stack table 使用表作为栈的存储结构
local ArrayStack = {}
ArrayStack.__index = ArrayStack

--- 构造方法
--- @return ArrayStack
function ArrayStack.new()
    local obj = {}
    setmetatable(obj, ArrayStack)
    obj._stack = {} -- 使用表作为栈的存储结构
    return obj
end

--- 获取栈的长度
--- @return integer
function ArrayStack:size()
    return #self._stack
end

--- 判断栈是否为空
--- @return boolean
function ArrayStack:is_empty()
    return self:size() == 0
end

--- 入栈操作
--- @param item integer 要入栈的元素
function ArrayStack:push(item)
    table.insert(self._stack, item)
end

--- 出栈操作
--- @return integer
--- @raise 栈为空时抛出错误
function ArrayStack:pop()
    if self:is_empty() then
        error("栈为空")
    end
    return table.remove(self._stack)
end

--- 访问栈顶元素
--- @return integer
--- @raise 栈为空时抛出错误
function ArrayStack:peek()
    if self:is_empty() then
        error("栈为空")
    end
    return self._stack[#self._stack]
end

--- 返回列表用于打印
--- @return table
function ArrayStack:to_list()
    -- 返回栈的浅拷贝以避免外部修改
    local result = {}
    for i, v in ipairs(self._stack) do
        result[i] = v
    end
    return result
end

-- Driver Code
local function main()
    -- 初始化栈
    local stack = ArrayStack.new()

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
