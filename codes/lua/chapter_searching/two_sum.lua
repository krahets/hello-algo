-- @script two_sum.lua
-- @date 2025-11-15
-- @author fisheryv (yue.fisher2025@gdhfi.com)

--- 方法一：暴力枚举
--- 通过两层循环遍历所有可能的组合
--- @param nums table 输入的数字数组
--- @param target integer 目标值
--- @return table 两个数字的索引组成的数组，如果不存在则返回空表
--- @warning Lua table 索引从 1 开始
local function two_sum_brute_force(nums, target)
    -- 两层循环，时间复杂度为 O(n^2)
    for i = 1, #nums - 1 do
        for j = i + 1, #nums do
            if nums[i] + nums[j] == target then
                return { i, j } -- 注意：Lua索引从 1 开始
            end
        end
    end
    return {}
end

--- 方法二：辅助哈希表
--- 使用哈希表存储遍历过的数字及其索引
--- @param nums table 输入的数字数组
--- @param target integer 目标值
--- @return table 两个数字的索引组成的数组，如果不存在则返回空表
local function two_sum_hash_table(nums, target)
    -- 辅助哈希表，空间复杂度为 O(n)
    local dic = {}
    -- 单层循环，时间复杂度为 O(n)
    for i = 1, #nums do
        local complement = target - nums[i]
        if dic[complement] then
            return { dic[complement], i } -- 注意：Lua索引从 1 开始
        end
        dic[nums[i]] = i
    end
    return {}
end

-- Driver Code
local function main()
    -- ======= Test Case =======
    local nums = { 2, 7, 11, 15 }
    local target = 13

    -- ====== Driver Code ======
    -- 方法一
    local res = two_sum_brute_force(nums, target)
    print("方法一 res = [" .. table.concat(res, ", ") .. "]")

    -- 方法二
    res = two_sum_hash_table(nums, target)
    print("方法二 res = [" .. table.concat(res, ", ") .. "]")
end

-- 执行主函数
main()
