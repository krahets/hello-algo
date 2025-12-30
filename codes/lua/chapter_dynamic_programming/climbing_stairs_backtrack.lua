-- @script climbing_stairs_backtrack.lua
-- @date 2025-11-16
-- @author fisheryv (yue.fisher2025@gdhfi.com)

--- 回溯算法
--- @param choices table 可选择的步长列表
--- @param state integer 当前所在阶梯
--- @param n integer 目标阶梯数
--- @param res table 结果计数器（使用表传递以支持修改）
local function backtrack(choices, state, n, res)
    -- 当爬到第 n 阶时，方案数量加 1
    if state == n then
        res[1] = res[1] + 1
        return
    end

    -- 遍历所有选择
    for _, choice in ipairs(choices) do
        -- 剪枝：不允许越过第 n 阶
        if state + choice <= n then
            -- 尝试：做出选择，更新状态
            backtrack(choices, state + choice, n, res)
            -- 回退（在Lua中不需要显式回退，参数是按值传递的）
        end
    end
end

--- 爬楼梯：回溯算法
--- @param n integer 楼梯阶数
--- @return integer 爬楼梯的方案数量
local function climbing_stairs_backtrack(n)
    local choices = { 1, 2 } -- 可选择向上爬 1 阶或 2 阶
    local state = 0          -- 从第 0 阶开始爬
    local res = { 0 }        -- 使用 res[1] 记录方案数量

    backtrack(choices, state, n, res)
    return res[1]
end

-- Driver Code
local function main()
    local n = 9
    local res = climbing_stairs_backtrack(n)
    print(string.format("爬 %d 阶楼梯共有 %d 种方案", n, res))
end

-- 执行主函数
main()
