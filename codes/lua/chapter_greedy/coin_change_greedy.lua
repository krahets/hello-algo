-- @script coin_change_greedy.lua
-- @date 2025-11-16
-- @author fisheryv (yue.fisher2025@gdhfi.com)

--- 零钱兑换：贪心
--- @param coins table 可用的硬币面值列表
--- @param amt integer 目标金额
--- @return integer 最少硬币数量，如果无法凑出则返回-1
local function coin_change_greedy(coins, amt)
    local i = #coins -- 从最大面额开始
    local count = 0

    -- 循环进行贪心选择，直到无剩余金额
    while amt > 0 do
        -- 找到小于且最接近剩余金额的硬币
        while i > 1 and coins[i] > amt do
            i = i - 1
        end

        -- 选择当前可用的最大面额硬币
        amt = amt - coins[i]
        count = count + 1
    end

    -- 若未找到可行方案，则返回 -1
    return amt == 0 and count or -1
end

-- Driver Code
local function main()
    -- 测试用例1：贪心能够保证找到全局最优解
    local coins1 = { 1, 5, 10, 20, 50, 100 }
    local amt1 = 186
    local res1 = coin_change_greedy(coins1, amt1)
    print(string.format("\ncoins = [%s], amt = %d", table.concat(coins1, ", "), amt1))
    print(string.format("凑到 %d 所需的最少硬币数量为 %d", amt1, res1))

    -- 测试用例2：贪心无法保证找到全局最优解
    local coins2 = { 1, 20, 50 }
    local amt2 = 60
    local res2 = coin_change_greedy(coins2, amt2)
    print(string.format("\ncoins = [%s], amt = %d", table.concat(coins2, ", "), amt2))
    print(string.format("凑到 %d 所需的最少硬币数量为 %d", amt2, res2))
    print("实际上需要的最少数量为 3 ，即 20 + 20 + 20")

    -- 测试用例3：贪心无法保证找到全局最优解
    local coins3 = { 1, 49, 50 }
    local amt3 = 98
    local res3 = coin_change_greedy(coins3, amt3)
    print(string.format("\ncoins = [%s], amt = %d", table.concat(coins3, ", "), amt3))
    print(string.format("凑到 %d 所需的最少硬币数量为 %d", amt3, res3))
    print("实际上需要的最少数量为 2 ，即 49 + 49")
end

-- 执行主函数
main()
