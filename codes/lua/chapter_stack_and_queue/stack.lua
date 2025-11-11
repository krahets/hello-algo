-- @script stack.lua
-- @date 2025-11-11
-- @author fisheryv (yue.fisher2025@gdhfi.com)


-- Driver Code
local function main()
    -- 初始化栈
    -- Lua 没有内置的栈类，可以把 table 当作栈来使用
    local stack = {}

    -- 元素入栈
    table.insert(stack, 1)
    table.insert(stack, 3)
    table.insert(stack, 2)
    table.insert(stack, 5)
    table.insert(stack, 4)
    print("栈 stack = [" .. table.concat(stack, ", ") .. "]")

    -- 访问栈顶元素
    local peek = stack[#stack]
    print("栈顶元素 peek = " .. peek)

    -- 元素出栈
    local pop = table.remove(stack)
    print("出栈元素 pop = " .. pop)
    print("出栈后 stack = [" .. table.concat(stack, ", ") .. "]")

    -- 获取栈的长度
    local size = #stack
    print("栈的长度 size = " .. size)

    -- 判断是否为空
    local is_empty = #stack == 0
    print("栈是否为空 = " .. tostring(is_empty))
end

-- 执行主函数
main()
