-- @script edit_distance.lua
-- @date 2025-11-16
-- @author fisheryv (yue.fisher2025@gdhfi.com)

--- 编辑距离：暴力搜索
--- @param s string 源字符串
--- @param t string 目标字符串
--- @param i integer 源字符串当前处理位置
--- @param j integer 目标字符串当前处理位置
--- @return integer 编辑距离
local function edit_distance_dfs(s, t, i, j)
    -- 若 s 和 t 都为空，则返回 0
    if i == 0 and j == 0 then
        return 0
    end

    -- 若 s 为空，则返回 t 长度
    if i == 0 then
        return j
    end

    -- 若 t 为空，则返回 s 长度
    if j == 0 then
        return i
    end

    -- 若两字符相等，则直接跳过此两字符
    if s:sub(i, i) == t:sub(j, j) then
        return edit_distance_dfs(s, t, i - 1, j - 1)
    end

    -- 最少编辑步数 = 插入、删除、替换这三种操作的最少编辑步数 + 1
    local insert_cost = edit_distance_dfs(s, t, i, j - 1)
    local delete_cost = edit_distance_dfs(s, t, i - 1, j)
    local replace_cost = edit_distance_dfs(s, t, i - 1, j - 1)

    -- 返回最少编辑步数
    return math.min(insert_cost, delete_cost, replace_cost) + 1
end

--- 编辑距离：记忆化搜索
--- @param s string 源字符串
--- @param t string 目标字符串
--- @param mem table 记忆化表格
--- @param i integer 源字符串当前处理位置
--- @param j integer 目标字符串当前处理位置
--- @return integer 编辑距离
local function edit_distance_dfs_mem(s, t, mem, i, j)
    -- 若 s 和 t 都为空，则返回 0
    if i == 0 and j == 0 then
        return 0
    end

    -- 若 s 为空，则返回 t 长度
    if i == 0 then
        return j
    end

    -- 若 t 为空，则返回 s 长度
    if j == 0 then
        return i
    end

    -- 若已有记录，则直接返回之
    if mem[i][j] ~= -1 then
        return mem[i][j]
    end

    -- 若两字符相等，则直接跳过此两字符
    if s:sub(i, i) == t:sub(j, j) then
        mem[i][j] = edit_distance_dfs_mem(s, t, mem, i - 1, j - 1)
        return mem[i][j]
    end

    -- 最少编辑步数 = 插入、删除、替换这三种操作的最少编辑步数 + 1
    local insert_cost = edit_distance_dfs_mem(s, t, mem, i, j - 1)
    local delete_cost = edit_distance_dfs_mem(s, t, mem, i - 1, j)
    local replace_cost = edit_distance_dfs_mem(s, t, mem, i - 1, j - 1)

    -- 记录并返回最少编辑步数
    mem[i][j] = math.min(insert_cost, delete_cost, replace_cost) + 1
    return mem[i][j]
end

--- 编辑距离：动态规划
--- @param s string 源字符串
--- @param t string 目标字符串
--- @return integer 编辑距离
local function edit_distance_dp(s, t)
    local n, m = #s, #t
    local dp = {}

    -- 初始化DP表
    for i = 0, n do
        dp[i] = {}
        for j = 0, m do
            dp[i][j] = 0
        end
    end

    -- 状态转移：首行首列
    for i = 1, n do
        dp[i][0] = i
    end

    for j = 1, m do
        dp[0][j] = j
    end

    -- 状态转移：其余行和列
    for i = 1, n do
        for j = 1, m do
            if s:sub(i, i) == t:sub(j, j) then
                -- 若两字符相等，则直接跳过此两字符
                dp[i][j] = dp[i - 1][j - 1]
            else
                -- 最少编辑步数 = 插入、删除、替换这三种操作的最少编辑步数 + 1
                dp[i][j] = math.min(dp[i][j - 1], dp[i - 1][j], dp[i - 1][j - 1]) + 1
            end
        end
    end

    return dp[n][m]
end

--- 编辑距离：空间优化后的动态规划
--- @param s string 源字符串
--- @param t string 目标字符串
--- @return integer 编辑距离
local function edit_distance_dp_comp(s, t)
    local n, m = #s, #t
    local dp = {}

    -- 初始化DP数组
    for j = 0, m do
        dp[j] = j
    end

    -- 状态转移：其余行
    for i = 1, n do
        -- 状态转移：首列
        local leftup = dp[0] -- 暂存 dp[i-1, j-1]
        dp[0] = i

        -- 状态转移：其余列
        for j = 1, m do
            local temp = dp[j]
            if s:sub(i, i) == t:sub(j, j) then
                -- 若两字符相等，则直接跳过此两字符
                dp[j] = leftup
            else
                -- 最少编辑步数 = 插入、删除、替换这三种操作的最少编辑步数 + 1
                dp[j] = math.min(dp[j - 1], dp[j], leftup) + 1
            end
            leftup = temp -- 更新为下一轮的 dp[i-1, j-1]
        end
    end

    return dp[m]
end

-- Driver Code
local function main()
    local s = "bag"
    local t = "pack"
    local n, m = #s, #t

    -- 暴力搜索
    local res = edit_distance_dfs(s, t, n, m)
    print(string.format("将 %s 更改为 %s 最少需要编辑 %d 步", s, t, res))

    -- 记忆化搜索
    local mem = {}
    for i = 0, n do
        mem[i] = {}
        for j = 0, m do
            mem[i][j] = -1
        end
    end
    res = edit_distance_dfs_mem(s, t, mem, n, m)
    print(string.format("将 %s 更改为 %s 最少需要编辑 %d 步", s, t, res))

    -- 动态规划
    res = edit_distance_dp(s, t)
    print(string.format("将 %s 更改为 %s 最少需要编辑 %d 步", s, t, res))

    -- 空间优化后的动态规划
    res = edit_distance_dp_comp(s, t)
    print(string.format("将 %s 更改为 %s 最少需要编辑 %d 步", s, t, res))
end

-- 执行主函数
main()
