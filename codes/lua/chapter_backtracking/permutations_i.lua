-- @script permutations_i.lua
-- @date 2025-11-15
-- @author fisheryv (yue.fisher2025@gdhfi.com)

--- 回溯算法：全排列 I
--- @param state table 当前状态
--- @param choices table 所有可选元素
--- @param selected table 元素是否已被选择
--- @param res table 存储所有结果的表
local function backtrack(state, choices, selected, res)
    -- 当状态长度等于元素数量时，记录解
    if #state == #choices then
        -- 创建当前状态的副本并添加到结果中
        local state_copy = {}
        for i, v in ipairs(state) do
            state_copy[i] = v
        end
        table.insert(res, state_copy)
        return
    end

    -- 遍历所有选择
    for i, choice in ipairs(choices) do
        -- 剪枝：不允许重复选择元素
        if not selected[i] then
            -- 尝试：做出选择，更新状态
            selected[i] = true
            table.insert(state, choice)

            -- 进行下一轮选择
            backtrack(state, choices, selected, res)

            -- 回退：撤销选择，恢复到之前的状态
            selected[i] = false
            table.remove(state)
        end
    end
end

--- 全排列 I
--- @param nums table 输入数组
--- @return table 所有排列的结果
local function permutations_i(nums)
    local res = {}
    local selected = {}

    -- 初始化selected表
    for i = 1, #nums do
        selected[i] = false
    end

    backtrack({}, nums, selected, res)
    return res
end

-- Driver Code
local function main()
    local nums = { 1, 2, 3 }
    local res = permutations_i(nums)

    print(string.format("输入数组 nums = [%s]", table.concat(nums, ", ")))
    print("所有排列 res: [")
    for _, permutation in ipairs(res) do
        print(string.format("  [%s],", table.concat(permutation, ", ")))
    end
    print("]")
end

-- 执行主函数
main()
