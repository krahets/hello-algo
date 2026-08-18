-- @script heap.lua
-- @date 2025-11-14
-- @author fisheryv (yue.fisher2025@gdhfi.com)

-- 添加模块搜索路径
package.path = package.path .. ";codes/lua/modules/?.lua"

local print_util = require("print_util")
-- Lua 没有内置堆模块，我手动实现了一个
local heapq = require("heapq")

--- 元素入堆测试
--- @param heap table 堆数组
--- @param val integer 要插入的值
--- @param flag integer 堆类型标志 (1: 小顶堆, -1: 大顶堆)
local function test_push(heap, val, flag)
    flag = flag or 1
    heapq.heappush(heap, flag * val)

    print(string.format("\n元素 %d 入堆后", val))
    -- 打印堆时恢复原始值
    local display_heap = {}
    for _, v in ipairs(heap) do
        table.insert(display_heap, flag * v)
    end
    print_util.print_heap(display_heap)
end

--- 堆顶元素出堆测试
--- @param heap table 堆数组
--- @param flag integer 堆类型标志 (1: 小顶堆, -1: 大顶堆)
local function test_pop(heap, flag)
    flag = flag or 1
    local val = flag * heapq.heappop(heap)

    print(string.format("\n堆顶元素 %d 出堆后", val))
    -- 打印堆时恢复原始值
    local display_heap = {}
    for _, v in ipairs(heap) do
        table.insert(display_heap, flag * v)
    end
    print_util.print_heap(display_heap)
end


-- Driver Code
local function main()
    -- 初始化小顶堆
    local min_heap, flag = {}, 1

    -- 初始化大顶堆
    local max_heap, flag = {}, -1

    print("\n以下测试样例为大顶堆")
    -- 这里手动实现的 heapq 模块与 Python 保持一致，默认实现小顶堆
    -- 考虑将"元素取负"后再入堆，这样就可以将大小关系颠倒，从而实现大顶堆
    -- 在本示例中，flag = 1 时对应小顶堆，flag = -1 时对应大顶堆

    -- 元素入堆
    test_push(max_heap, 1, flag)
    test_push(max_heap, 3, flag)
    test_push(max_heap, 2, flag)
    test_push(max_heap, 5, flag)
    test_push(max_heap, 4, flag)

    -- 获取堆顶元素
    local peek = flag * max_heap[1]
    print(string.format("\n堆顶元素为 %d", peek))

    -- 堆顶元素出堆
    test_pop(max_heap, flag)
    test_pop(max_heap, flag)
    test_pop(max_heap, flag)
    test_pop(max_heap, flag)
    test_pop(max_heap, flag)

    -- 获取堆大小
    local size = #max_heap
    print(string.format("\n堆元素数量为 %d", size))

    -- 判断堆是否为空
    local is_empty = #max_heap == 0
    print(string.format("\n堆是否为空 %s", tostring(is_empty)))

    -- 输入列表并建堆
    -- 时间复杂度为 O(n) ，而非 O(nlogn)
    min_heap = { 1, 3, 2, 5, 4 }
    heapq.heapify(min_heap)
    print("\n输入列表并建立小顶堆后")
    print_util.print_heap(min_heap)
end

-- 执行主函数
main()
