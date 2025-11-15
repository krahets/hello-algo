-- @script heap_sort.lua
-- @date 2025-11-15
-- @author fisheryv (yue.fisher2025@gdhfi.com)

--- 从节点 i 开始，从顶至底堆化
--- @param nums table 待堆化的数组
--- @param n integer 堆的长度
--- @param i integer 当前节点索引
local function sift_down(nums, n, i)
    while true do
        -- 判断节点 i, l, r 中值最大的节点，记为 ma
        local l = 2 * i + 1
        local r = 2 * i + 2
        local ma = i

        if l < n and nums[l + 1] > nums[ma + 1] then
            ma = l
        end

        if r < n and nums[r + 1] > nums[ma + 1] then
            ma = r
        end

        -- 若节点 i 最大或索引 l, r 越界，则无须继续堆化，跳出
        if ma == i then
            break
        end

        -- 交换两节点
        nums[i + 1], nums[ma + 1] = nums[ma + 1], nums[i + 1]

        -- 循环向下堆化
        i = ma
    end
end

--- 堆排序
--- @param nums table 待排序的数组
--- @return table 排序后的数组
local function heap_sort(nums)
    if not nums or #nums == 0 then
        return nums
    end

    local n = #nums

    -- 建堆操作：堆化除叶节点以外的其他所有节点
    for i = math.floor(n / 2) - 1, 0, -1 do
        sift_down(nums, n, i)
    end

    -- 从堆中提取最大元素，循环 n-1 轮
    for i = n - 1, 1, -1 do
        -- 交换根节点与最右叶节点（交换首元素与尾元素）
        nums[1], nums[i + 1] = nums[i + 1], nums[1]

        -- 以根节点为起点，从顶至底进行堆化
        sift_down(nums, i, 0)
    end

    return nums
end

-- Driver Code
local function main()
    local nums = { 4, 1, 3, 1, 5, 2 }
    heap_sort(nums)
    print("堆排序完成后 nums = [" .. table.concat(nums, ", ") .. "]")
end

-- 执行主函数
main()
