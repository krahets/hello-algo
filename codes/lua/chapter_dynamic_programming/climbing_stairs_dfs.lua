-- @script climbing_stairs_dfs.lua
-- @date 2025-11-16
-- @author fisheryv (yue.fisher2025@gdhfi.com)

--- 搜索
--- @param i integer 当前台阶数
--- @return integer 到达当前台阶的方案数
local function dfs(i)
    -- 已知 dp[1] 和 dp[2]，直接返回
    if i == 1 or i == 2 then
        return i
    end

    -- dp[i] = dp[i-1] + dp[i-2]
    local count = dfs(i - 1) + dfs(i - 2)
    return count
end

--- 爬楼梯：搜索
--- @param n integer 楼梯阶数
--- @return integer 爬楼梯的方案总数
local function climbing_stairs_dfs(n)
    return dfs(n)
end

-- Driver Code
local function main()
    local n = 9
    local res = climbing_stairs_dfs(n)
    print(string.format("爬 %d 阶楼梯共有 %d 种方案", n, res))
end

-- 执行主函数
main()
