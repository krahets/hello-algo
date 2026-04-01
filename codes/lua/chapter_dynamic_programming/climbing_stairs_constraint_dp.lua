-- @script climbing_stairs_constraint_dp.lua
-- @date 2025-11-16
-- @author fisheryv (yue.fisher2025@gdhfi.com)

--- 带约束爬楼梯：动态规划
--- @param n integer 楼梯的阶数
--- @return integer 爬楼梯的方案总数
local function climbing_stairs_constraint_dp(n)
    -- 基础情况处理
    if n == 1 or n == 2 then
        return 1
    end

    -- 初始化动态规划表
    -- dp[i][1] 表示到达第i阶且最后一步是1阶的方案数
    -- dp[i][2] 表示到达第i阶且最后一步是2阶的方案数
    local dp = {}
    for i = 1, n + 1 do
        dp[i] = { 0, 0 }
    end

    -- 设置初始状态
    dp[1][1], dp[1][2] = 1, 0 -- 第1阶：只能1步到达
    dp[2][1], dp[2][2] = 0, 1 -- 第2阶：只能2步到达

    -- 状态转移：从较小问题逐步求解较大问题
    for i = 3, n do
        -- 最后一步是1阶：前一步必须是2阶（不能连续两次1阶）
        dp[i][1] = dp[i - 1][2]
        -- 最后一步是2阶：可以从i-2阶通过1阶或2阶到达
        dp[i][2] = dp[i - 2][1] + dp[i - 2][2]
    end

    -- 返回总方案数：到达第n阶的所有可能方式
    return dp[n][1] + dp[n][2]
end

-- Driver Code
local function main()
    local n = 9
    local res = climbing_stairs_constraint_dp(n)
    print(string.format("爬 %d 阶楼梯共有 %d 种方案", n, res))
end

-- 执行主程序
main()
