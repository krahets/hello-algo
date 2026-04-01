-- @script: array_deque.lua
-- @date 2025-11-11
-- @author fisheryv (yue.fisher2025@gdhfi.com)

--- @class ArrayDeque
--- 基于环形数组实现的双向队列
--- @field _nums table 用于存储双向队列元素的数组
--- @field _front number 队首指针，指向队首元素
--- @field _size number 双向队列长度
local ArrayDeque = {}
ArrayDeque.__index = ArrayDeque

--- 构造方法
--- @param capacity integer 队列容量
--- @return ArrayDeque
function ArrayDeque.new(capacity)
    local obj = {}
    setmetatable(obj, ArrayDeque)

    obj._nums = {}
    for i = 1, capacity do
        obj._nums[i] = 0
    end
    obj._front = 1
    obj._size = 0

    return obj
end

--- 获取双向队列的容量
--- @return integer
function ArrayDeque:capacity()
    return #self._nums
end

--- 获取双向队列的长度
--- @return integer
function ArrayDeque:size()
    return self._size
end

--- 判断双向队列是否为空
--- @return boolean
function ArrayDeque:is_empty()
    return self._size == 0
end

--- 计算环形数组索引
--- @param i integer 原始索引
--- @return integer
function ArrayDeque:index(i)
    -- 通过取余操作实现数组首尾相连
    -- 当 i 越过数组尾部后，回到头部
    -- 当 i 越过数组头部后，回到尾部
    return (i + self:capacity() - 1) % self:capacity() + 1
end

--- 队首入队
--- @param num number 要入队的数字
function ArrayDeque:push_first(num)
    if self._size == self:capacity() then
        print("双向队列已满")
        return
    end
    -- 队首指针向左移动一位
    -- 通过取余操作实现 front 越过数组头部后回到尾部
    self._front = self:index(self._front - 1)
    -- 将 num 添加至队首
    self._nums[self._front] = num
    self._size = self._size + 1
end

--- 队尾入队
--- @param num number 要入队的数字
function ArrayDeque:push_last(num)
    if self._size == self:capacity() then
        print("双向队列已满")
        return
    end
    -- 计算队尾指针，指向队尾索引 + 1
    local rear = self:index(self._front + self._size)
    -- 将 num 添加至队尾
    self._nums[rear] = num
    self._size = self._size + 1
end

--- 队首出队
--- @return number
function ArrayDeque:pop_first()
    local num = self:peek_first()
    -- 队首指针向后移动一位
    self._front = self:index(self._front + 1)
    self._size = self._size - 1
    return num
end

--- 队尾出队
--- @return number
function ArrayDeque:pop_last()
    local num = self:peek_last()
    self._size = self._size - 1
    return num
end

--- 访问队首元素
--- @return number
--- @raise 双向队列为空时抛出错误
function ArrayDeque:peek_first()
    if self:is_empty() then
        error("双向队列为空")
    end
    return self._nums[self._front]
end

--- 访问队尾元素
--- @return number
--- @raise 双向队列为空时抛出错误
function ArrayDeque:peek_last()
    if self:is_empty() then
        error("双向队列为空")
    end
    -- 计算尾元素索引
    local last = self:index(self._front + self._size - 1)
    return self._nums[last]
end

--- 返回数组用于打印
--- @return table
function ArrayDeque:to_array()
    local res = {}
    -- 仅转换有效长度范围内的列表元素
    for i = 0, self._size - 1 do
        res[i + 1] = self._nums[self:index(self._front + i)]
    end
    return res
end

-- Driver Code
local function main()
    -- 初始化双向队列
    local deque = ArrayDeque.new(10)
    deque:push_last(3)
    deque:push_last(2)
    deque:push_last(5)
    print("双向队列 deque = [" .. table.concat(deque:to_array(), ", ") .. "]")

    -- 访问元素
    local peek_first = deque:peek_first()
    print("队首元素 peek_first = " .. tostring(peek_first))
    local peek_last = deque:peek_last()
    print("队尾元素 peek_last = " .. tostring(peek_last))

    -- 元素入队
    deque:push_last(4)
    print("元素 4 队尾入队后 deque = [" .. table.concat(deque:to_array(), ", ") .. "]")
    deque:push_first(1)
    print("元素 1 队首入队后 deque = [" .. table.concat(deque:to_array(), ", ") .. "]")

    -- 元素出队
    local pop_last = deque:pop_last()
    print(string.format("队尾出队元素 = %d ，队尾出队后 deque = [%s]", pop_last, table.concat(deque:to_array(), ", ")))
    local pop_first = deque:pop_first()
    print(string.format("队首出队元素 = %d ，队首出队后 deque = [%s]", pop_first, table.concat(deque:to_array(), ", ")))

    -- 获取双向队列的长度
    local size = deque:size()
    print("双向队列长度 size = " .. tostring(size))

    -- 判断双向队列是否为空
    local is_empty = deque:is_empty()
    print("双向队列是否为空 = " .. tostring(is_empty))
end

-- 执行主函数
main()
