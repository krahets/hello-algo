-- @script: array_queue.lua
-- @date 2025-11-11
-- @author fisheryv (yue.fisher2025@gdhfi.com)

--- @class ArrayQueue
--- 基于环形数组实现的队列
--- @field _nums table 用于存储队列元素的数组
--- @field _front integer 队首指针，指向队首元素
--- @field _size integer 队列长度
local ArrayQueue = {}
ArrayQueue.__index = ArrayQueue

--- 构造方法
--- @param size integer 队列容量
--- @return ArrayQueue 实例
function ArrayQueue.new(size)
    local obj = {}
    setmetatable(obj, ArrayQueue)

    -- 用于存储队列元素的数组
    obj._nums = {}
    for i = 1, size do
        obj._nums[i] = 0
    end

    -- 队首指针，指向队首元素（Lua索引从1开始）
    obj._front = 1
    -- 队列长度
    obj._size = 0

    return obj
end

--- 获取队列的容量
--- @return integer
function ArrayQueue:capacity()
    return #self._nums
end

--- 获取队列的长度
--- @return integer
function ArrayQueue:size()
    return self._size
end

--- 判断队列是否为空
--- @return boolean
function ArrayQueue:is_empty()
    return self._size == 0
end

--- 入队
--- @param num integer 要入队的元素
--- @raise 如果队列已满则抛出错误
function ArrayQueue:push(num)
    if self._size == self:capacity() then
        error("队列已满")
    end

    -- 计算队尾指针，指向队尾索引 + 1
    -- 通过取余操作实现rear越过数组尾部后回到头部
    local rear = (self._front + self._size - 1) % self:capacity() + 1
    -- 将num添加至队尾
    self._nums[rear] = num
    self._size = self._size + 1
end

--- 出队
--- @return integer
--- @raise 队列为空时抛出错误
function ArrayQueue:pop()
    local num = self:peek()
    -- 队首指针向后移动一位，若越过尾部，则返回到数组头部
    self._front = (self._front % self:capacity()) + 1
    self._size = self._size - 1
    return num
end

--- 访问队首元素
--- @return integer
--- @raise 队列为空时抛出错误
function ArrayQueue:peek()
    if self:is_empty() then
        error("队列为空")
    end
    return self._nums[self._front]
end

--- 返回列表用于打印
--- @return table
function ArrayQueue:to_list()
    local res = {}
    local j = self._front

    for i = 1, self:size() do
        -- 计算实际索引，处理环形数组的环绕
        local index = ((j - 1) % self:capacity()) + 1
        res[i] = self._nums[index]
        j = j + 1
    end

    return res
end

-- Driver Code
local function main()
    -- 初始化队列
    local queue = ArrayQueue.new(10)

    -- 元素入队
    queue:push(1)
    queue:push(3)
    queue:push(2)
    queue:push(5)
    queue:push(4)
    print("队列 queue = [" .. table.concat(queue:to_list(), ", ") .. "]")

    -- 访问队首元素
    local peek = queue:peek()
    print("队首元素 peek = " .. tostring(peek))

    -- 元素出队
    local pop = queue:pop()
    print("出队元素 pop = " .. tostring(pop))
    print("出队后 queue = [" .. table.concat(queue:to_list(), ", ") .. "]")

    -- 获取队列的长度
    local size = queue:size()
    print("队列长度 size = " .. tostring(size))

    -- 判断队列是否为空
    local is_empty = queue:is_empty()
    print("队列是否为空 = " .. tostring(is_empty))

    -- 测试环形数组
    for i = 0, 9 do
        queue:push(i)
        queue:pop()
        print(string.format("第 %d 轮入队 + 出队后 queue = [%s]", i, table.concat(queue:to_list(), ", ")))
    end
end

-- 执行主函数
main()
