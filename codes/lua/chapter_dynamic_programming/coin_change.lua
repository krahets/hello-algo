-- @script coin_change.lua
-- @date 2025-11-16
-- @author fisheryv (yue.fisher2025@gdhfi.com)

--- 零钱兑换：动态规划
--- @param coins table 可用的硬币面值列表
--- @param amt integer 目标金额
--- @return integer 凑齐目标金额所需的最少硬币数，如果无法凑齐则返回-1
local function coin_change_dp(coins, amt)
    local n = #coins
    local MAX = amt + 1

    -- 初始化 dp 表
    local dp = {}
    for i = 1, n + 1 do
        dp[i] = {}
        for j = 1, amt + 1 do
            dp[i][j] = 0
        end
    end

    -- 状态转移：首行首列
    for a = 2, amt + 1 do
        dp[1][a] = MAX
    end

    -- 状态转移：其余行和列
    for i = 2, n + 1 do
        for a = 2, amt + 1 do
            if coins[i - 1] > a - 1 then
                -- 若超过目标金额，则不选硬币 i
                dp[i][a] = dp[i - 1][a]
            else
                -- 不选和选硬币 i 这两种方案的较小值
                dp[i][a] = math.min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1)
            end
        end
    end

    return dp[n + 1][amt + 1] ~= MAX and dp[n + 1][amt + 1] or -1
end

--- 零钱兑换：空间优化后的动态规划
--- @param coins table 可用的硬币面值列表
--- @param amt integer 目标金额
--- @return integer 凑齐目标金额所需的最少硬币数，如果无法凑齐则返回-1
local function coin_change_dp_comp(coins, amt)
    local n = #coins
    local MAX = amt + 1

    -- 初始化 dp 表
    local dp = {}
    for i = 1, amt + 1 do
        dp[i] = MAX
    end
    dp[1] = 0 -- 金额0需要0个硬币

    -- 状态转移
    for i = 1, n do
        -- 正序遍历
        for a = 2, amt + 1 do
            if coins[i] <= a - 1 then
                -- 不选和选硬币 i 这两种方案的较小值
                dp[a] = math.min(dp[a], dp[a - coins[i]] + 1)
            end
            -- 若超过目标金额，dp[a]保持不变（相当于不选硬币i）
        end
    end

    return dp[amt + 1] ~= MAX and dp[amt + 1] or -1
end

-- Driver Code
local function main()
    local coins = { 1, 2, 5 }
    local amt = 4

    -- 动态规划
    local res = coin_change_dp(coins, amt)
    print(string.format("凑到目标金额所需的最少硬币数量为 %d", res))

    -- 空间优化后的动态规划
    res = coin_change_dp_comp(coins, amt)
    print(string.format("凑到目标金额所需的最少硬币数量为 %d", res))
end

-- 执行主函数
main()
