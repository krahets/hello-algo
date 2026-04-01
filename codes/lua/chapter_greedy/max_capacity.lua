-- @script max_capacity.lua
-- @date 2025-11-16
-- @author fisheryv (yue.fisher2025@gdhfi.com)

--- 最大容量：贪心
--- @param ht table 高度数组
--- @return integer 最大容量
local function max_capacity(ht)
    -- 初始化 i, j，使其分列数组两端
    local i = 1
    local j = #ht
    -- 初始最大容量为 0
    local res = 0
    -- 循环贪心选择，直至两板相遇
    while i < j do
        -- 更新最大容量
        local cap = math.min(ht[i], ht[j]) * (j - i)
        res = math.max(res, cap)
        -- 向内移动短板
        if ht[i] < ht[j] then
            i = i + 1
        else
            j = j - 1
        end
    end
    return res
end

-- Driver Code
local function main()
    local ht = { 3, 8, 5, 2, 7, 7, 3, 4 }

    -- 贪心算法
    local res = max_capacity(ht)
    print(string.format("最大容量为 %d", res))
end

-- 执行主函数
main()
