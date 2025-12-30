-- @script binary_search_insertion.lua
-- @date 2025-11-15
-- @author fisheryv (yue.fisher2025@gdhfi.com)

--- 二分查找插入点（无重复元素）
--- @param nums table 有序数组（无重复元素）
--- @param target integer 目标值
--- @return integer 插入点索引
--- @warning Lua table 索引从 1 开始
local function binary_search_insertion_simple(nums, target)
    local i, j = 1, #nums                 -- 初始化双闭区间 [1, n]
    while i <= j do
        local m = math.floor((i + j) / 2) -- 计算中点索引 m
        if nums[m] < target then
            i = m + 1                     -- target 在区间 [m+1, j] 中
        elseif nums[m] > target then
            j = m - 1                     -- target 在区间 [i, m-1] 中
        else
            return m                      -- 找到 target ，返回插入点 m
        end
    end
    -- 未找到 target ，返回插入点 i
    return i
end

--- 二分查找插入点（存在重复元素）
--- @param nums table 有序数组（可能包含重复元素）
--- @param target integer 目标值
--- @return integer 插入点索引
--- @warning Lua table 索引从 1 开始
local function binary_search_insertion(nums, target)
    local i, j = 1, #nums                 -- 初始化双闭区间 [1, n]
    while i <= j do
        local m = math.floor((i + j) / 2) -- 计算中点索引 m
        if nums[m] < target then
            i = m + 1                     -- target 在区间 [m+1, j] 中
        elseif nums[m] > target then
            j = m - 1                     -- target 在区间 [i, m-1] 中
        else
            j = m - 1                     -- 首个小于 target 的元素在区间 [i, m-1] 中
        end
    end
    -- 返回插入点 i
    return i
end

-- Driver Code
local function main()
    -- 无重复元素的数组
    local nums1 = { 1, 3, 6, 8, 12, 15, 23, 26, 31, 35 }
    print(string.format("\n数组 nums = [%s]", table.concat(nums1, ", ")))

    -- 二分查找插入点
    for _, target in ipairs({ 6, 9 }) do
        local index = binary_search_insertion_simple(nums1, target)
        print(string.format("元素 %d 的插入点的索引为 %d", target, index))
    end

    -- 包含重复元素的数组
    local nums2 = { 1, 3, 6, 6, 6, 6, 6, 10, 12, 15 }
    print(string.format("\n数组 nums = [%s]", table.concat(nums2, ", ")))

    -- 二分查找插入点
    for _, target in ipairs({ 2, 6, 20 }) do
        local index = binary_search_insertion(nums2, target)
        print(string.format("元素 %d 的插入点的索引为 %d", target, index))
    end
end


if ... then
    -- 被 require 作为模块加载
    return binary_search_insertion
else
    -- 执行主函数
    main()
end
