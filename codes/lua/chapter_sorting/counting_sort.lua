-- @script counting_sort.lua
-- @date 2025-11-15
-- @author fisheryv (yue.fisher2025@gdhfi.com)

--- 计数排序的简单实现（无法用于排序对象）
--- @param nums table 待排序数组
local function counting_sort_naive(nums)
    -- 1. 统计数组最大元素 m
    local m = 0
    for i = 1, #nums do
        if nums[i] > m then
            m = nums[i]
        end
    end

    -- 2. 统计各数字的出现次数
    -- counter[num] 代表 num 的出现次数
    local counter = {}
    for i = 0, m do
        counter[i] = 0
    end

    for i = 1, #nums do
        local num = nums[i]
        counter[num] = counter[num] + 1
    end

    -- 3. 遍历 counter ，将各元素填入原数组 nums
    local i = 1
    for num = 0, m do
        for _ = 1, counter[num] do
            nums[i] = num
            i = i + 1
        end
    end
end

--- 计数排序（完整实现，可排序对象，并且是稳定排序）
--- @param nums table 待排序数组
local function counting_sort(nums)
    -- 1. 统计数组最大元素 m
    local m = 0
    for i = 1, #nums do
        if nums[i] > m then
            m = nums[i]
        end
    end

    -- 2. 统计各数字的出现次数
    -- counter[num] 代表 num 的出现次数
    local counter = {}
    for i = 0, m do
        counter[i] = 0
    end

    for i = 1, #nums do
        local num = nums[i]
        counter[num] = counter[num] + 1
    end

    -- 3. 求 counter 的前缀和，将"出现次数"转换为"尾索引"
    -- 即 counter[num]-1 是 num 在 res 中最后一次出现的索引
    for i = 0, m - 1 do
        counter[i + 1] = counter[i + 1] + counter[i]
    end

    -- 4. 倒序遍历 nums ，将各元素填入结果数组 res
    -- 初始化数组 res 用于记录结果
    local n = #nums
    local res = {}
    for i = 1, n do
        res[i] = 0
    end

    for i = n, 1, -1 do
        local num = nums[i]
        res[counter[num]] = num         -- 将 num 放置到对应索引处
        counter[num] = counter[num] - 1 -- 令前缀和自减 1 ，得到下次放置 num 的索引
    end

    -- 使用结果数组 res 覆盖原数组 nums
    for i = 1, n do
        nums[i] = res[i]
    end
end

-- Driver Code
local function main()
    local nums = { 1, 0, 1, 2, 0, 4, 0, 2, 2, 4 }

    counting_sort_naive(nums)
    print("计数排序（无法排序对象）完成后 nums = [" .. table.concat(nums, ", ") .. "]")

    local nums1 = { 1, 0, 1, 2, 0, 4, 0, 2, 2, 4 }
    counting_sort(nums1)
    print("计数排序完成后 nums1 = [" .. table.concat(nums1, ", ") .. "]")
end

-- 执行主函数
main()
