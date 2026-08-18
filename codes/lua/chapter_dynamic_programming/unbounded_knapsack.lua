-- @script unbounded_knapsack.lua
-- @date 2025-11-16
-- @author fisheryv (yue.fisher2025@gdhfi.com)


--- 完全背包：动态规划
--- @param wgt table 物品重量列表
--- @param val table 物品价值列表
--- @param cap number 背包容量
--- @return number 最大价值
local function unbounded_knapsack_dp(wgt, val, cap)
    local n = #wgt
    -- 初始化 dp 表
    local dp = {}
    for i = 1, n + 1 do
        dp[i] = {}
        for j = 1, cap + 1 do
            dp[i][j] = 0
        end
    end

    -- 状态转移
    for i = 1, n do
        for c = 1, cap do
            if wgt[i] > c then
                -- 若超过背包容量，则不选物品 i
                dp[i + 1][c + 1] = dp[i][c + 1]
            else
                -- 不选和选物品 i 这两种方案的较大值
                dp[i + 1][c + 1] = math.max(
                    dp[i][c + 1],
                    dp[i + 1][c + 1 - wgt[i]] + val[i]
                )
            end
        end
    end

    return dp[n + 1][cap + 1]
end

--- 完全背包：空间优化后的动态规划
--- @param wgt table 物品重量列表
--- @param val table 物品价值列表
--- @param cap number 背包容量
--- @return number 最大价值
local function unbounded_knapsack_dp_comp(wgt, val, cap)
    local n = #wgt
    -- 初始化 dp 表
    local dp = {}
    for i = 1, cap + 1 do
        dp[i] = 0
    end

    -- 状态转移
    for i = 1, n do
        -- 正序遍历
        for c = 1, cap do
            if wgt[i] <= c then
                -- 不选和选物品 i 这两种方案的较大值
                dp[c + 1] = math.max(
                    dp[c + 1],
                    dp[c + 1 - wgt[i]] + val[i]
                )
            end
            -- 如果超过背包容量，dp[c]保持不变，无需额外操作
        end
    end

    return dp[cap + 1]
end

-- Driver Code
local function main()
    local wgt = { 1, 2, 3 }
    local val = { 5, 11, 15 }
    local cap = 4

    -- 动态规划
    local res = unbounded_knapsack_dp(wgt, val, cap)
    print(string.format("不超过背包容量的最大物品价值为 %d", res))

    -- 空间优化后的动态规划
    res = unbounded_knapsack_dp_comp(wgt, val, cap)
    print(string.format("不超过背包容量的最大物品价值为 %d", res))
end

-- 执行主函数
main()
