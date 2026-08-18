-- @script max_product_cutting.lua
-- @date 2025-11-16
-- @author fisheryv (yue.fisher2025@gdhfi.com)

--- 最大切分乘积：贪心
--- @param n integer 要切分的整数
--- @return integer 最大乘积结果
local function max_product_cutting(n)
    -- 当 n <= 3 时，必须切分出一个 1
    if n <= 3 then
        return 1 * (n - 1)
    end

    -- 贪心地切分出 3，a 为 3 的个数，b 为余数
    local a = n // 3
    local b = n % 3

    if b == 1 then
        -- 当余数为 1 时，将一对 1 * 3 转化为 2 * 2
        return 3 ^ (a - 1) * 2 * 2
    elseif b == 2 then
        -- 当余数为 2 时，不做处理
        return 3 ^ a * 2
    else
        -- 当余数为 0 时，不做处理
        return 3 ^ a
    end
end

-- Driver Code
local function main()
    local n = 58

    -- 贪心算法
    local res = max_product_cutting(n)
    print(string.format("最大切分乘积为 %d", res))
end

-- 执行主函数
main()
