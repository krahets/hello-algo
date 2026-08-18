-- @script min_path_sum.lua
-- @date 2025-11-16
-- @author fisheryv (yue.fisher2025@gdhfi.com)


--- 最小路径和：暴力搜索
--- @param grid table 二维网格
--- @param i integer 当前行索引
--- @param j integer 当前列索引
--- @return integer 最小路径和
local function min_path_sum_dfs(grid, i, j)
    -- 若为左上角单元格，则终止搜索
    if i == 0 and j == 0 then
        return grid[1][1] -- Lua数组索引从1开始
    end
    -- 若行列索引越界，则返回 +∞ 代价
    if i < 0 or j < 0 then
        return math.huge
    end
    -- 计算从左上角到 (i-1, j) 和 (i, j-1) 的最小路径代价
    local up = min_path_sum_dfs(grid, i - 1, j)
    local left = min_path_sum_dfs(grid, i, j - 1)
    -- 返回从左上角到 (i, j) 的最小路径代价
    return math.min(left, up) + grid[i + 1][j + 1] -- 调整索引
end

--- 最小路径和：记忆化搜索
--- @param grid table 二维网格
--- @param mem table 记忆化数组
--- @param i integer 当前行索引
--- @param j integer 当前列索引
--- @return integer 最小路径和
local function min_path_sum_dfs_mem(grid, mem, i, j)
    -- 若为左上角单元格，则终止搜索
    if i == 0 and j == 0 then
        return grid[1][1]
    end
    -- 若行列索引越界，则返回 +∞ 代价
    if i < 0 or j < 0 then
        return math.huge
    end
    -- 若已有记录，则直接返回
    if mem[i + 1][j + 1] ~= -1 then
        return mem[i + 1][j + 1]
    end
    -- 左边和上边单元格的最小路径代价
    local up = min_path_sum_dfs_mem(grid, mem, i - 1, j)
    local left = min_path_sum_dfs_mem(grid, mem, i, j - 1)
    -- 记录并返回左上角到 (i, j) 的最小路径代价
    mem[i + 1][j + 1] = math.min(left, up) + grid[i + 1][j + 1]
    return mem[i + 1][j + 1]
end

--- 最小路径和：动态规划
--- @param grid table 二维网格
--- @return integer 最小路径和
local function min_path_sum_dp(grid)
    local n, m = #grid, #grid[1]
    -- 初始化 dp 表
    local dp = {}
    for i = 1, n do
        dp[i] = {}
        for j = 1, m do
            dp[i][j] = 0
        end
    end
    dp[1][1] = grid[1][1]
    -- 状态转移：首行
    for j = 2, m do
        dp[1][j] = dp[1][j - 1] + grid[1][j]
    end
    -- 状态转移：首列
    for i = 2, n do
        dp[i][1] = dp[i - 1][1] + grid[i][1]
    end
    -- 状态转移：其余行和列
    for i = 2, n do
        for j = 2, m do
            dp[i][j] = math.min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j]
        end
    end
    return dp[n][m]
end

--- 最小路径和：空间优化后的动态规划
--- @param grid table 二维网格
--- @return integer 最小路径和
local function min_path_sum_dp_comp(grid)
    local n, m = #grid, #grid[1]
    -- 初始化 dp 表
    local dp = {}
    for j = 1, m do
        dp[j] = 0
    end
    -- 状态转移：首行
    dp[1] = grid[1][1]
    for j = 2, m do
        dp[j] = dp[j - 1] + grid[1][j]
    end
    -- 状态转移：其余行
    for i = 2, n do
        -- 状态转移：首列
        dp[1] = dp[1] + grid[i][1]
        -- 状态转移：其余列
        for j = 2, m do
            dp[j] = math.min(dp[j - 1], dp[j]) + grid[i][j]
        end
    end
    return dp[m]
end

-- Driver Code
local function main()
    local grid = {
        { 1, 3, 1, 5 },
        { 2, 2, 4, 2 },
        { 5, 3, 2, 1 },
        { 4, 3, 5, 2 }
    }
    local n, m = #grid, #grid[1]

    -- 暴力搜索
    local res = min_path_sum_dfs(grid, n - 1, m - 1)
    print(string.format("从左上角到右下角的最小路径和为 %d", res))

    -- 记忆化搜索
    local mem = {}
    for i = 1, n do
        mem[i] = {}
        for j = 1, m do
            mem[i][j] = -1
        end
    end
    res = min_path_sum_dfs_mem(grid, mem, n - 1, m - 1)
    print(string.format("从左上角到右下角的最小路径和为 %d", res))

    -- 动态规划
    res = min_path_sum_dp(grid)
    print(string.format("从左上角到右下角的最小路径和为 %d", res))

    -- 空间优化后的动态规划
    res = min_path_sum_dp_comp(grid)
    print(string.format("从左上角到右下角的最小路径和为 %d", res))
end

-- 执行主函数
main()
