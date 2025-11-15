-- @script bucket_sort.lua
-- @date 2025-11-15
-- @author fisheryv (yue.fisher2025@gdhfi.com)

--- 桶排序
--- @param nums table 待排序的数组（就地修改）
local function bucket_sort(nums)
    -- 初始化 k = n/2 个桶，预期向每个桶分配 2 个元素
    local k = math.floor(#nums / 2)
    local buckets = {}
    for i = 1, k do
        buckets[i] = {}
    end

    -- 1. 将数组元素分配到各个桶中
    for _, num in ipairs(nums) do
        -- 输入数据范围为 [0, 1)，使用 num * k 映射到索引范围 [1, k]
        local idx = math.floor(num * k) + 1
        -- 确保索引在有效范围内
        idx = math.max(1, math.min(idx, k))
        -- 将 num 添加进桶
        table.insert(buckets[idx], num)
    end

    -- 2. 对各个桶执行排序
    for _, bucket in ipairs(buckets) do
        table.sort(bucket)
    end

    -- 3. 遍历桶合并结果
    local i = 1
    for _, bucket in ipairs(buckets) do
        for _, num in ipairs(bucket) do
            nums[i] = num
            i = i + 1
        end
    end
end

-- Driver Code
local function main()
    -- 设输入数据为浮点数，范围为 [0, 1)
    local nums = { 0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37 }
    bucket_sort(nums)
    print("桶排序完成后 nums = [" .. table.concat(nums, ", ") .. "]")
end

-- 执行主函数
main()
