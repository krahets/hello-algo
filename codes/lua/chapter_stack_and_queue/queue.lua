-- @script queue.lua
-- @date 2025-11-11
-- @author fisheryv (yue.fisher2025@gdhfi.com)


-- Driver Code
local function main()
    -- 使用Lua表模拟队列数据结构
    -- 初始化队列
    local que = {}

    -- 元素入队
    table.insert(que, 1)
    table.insert(que, 3)
    table.insert(que, 2)
    table.insert(que, 5)
    table.insert(que, 4)
    print("队列 que = [" .. table.concat(que, ", ") .. "]")

    -- 访问队首元素
    local front = que[1]
    print("队首元素 front = " .. tostring(front))

    -- 元素出队
    local pop = #que == 0 and nil or table.remove(que, 1)
    print("出队元素 pop = " .. tostring(pop))
    print("出队后 que = [" .. table.concat(que, ", ") .. "]")

    -- 获取队列长度
    local size = #que
    print("队列长度 size = " .. tostring(size))

    -- 判断队列是否为空
    local is_empty = #que == 0
    print("队列是否为空 = " .. tostring(is_empty))
end

-- 执行主函数
main()
