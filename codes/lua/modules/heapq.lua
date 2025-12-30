-- @module heapq
-- @date 2025-11-14
-- @author fisheryv (yue.fisher2025@gdhfi.com)

local heapq = {}

--- 上浮调整
--- @param heap table 堆数组
--- @param index integer 要调整的节点索引
local function _sift_up(heap, index)
    while index > 1 do
        local parent = math.floor(index / 2)
        if heap[parent] <= heap[index] then
            break
        end
        heap[parent], heap[index] = heap[index], heap[parent]
        index = parent
    end
end

--- 下沉调整
--- @param heap table 堆数组
--- @param index integer 要调整的节点索引
local function _sift_down(heap, index)
    local n = #heap
    while true do
        local left = 2 * index
        local right = 2 * index + 1
        local smallest = index

        if left <= n and heap[left] < heap[smallest] then
            smallest = left
        end

        if right <= n and heap[right] < heap[smallest] then
            smallest = right
        end

        if smallest == index then
            break
        end

        heap[index], heap[smallest] = heap[smallest], heap[index]
        index = smallest
    end
end

--- 建堆操作
--- @param heap 要构建为堆的数组
function heapq.heapify(heap)
    -- 从最后一个非叶子节点开始调整
    for i = math.floor(#heap / 2), 1, -1 do
        _sift_down(heap, i)
    end
end

--- 元素入堆
--- @function push
--- @param heap table 堆数组
--- @param val integer 要插入的值
function heapq.heappush(heap, val)
    -- 元素入堆
    table.insert(heap, val)
    -- 上浮调整
    _sift_up(heap, #heap)
end

--- 堆顶元素出堆
--- @param heap table 堆数组
function heapq.heappop(heap)
    flag = flag or 1
    if #heap == 0 then
        print("\n堆为空，无法出堆")
        return
    end

    -- 交换堆顶和堆底元素
    heap[1], heap[#heap] = heap[#heap], heap[1]
    -- 堆顶元素出堆
    local val = flag * table.remove(heap)
    -- 下沉调整
    if #heap > 0 then
        _sift_down(heap, 1)
    end

    return val
end

return heapq
