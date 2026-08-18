-- @script subset_sum_ii.lua
-- @date 2025-11-15
-- @author fisheryv (yue.fisher2025@gdhfi.com)

--- 回溯算法：子集和 II
--- @param state table 当前状态（子集）
--- @param target number 目标和
--- @param choices table 候选数字列表
--- @param start number 遍历起始位置
--- @param res table 结果列表
local function backtrack(state, target, choices, start, res)
    -- 子集和等于 target 时，记录解
    if target == 0 then
        -- 创建当前状态的副本并添加到结果中
        local state_copy = {}
        for i = 1, #state do
            state_copy[i] = state[i]
        end
        table.insert(res, state_copy)
        return
    end

    -- 遍历所有选择
    -- 剪枝二：从 start 开始遍历，避免生成重复子集
    -- 剪枝三：从 start 开始遍历，避免重复选择同一元素
    for i = start, #choices do
        -- 剪枝一：若子集和超过 target ，则直接结束循环
        -- 这是因为数组已排序，后边元素更大，子集和一定超过 target
        if target - choices[i] < 0 then
            break
        end

        -- 剪枝四：如果该元素与左边元素相等，说明该搜索分支重复，直接跳过
        if i > start and choices[i] == choices[i - 1] then
            -- Lua 没有 continue 关键字，改用if-else结构
        else
            -- 尝试：做出选择，更新 target, start
            table.insert(state, choices[i])
            -- 进行下一轮选择
            backtrack(state, target - choices[i], choices, i + 1, res)
            -- 回退：撤销选择，恢复到之前的状态
            table.remove(state)
        end
    end
end

--- 求解子集和 II
--- @param nums table 输入数字列表
--- @param target number 目标和
--- @return table 所有和等于目标的子集列表
local function subset_sum_ii(nums, target)
    local state = {} -- 状态（子集）
    table.sort(nums) -- 对 nums 进行排序
    local start = 1  -- 遍历起始点（Lua索引从1开始）
    local res = {}   -- 结果列表（子集列表）
    backtrack(state, target, nums, start, res)
    return res
end

-- Driver Code
local function main()
    local nums = { 4, 4, 5 }
    local target = 9
    local res = subset_sum_ii(nums, target)

    print(string.format("输入数组 nums = [%s], target = %d", table.concat(nums, ", "), target))
    print(string.format("所有和等于 %d 的子集 res = [", target))
    for _, subset in ipairs(res) do
        print(string.format("  [%s],", table.concat(subset, ", ")))
    end
    print("]")
end

-- 执行主函数
main()
