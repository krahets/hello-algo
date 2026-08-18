-- @script top_k.lua
-- @date 2025-11-14
-- @author fisheryv (yue.fisher2025@gdhfi.com)

-- 添加模块搜索路径
package.path = package.path .. ";codes/lua/modules/?.lua"

local print_util = require("print_util")
-- Lua 没有内置堆模块，我手动实现了一个
local heapq = require("heapq")

--- 基于堆查找数组中最大的 k 个元素
--- @param nums table 输入数组
--- @param k integer 要查找的元素个数
--- @return table 最大的 k 个元素组成的数组
local function top_k_heap(nums, k)
    -- 初始化小顶堆
    local heap = {}
    -- 将数组的前 k 个元素入堆
    for i = 1, k do
        heapq.heappush(heap, nums[i])
    end

    -- 从第 k+1 个元素开始，保持堆的长度为 k
    for i = k + 1, #nums do
        -- 若当前元素大于堆顶元素，则将堆顶元素出堆、当前元素入堆
        if nums[i] > heap[1] then
            heapq.heappop(heap)
            heapq.heappush(heap, nums[i])
        end
    end

    return heap
end

-- Driver Code
local function main()
    local nums = { 1, 7, 6, 3, 2 }
    local k = 3

    local res = top_k_heap(nums, k)
    print(string.format("最大的 %d 个元素为", k))
    print_util.print_heap(res)
end

-- 执行主函数
main()
