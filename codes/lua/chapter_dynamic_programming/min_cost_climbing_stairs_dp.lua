-- @script min_cost_climbing_stairs_dp.lua
-- @date 2025-11-16
-- @author fisheryv (yue.fisher2025@gdhfi.com)

--- 爬楼梯最小代价：动态规划
--- @param cost table 楼梯代价列表，第一个元素为起始位置代价
--- @return integer 最小代价
local function min_cost_climbing_stairs_dp(cost)
    local n = #cost
    if n == 1 or n == 2 then
        return cost[n]
    end

    -- 初始化 dp 表，用于存储子问题的解
    local dp = {}
    for i = 1, n do
        dp[i] = 0
    end

    -- 初始状态：预设最小子问题的解
    dp[1] = cost[1]
    dp[2] = cost[2]

    -- 状态转移：从较小子问题逐步求解较大子问题
    for i = 3, n do
        dp[i] = math.min(dp[i - 1], dp[i - 2]) + cost[i]
    end

    return dp[n]
end

--- 爬楼梯最小代价：空间优化后的动态规划
--- @param cost table 楼梯代价列表，第一个元素为起始位置代价
--- @return integer 最小代价
local function min_cost_climbing_stairs_dp_comp(cost)
    local n = #cost
    if n == 1 or n == 2 then
        return cost[n]
    end

    local a, b = cost[1], cost[2]

    for i = 3, n do
        a, b = b, math.min(a, b) + cost[i]
    end

    return b
end

-- Driver Code
local function main()
    local cost = { 0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1 }
    print(string.format("输入楼梯的代价列表为 [%s]", table.concat(cost, ", ")))

    local res = min_cost_climbing_stairs_dp(cost)
    print(string.format("爬完楼梯的最低代价为 %d", res))

    res = min_cost_climbing_stairs_dp_comp(cost)
    print(string.format("爬完楼梯的最低代价为 %d", res))
end

-- 执行主函数
main()
