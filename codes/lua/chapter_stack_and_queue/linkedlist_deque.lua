-- @script linked_deque.lua
-- @date 2025-11-11
-- @author fisheryv (yue.fisher2025@gdhfi.com)

--- @class DeListNode
--- 双向链表节点
--- @field val number 节点值
--- @field next DeListNode|nil 后继节点引用
--- @field prev DeListNode|nil 前驱节点引用
local DeListNode = {}
DeListNode.__index = DeListNode

--- 构造方法
--- @param val number 节点值
--- @return DeListNode
function DeListNode.new(val)
    local obj = {}
    setmetatable(obj, DeListNode)
    obj.val = val
    obj.next = nil -- 后继节点引用
    obj.prev = nil -- 前驱节点引用
    return obj
end

--- @class LinkedListDeque
--- 基于双向链表实现的双向队列
--- @field _front DeListNode|nil 队首节点
--- @field _rear DeListNode|nil 队尾节点
--- @field _size integer 双向队列长度
local LinkedListDeque = {}
LinkedListDeque.__index = LinkedListDeque

--- 构造方法
--- @return LinkedListDeque
function LinkedListDeque.new()
    local obj = {}
    setmetatable(obj, LinkedListDeque)
    obj._front = nil -- 头节点 front
    obj._rear = nil  -- 尾节点 rear
    obj._size = 0    -- 双向队列的长度
    return obj
end

--- 获取双向队列的长度
--- @return number
function LinkedListDeque:size()
    return self._size
end

--- 判断双向队列是否为空
--- @return boolean
function LinkedListDeque:is_empty()
    return self._size == 0
end

--- 入队操作
--- @param num number 入队值
--- @param is_front boolean 是否在队首入队
function LinkedListDeque:push(num, is_front)
    local node = DeListNode.new(num)

    -- 若链表为空，则令 front 和 rear 都指向 node
    if self:is_empty() then
        self._front = node
        self._rear = node
        -- 队首入队操作
    elseif is_front then
        -- 将 node 添加至链表头部
        self._front.prev = node
        node.next = self._front
        self._front = node -- 更新头节点
        -- 队尾入队操作
    else
        -- 将 node 添加至链表尾部
        self._rear.next = node
        node.prev = self._rear
        self._rear = node       -- 更新尾节点
    end
    self._size = self._size + 1 -- 更新队列长度
end

--- 队首入队
--- @param num number 入队值
function LinkedListDeque:push_first(num)
    self:push(num, true)
end

--- 队尾入队
--- @param num number 入队值
function LinkedListDeque:push_last(num)
    self:push(num, false)
end

--- 出队操作
--- @param is_front boolean 是否在队首出队
--- @return number
--- @raise 双向队列为空时抛出错误
function LinkedListDeque:pop(is_front)
    if self:is_empty() then
        error("双向队列为空")
    end

    local val
    -- 队首出队操作
    if is_front then
        val = self._front.val -- 暂存头节点值
        -- 删除头节点
        local fnext = self._front.next
        if fnext ~= nil then
            fnext.prev = nil
            self._front.next = nil
        end
        self._front = fnext -- 更新头节点
        -- 队尾出队操作
    else
        val = self._rear.val -- 暂存尾节点值
        -- 删除尾节点
        local rprev = self._rear.prev
        if rprev ~= nil then
            rprev.next = nil
            self._rear.prev = nil
        end
        self._rear = rprev      -- 更新尾节点
    end
    self._size = self._size - 1 -- 更新队列长度
    return val
end

--- 队首出队
--- @return number
function LinkedListDeque:pop_first()
    return self:pop(true)
end

--- 队尾出队
--- @return number
function LinkedListDeque:pop_last()
    return self:pop(false)
end

--- 访问队首元素
--- @return number
function LinkedListDeque:peek_first()
    if self:is_empty() then
        error("双向队列为空")
    end
    return self._front.val
end

--- 访问队尾元素
--- @return number
function LinkedListDeque:peek_last()
    if self:is_empty() then
        error("双向队列为空")
    end
    return self._rear.val
end

--- 返回数组用于打印
--- @return table
function LinkedListDeque:to_array()
    local node = self._front
    local res = {}
    for i = 1, self:size() do
        res[i] = node.val
        node = node.next
    end
    return res
end

-- Driver Code
local function main()
    -- 初始化双向队列
    local deque = LinkedListDeque.new()
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
