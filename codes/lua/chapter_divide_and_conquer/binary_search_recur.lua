-- @script binary_search_recur.lua
-- @date 2025-11-15
-- @author fisheryv (yue.fisher2025@gdhfi.com)

--- 二分查找：问题 f(i, j)
--- @param nums table 有序数组
--- @param target integer 目标值
--- @param i integer 区间起始索引
--- @param j integer 区间结束索引
--- @return integer 目标元素的索引，如果未找到则返回-1
--- @warning Lua table 索引从 1 开始
local function dfs(nums, target, i, j)
    -- 若区间为空，代表无目标元素，则返回 -1
    if i > j then
        return -1
    end

    -- 计算中点索引 m
    local m = math.floor((i + j) / 2)

    if nums[m] < target then
        -- 递归子问题 f(m+1, j)
        return dfs(nums, target, m + 1, j)
    elseif nums[m] > target then
        -- 递归子问题 f(i, m-1)
        return dfs(nums, target, i, m - 1)
    else
        -- 找到目标元素，返回其索引
        return m
    end
end

--- 二分查找
--- @param nums table 有序数组
--- @param target integer 目标值
--- @return integer 目标元素的索引，如果未找到则返回-1
--- @warning Lua table 索引从 1 开始
local function search(nums, target)
    local n = #nums
    -- 求解问题 f(1, n)
    return dfs(nums, target, 1, n)
end

-- Driver Code
local function main()
    local target = 6
    local nums = { 1, 3, 6, 8, 12, 15, 23, 26, 31, 35 }

    -- 二分查找（双闭区间）
    local index = search(nums, target) -- 注意：Lua 索引从 1 开始
    print("目标元素 6 的索引 = " .. tostring(index))
end

-- 执行主函数
main()
