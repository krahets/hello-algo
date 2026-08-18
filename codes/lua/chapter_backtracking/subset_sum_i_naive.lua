-- @script subset_sum_i_naive.lua
-- @date 2025-11-15
-- @author fisheryv (yue.fisher2025@gdhfi.com)

--- 回溯算法：子集和 I
--- @param state table 当前状态（子集）
--- @param target integer 目标值
--- @param total integer 当前子集和
--- @param choices table 可选数字列表
--- @param res table 结果列表
local function backtrack(state, target, total, choices, res)
    -- 子集和等于 target 时，记录解
    if total == target then
        local solution = {}
        for i = 1, #state do
            solution[i] = state[i]
        end
        table.insert(res, solution)
        return
    end

    -- 遍历所有选择
    for i = 1, #choices do
        -- 剪枝：若子集和超过 target ，则跳过该选择
        if total + choices[i] > target then
            -- Lua 没有 continue 关键字，改用if-else结构
        else
            -- 尝试：做出选择，更新元素和 total
            table.insert(state, choices[i])

            -- 进行下一轮选择
            backtrack(state, target, total + choices[i], choices, res)

            -- 回退：撤销选择，恢复到之前的状态
            table.remove(state)
        end
    end
end

--- 求解子集和 I（包含重复子集）
--- @param nums table 输入数组
--- @param target integer 目标值
--- @return table 所有和等于 target 的子集
local function subset_sum_i_naive(nums, target)
    local state = {} -- 状态（子集）
    local total = 0  -- 子集和
    local res = {}   -- 结果列表（子集列表）
    backtrack(state, target, total, nums, res)
    return res
end

-- Driver Code
local function main()
    local nums = { 3, 4, 5 }
    local target = 9
    local res = subset_sum_i_naive(nums, target)

    print(string.format("输入数组 nums = [%s], target = %d", table.concat(nums, ", "), target))
    print(string.format("所有和等于 %d 的子集 res: [", target))

    for _, subset in ipairs(res) do
        print(string.format("  [%s],", table.concat(subset, ", ")))
    end
    print("]")

    print("请注意，该方法输出的结果包含重复集合")
end

-- 执行主函数
main()
