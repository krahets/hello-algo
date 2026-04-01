-- @script dequeue.lua
-- @date 2025-11-11
-- @author fisheryv (yue.fisher2025@gdhfi.com)


-- Driver Code
local function main()
    -- 使用Lua表模拟双向队列数据结构
    -- 初始化双向队列
    local deq = {}

    -- 元素入队
    table.insert(deq, 2) -- 添加至队尾
    table.insert(deq, 5)
    table.insert(deq, 4)
    table.insert(deq, 1, 3) -- 添加至队首
    table.insert(deq, 1, 1)
    print("双向队列 deque = [" .. table.concat(deq, ", ") .. "]")

    -- 访问元素
    local front = deq[1]   -- 队首元素
    print("队首元素 front = " .. tostring(front))
    local rear = deq[#deq] -- 队尾元素
    print("队尾元素 rear = " .. tostring(rear))

    -- 元素出队
    local pop_front = table.remove(deq, 1) -- 队首元素出队
    print("队首出队元素  pop_front = " .. tostring(pop_front))
    print("队首出队后 deque = [" .. table.concat(deq, ", ") .. "]")
    local pop_rear = table.remove(deq) -- 队尾元素出队
    print("队尾出队元素  pop_rear = " .. tostring(pop_rear))
    print("队尾出队后 deque = [" .. table.concat(deq, ", ") .. "]")

    -- 获取双向队列的长度
    local size = #deq
    print("双向队列长度 size = " .. tostring(size))

    -- 判断双向队列是否为空
    local is_empty = #deq == 0
    print("双向队列是否为空 = " .. tostring(is_empty))
end

-- 执行主函数
main()
