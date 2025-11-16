-- @script fractional_knapsack.lua
-- @date 2025-11-16
-- @author fisheryv (yue.fisher2025@gdhfi.com)

--- @class Item
--- 物品类
--- @field w number 物品重量
--- @field v number 物品价值
local Item = {}
Item.__index = Item

--- 构造函数
--- @param  w number 物品重量
--- @param  v number 物品价值
--- @return Item 物品实例
function Item.new(w, v)
    local instance = setmetatable({}, Item)
    instance.w = w
    instance.v = v
    return instance
end

--- 分数背包贪心算法
--- @param wgt table 物品重量列表
--- @param val table 物品价值列表
--- @param cap number 背包容量
--- @return number 最大价值
local function fractional_knapsack(wgt, val, cap)
    -- 创建物品列表
    local items = {}
    for i = 1, #wgt do
        table.insert(items, Item.new(wgt[i], val[i]))
    end

    -- 按单位价值从高到低排序
    table.sort(items, function(a, b)
        return (a.v / a.w) > (b.v / b.w)
    end)

    local res = 0

    -- 贪心选择
    for _, item in ipairs(items) do
        if item.w <= cap then
            -- 剩余容量充足，装入整个物品
            res = res + item.v
            cap = cap - item.w
        else
            -- 剩余容量不足，装入部分物品
            res = res + (item.v / item.w) * cap
            break
        end
    end

    return res
end

-- Driver Code
local function main()
    local wgt = { 10, 20, 30, 40, 50 }
    local val = { 50, 120, 150, 210, 240 }
    local cap = 50

    -- 贪心算法
    local res = fractional_knapsack(wgt, val, cap)
    print(string.format("不超过背包容量的最大物品价值为 %.2f", res))
end

-- 执行主函数
main()
