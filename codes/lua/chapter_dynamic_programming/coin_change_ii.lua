-- @script coin_change_ii.lua
-- @date 2025-11-16
-- @author fisheryv (yue.fisher2025@gdhfi.com)

--- 零钱兑换 II：动态规划
--- @param coins table 可用的硬币面值列表
--- @param amt integer 目标金额
--- @return integer 组合数量
local function coin_change_ii_dp(coins, amt)
    local n = #coins
    -- 初始化 dp 表
    local dp = {}
    for i = 1, n + 1 do
        dp[i] = {}
        for j = 1, amt + 1 do
            dp[i][j] = 0
        end
    end

    -- 初始化首列
    for i = 1, n + 1 do
        dp[i][1] = 1
    end

    -- 状态转移
    for i = 2, n + 1 do
        for a = 2, amt + 1 do
            local current_coin = coins[i - 1]
            local current_amount = a - 1 -- 转换为实际金额（索引从1开始）

            if current_coin > current_amount then
                -- 若超过目标金额，则不选硬币 i
                dp[i][a] = dp[i - 1][a]
            else
                -- 不选和选硬币 i 这两种方案之和
                dp[i][a] = dp[i - 1][a] + dp[i][a - current_coin]
            end
        end
    end

    return dp[n + 1][amt + 1]
end

--- 零钱兑换 II：空间优化后的动态规划
--- @param coins table 可用的硬币面值列表
--- @param amt integer 目标金额
--- @return integer 组合数量
local function coin_change_ii_dp_comp(coins, amt)
    local n = #coins
    -- 初始化 dp 表
    local dp = {}
    for i = 1, amt + 1 do
        dp[i] = 0
    end
    dp[1] = 1 -- 对应金额0的情况

    -- 状态转移
    for i = 1, n do
        for a = 2, amt + 1 do
            local current_coin = coins[i]
            local current_amount = a - 1 -- 转换为实际金额（索引从1开始）

            if current_coin <= current_amount then
                -- 不选和选硬币 i 这两种方案之和
                dp[a] = dp[a] + dp[a - current_coin]
            end
            -- 如果硬币金额大于当前金额，dp[a]保持不变
        end
    end

    return dp[amt + 1]
end

-- Driver Code
local function main()
    local coins = { 1, 2, 5 }
    local amt = 5

    -- 动态规划
    local res = coin_change_ii_dp(coins, amt)
    print(string.format("凑出目标金额的硬币组合数量为 %d", res))

    -- 空间优化后的动态规划
    res = coin_change_ii_dp_comp(coins, amt)
    print(string.format("凑出目标金额的硬币组合数量为 %d", res))
end

-- 执行主程序
main()
