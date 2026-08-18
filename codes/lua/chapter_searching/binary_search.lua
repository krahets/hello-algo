-- @script binary_search.lua
-- @date 2025-11-15
-- @author fisheryv (yue.fisher2025@gdhfi.com)


--- 二分查找（双闭区间）
--- @param nums table 有序数组
--- @param target integer 目标值
--- @return integer 目标值在数组中的索引，如果不存在则返回-1
--- @warning 注意 Lua table 索引从 1 开始
local function binary_search(nums, target)
    -- 初始化双闭区间 [0, n-1]，即 i, j 分别指向数组首元素、尾元素
    local i, j = 1, #nums
    -- 循环，当搜索区间为空时跳出（当 i > j 时为空）
    while i <= j do
        -- 计算中点索引 m，防止大数越界
        local m = math.floor(i + (j - i) / 2)
        if nums[m] < target then
            i = m + 1 -- 此情况说明 target 在区间 [m+1, j] 中
        elseif nums[m] > target then
            j = m - 1 -- 此情况说明 target 在区间 [i, m-1] 中
        else
            return m  -- 找到目标元素，返回其索引
        end
    end
    return -1 -- 未找到目标元素，返回 -1
end

--- 二分查找（左闭右开区间）
--- @param nums table 有序数组
--- @param target integer 目标值
--- @return integer 目标值在数组中的索引，如果不存在则返回-1
--- @warning 注意 Lua table 索引从 1 开始
local function binary_search_lcro(nums, target)
    -- 初始化左闭右开区间 [1, n+1)，即 i, j 分别指向数组首元素、尾元素+1
    local i, j = 1, #nums + 1
    -- 循环，当搜索区间为空时跳出（当 i = j 时为空）
    while i < j do
        -- 计算中点索引 m，防止大数越界
        local m = math.floor(i + (j - i) / 2)
        if nums[m] < target then
            i = m + 1 -- 此情况说明 target 在区间 [m+1, j) 中
        elseif nums[m] > target then
            j = m     -- 此情况说明 target 在区间 [i, m) 中
        else
            return m  -- 找到目标元素，返回其索引
        end
    end
    return -1 -- 未找到目标元素，返回 -1
end

-- Driver Code
local function main()
    local target = 6
    local nums = { 1, 3, 6, 8, 12, 15, 23, 26, 31, 35 }

    -- 二分查找（双闭区间）
    local index = binary_search(nums, target)
    print("目标元素 6 的索引 = " .. index)

    -- 二分查找（左闭右开区间）
    index = binary_search_lcro(nums, target)
    print("目标元素 6 的索引 = " .. index)
end

-- 执行主函数
main()
