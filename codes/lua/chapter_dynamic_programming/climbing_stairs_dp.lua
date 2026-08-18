-- @script climbing_stairs_dp.lua
-- @date 2025-11-16
-- @author fisheryv (yue.fisher2025@gdhfi.com)

--- 爬楼梯：动态规划
--- @param n integer 楼梯阶数
--- @return integer 爬楼梯的方案数
local function climbing_stairs_dp(n)
    if n == 1 or n == 2 then
        return n
    end

    -- 初始化 dp 表，用于存储子问题的解
    local dp = {}
    for i = 1, n + 1 do
        dp[i] = 0
    end

    -- 初始状态：预设最小子问题的解
    dp[1] = 1
    dp[2] = 2

    -- 状态转移：从较小子问题逐步求解较大子问题
    for i = 3, n do
        dp[i] = dp[i - 1] + dp[i - 2]
    end

    return dp[n]
end

--- 爬楼梯：空间优化后的动态规划
--- @param n integer 楼梯阶数
--- @return integer 爬楼梯的方案数
local function climbing_stairs_dp_comp(n)
    if n == 1 or n == 2 then
        return n
    end

    local a, b = 1, 2

    for _ = 3, n do
        a, b = b, a + b
    end

    return b
end

-- Driver Code
local function main()
    local n = 9

    local res = climbing_stairs_dp(n)
    print(string.format("爬 %d 阶楼梯共有 %d 种方案", n, res))

    res = climbing_stairs_dp_comp(n)
    print(string.format("爬 %d 阶楼梯共有 %d 种方案", n, res))
end

-- 执行主函数
main()
