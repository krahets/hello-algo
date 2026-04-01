-- @script linked_queue.lua
-- @date 2025-11-11
-- @author fisheryv (yue.fisher2025@gdhfi.com)

-- 添加模块搜索路径
package.path = package.path .. ";codes/lua/modules/?.lua"

local list_node = require("list_node")
local ListNode = list_node.ListNode

--- @class LinkedListQueue
--- 基于链表实现的队列
--- @field _front ListNode 队首节点
--- @field _rear ListNode 队尾节点
--- @field _size integer 队列长度
local LinkedListQueue = {}
LinkedListQueue.__index = LinkedListQueue

--- 构造方法
--- @return LinkedListQueue 新的队列实例
function LinkedListQueue.new()
    local instance = setmetatable({}, LinkedListQueue)
    instance._front = nil -- 头节点 front
    instance._rear = nil  -- 尾节点 rear
    instance._size = 0    -- 队列长度
    return instance
end

--- 获取队列的长度
--- @return integer
function LinkedListQueue:size()
    return self._size
end

--- 判断队列是否为空
--- @return boolean
function LinkedListQueue:is_empty()
    return self._size == 0
end

--- 入队
--- @param num number
function LinkedListQueue:push(num)
    -- 在尾节点后添加 num
    local node = ListNode.new(num)
    -- 如果队列为空，则令头、尾节点都指向该节点
    if self._front == nil then
        self._front = node
        self._rear = node
        -- 如果队列不为空，则将该节点添加到尾节点后
    else
        self._rear.next = node
        self._rear = node
    end
    self._size = self._size + 1
end

--- 出队
--- @return number
function LinkedListQueue:pop()
    local num = self:peek()
    -- 删除头节点
    self._front = self._front.next
    self._size = self._size - 1
    return num
end

--- 访问队首元素
--- @return number
function LinkedListQueue:peek()
    if self:is_empty() then
        error("队列为空")
    end
    return self._front.val
end

--- 转化为列表用于打印
--- @return table
function LinkedListQueue:to_list()
    local queue = {}
    local temp = self._front
    while temp do
        table.insert(queue, temp.val)
        temp = temp.next
    end
    return queue
end

-- Driver Code
local function main()
    -- 初始化队列
    local queue = LinkedListQueue.new()

    -- 元素入队
    queue:push(1)
    queue:push(3)
    queue:push(2)
    queue:push(5)
    queue:push(4)
    print("队列 queue = [" .. table.concat(queue:to_list(), ", ") .. "]")

    -- 访问队首元素
    local peek = queue:peek()
    print("队首元素 front = " .. tostring(peek))

    -- 元素出队
    local pop_front = queue:pop()
    print("出队元素 pop = " .. tostring(pop_front))
    print("出队后 queue = [" .. table.concat(queue:to_list(), ", ") .. "]")

    -- 获取队列的长度
    local size = queue:size()
    print("队列长度 size = " .. tostring(size))

    -- 判断队列是否为空
    local is_empty = queue:is_empty()
    print("队列是否为空 = " .. tostring(is_empty))
end

-- 执行主函数
main()
