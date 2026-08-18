-- @script my_heap.lua
-- @date 2025-11-14
-- @author fisheryv (yue.fisher2025@gdhfi.com)

-- 添加模块搜索路径
package.path = package.path .. ";codes/lua/modules/?.lua"

local print_util = require("print_util")

--- @class MaxHeap
--- 大顶堆实现
--- @field max_heap table 堆数组
local MaxHeap = {}
MaxHeap.__index = MaxHeap

--- 构造方法，根据输入列表建堆
--- @param nums table 输入数字列表
--- @return MaxHeap
function MaxHeap.new(nums)
    local obj = setmetatable({}, MaxHeap)
    -- 将列表元素原封不动添加进堆
    obj.max_heap = {}
    for i, v in ipairs(nums) do
        obj.max_heap[i] = v
    end

    -- 堆化除叶节点以外的其他所有节点
    local last_non_leaf = math.floor((#obj.max_heap - 1) / 2)
    for i = last_non_leaf, 1, -1 do
        obj:sift_down(i)
    end

    return obj
end

--- 获取左子节点的索引
--- @param i integer 当前节点索引
--- @return integer
function MaxHeap:left(i)
    return 2 * i
end

--- 获取右子节点的索引
--- @param i integer 当前节点索引
--- @return integer
function MaxHeap:right(i)
    return 2 * i + 1
end

--- 获取父节点的索引
--- @param i integer 当前节点索引
--- @return integer
function MaxHeap:parent(i)
    return math.floor(i / 2)
end

--- 交换元素
--- @param i integer 索引1
--- @param j integer 索引2
function MaxHeap:swap(i, j)
    self.max_heap[i], self.max_heap[j] = self.max_heap[j], self.max_heap[i]
end

--- 获取堆大小
--- @return integer
function MaxHeap:size()
    return #self.max_heap
end

--- 判断堆是否为空
--- @return boolean
function MaxHeap:is_empty()
    return self:size() == 0
end

--- 访问堆顶元素
--- @return integer
function MaxHeap:peek()
    if self:is_empty() then
        error("堆为空")
    end
    return self.max_heap[1]
end

--- 元素入堆
--- @param val integer 要插入的值
function MaxHeap:push(val)
    -- 添加节点
    table.insert(self.max_heap, val)
    -- 从底至顶堆化
    self:sift_up(self:size())
end

--- 从节点 i 开始，从底至顶堆化
--- @param i integer 节点索引
function MaxHeap:sift_up(i)
    while true do
        -- 获取节点 i 的父节点
        local p = self:parent(i)
        -- 当"越过根节点"或"节点无须修复"时，结束堆化
        if p < 1 or self.max_heap[i] <= self.max_heap[p] then
            break
        end
        -- 交换两节点
        self:swap(i, p)
        -- 循环向上堆化
        i = p
    end
end

--- 元素出堆
--- @return integer
function MaxHeap:pop()
    -- 判空处理
    if self:is_empty() then
        error("堆为空")
    end
    -- 交换根节点与最右叶节点（交换首元素与尾元素）
    self:swap(1, self:size())
    -- 删除节点
    local val = table.remove(self.max_heap)
    -- 从顶至底堆化
    if not self:is_empty() then
        self:sift_down(1)
    end
    -- 返回堆顶元素
    return val
end

--- 从节点 i 开始，从顶至底堆化
--- @param i integer 节点索引
function MaxHeap:sift_down(i)
    while true do
        -- 判断节点 i, l, r 中值最大的节点，记为 ma
        local l = self:left(i)
        local r = self:right(i)
        local ma = i

        if l <= self:size() and self.max_heap[l] > self.max_heap[ma] then
            ma = l
        end
        if r <= self:size() and self.max_heap[r] > self.max_heap[ma] then
            ma = r
        end
        -- 若节点 i 最大或索引 l, r 越界，则无须继续堆化，跳出
        if ma == i then
            break
        end
        -- 交换两节点
        self:swap(i, ma)
        -- 循环向下堆化
        i = ma
    end
end

--- 打印堆（二叉树）
function MaxHeap:print()
    print_util.print_heap(self.max_heap)
end

-- 测试代码
local function main()
    -- 初始化大顶堆
    local max_heap = MaxHeap.new({ 9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2 })
    print("\n输入列表并建堆后")
    max_heap:print()

    -- 获取堆顶元素
    local peek = max_heap:peek()
    print("\n堆顶元素为 " .. peek)

    -- 元素入堆
    local val = 7
    max_heap:push(val)
    print("\n元素 " .. val .. " 入堆后")
    max_heap:print()

    -- 堆顶元素出堆
    peek = max_heap:pop()
    print("\n堆顶元素 " .. peek .. " 出堆后")
    max_heap:print()

    -- 获取堆大小
    local size = max_heap:size()
    print("\n堆元素数量为 " .. size)

    -- 判断堆是否为空
    local is_empty = max_heap:is_empty()
    print("\n堆是否为空 " .. tostring(is_empty))
end

-- 执行主函数
main()
