-- @script climbing_stairs_dfs_mem.lua
-- @date 2025-11-16
-- @author fisheryv (yue.fisher2025@gdhfi.com)

--- 记忆化搜索
--- @param i integer 当前楼梯阶数
--- @param mem table 记忆化表格
--- @return integer 爬到第 i 阶的方案总数
local function dfs(i, mem)
    -- 基本情况：第 1 阶有 1 种方案，第 2 阶有 2 种方案
    if i == 1 or i == 2 then
        return i
    end

    -- 如果已经计算过，直接返回结果
    if mem[i] ~= -1 then
        return mem[i]
    end

    -- 递归计算：dp[i] = dp[i-1] + dp[i-2]
    local count = dfs(i - 1, mem) + dfs(i - 2, mem)

    -- 记录结果到记忆化表格
    mem[i] = count

    return count
end

--- 爬楼梯：记忆化搜索
--- @param n integer 楼梯总阶数
--- @return integer 爬 n 阶楼梯的方案总数
local function climbing_stairs_dfs_mem(n)
    -- mem[i] 记录爬到第 i 阶的方案总数，-1 代表无记录
    local mem = {}
    for i = 0, n do
        mem[i] = -1
    end

    return dfs(n, mem)
end

-- Driver Code
local function main()
    local n = 9
    local res = climbing_stairs_dfs_mem(n)
    print(string.format("爬 %d 阶楼梯共有 %d 种方案", n, res))
end

-- 执行主函数
main()
