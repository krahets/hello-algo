-- @script knapsack.lua
-- @date 2025-11-16
-- @author fisheryv (yue.fisher2025@gdhfi.com)

--- 0-1 背包：暴力搜索
--- @param wgt table  物品重量列表
--- @param val table 物品价值列表
--- @param i integer 当前考虑的物品索引
--- @param c integer 背包剩余容量
--- @return integer 最大价值
local function knapsack_dfs(wgt, val, i, c)
    -- 若已选完所有物品或背包无剩余容量，则返回价值 0
    if i == 0 or c == 0 then
        return 0
    end

    -- 若超过背包容量，则只能选择不放入背包
    if wgt[i] > c then
        return knapsack_dfs(wgt, val, i - 1, c)
    end

    -- 计算不放入和放入物品 i 的最大价值
    local no = knapsack_dfs(wgt, val, i - 1, c)
    local yes = knapsack_dfs(wgt, val, i - 1, c - wgt[i]) + val[i]

    -- 返回两种方案中价值更大的那一个
    return math.max(no, yes)
end

--- 0-1 背包：记忆化搜索
--- @param wgt table 物品重量列表
--- @param val table 物品价值列表
--- @param mem table 记忆化表格
--- @param i integer 当前考虑的物品索引
--- @param c integer 背包剩余容量
--- @return integer 最大价值
local function knapsack_dfs_mem(wgt, val, mem, i, c)
    -- 若已选完所有物品或背包无剩余容量，则返回价值 0
    if i == 0 or c == 0 then
        return 0
    end

    -- 若已有记录，则直接返回
    if mem[i][c] ~= -1 then
        return mem[i][c]
    end

    -- 若超过背包容量，则只能选择不放入背包
    if wgt[i] > c then
        mem[i][c] = knapsack_dfs_mem(wgt, val, mem, i - 1, c)
        return mem[i][c]
    end

    -- 计算不放入和放入物品 i 的最大价值
    local no = knapsack_dfs_mem(wgt, val, mem, i - 1, c)
    local yes = knapsack_dfs_mem(wgt, val, mem, i - 1, c - wgt[i]) + val[i]

    -- 记录并返回两种方案中价值更大的那一个
    mem[i][c] = math.max(no, yes)
    return mem[i][c]
end

--- 0-1 背包：动态规划
--- @param wgt table 物品重量列表
--- @param val table 物品价值列表
--- @param cap integer 背包容量
--- @return integer 最大价值
local function knapsack_dp(wgt, val, cap)
    local n = #wgt
    -- 初始化 dp 表
    local dp = {}
    for i = 0, n do
        dp[i] = {}
        for j = 0, cap do
            dp[i][j] = 0
        end
    end

    -- 状态转移
    for i = 1, n do
        for c = 1, cap do
            if wgt[i] > c then
                -- 若超过背包容量，则不选物品 i
                dp[i][c] = dp[i - 1][c]
            else
                -- 不选和选物品 i 这两种方案的较大值
                dp[i][c] = math.max(dp[i - 1][c], dp[i - 1][c - wgt[i]] + val[i])
            end
        end
    end

    return dp[n][cap]
end

--- 0-1 背包：空间优化后的动态规划
--- @param wgt table 物品重量列表
--- @param val table 物品价值列表
--- @param cap integer 背包容量
--- @return integer 最大价值
local function knapsack_dp_comp(wgt, val, cap)
    local n = #wgt
    -- 初始化 dp 表
    local dp = {}
    for i = 0, cap do
        dp[i] = 0
    end

    -- 状态转移
    for i = 1, n do
        -- 倒序遍历
        for c = cap, 1, -1 do
            if wgt[i] <= c then
                -- 不选和选物品 i 这两种方案的较大值
                dp[c] = math.max(dp[c], dp[c - wgt[i]] + val[i])
            end
        end
    end

    return dp[cap]
end

-- Driver Code
local function main()
    local wgt = { 10, 20, 30, 40, 50 }
    local val = { 50, 120, 150, 210, 240 }
    local cap = 50
    local n = #wgt

    -- 暴力搜索
    local res = knapsack_dfs(wgt, val, n, cap)
    print(string.format("不超过背包容量的最大物品价值为 %d", res))

    -- 记忆化搜索
    local mem = {}
    for i = 0, n do
        mem[i] = {}
        for j = 0, cap do
            mem[i][j] = -1
        end
    end
    res = knapsack_dfs_mem(wgt, val, mem, n, cap)
    print(string.format("不超过背包容量的最大物品价值为 %d", res))

    -- 动态规划
    res = knapsack_dp(wgt, val, cap)
    print(string.format("不超过背包容量的最大物品价值为 %d", res))

    -- 空间优化后的动态规划
    res = knapsack_dp_comp(wgt, val, cap)
    print(string.format("不超过背包容量的最大物品价值为 %d", res))
end

-- 执行测试代码
main()
