-- @script iteration.lua
-- @date 2025-11-10
-- @author fisheryv (yue.fisher2025@gdhfi.com)


--- for 循环
--- @param n integer 循环次数
--- @return integer 求和结果
local function for_loop(n)
    local res = 0
    -- 循环求和 1, 2, ..., n-1, n
    for i = 1, n do
        res = res + i
    end
    return res
end

--- while 循环
--- @param n integer 循环次数
--- @return integer 求和结果
local function while_loop(n)
    local res = 0
    local i = 1 -- 初始化条件变量
    -- 循环求和 1, 2, ..., n-1, n
    while i <= n do
        res = res + i
        i = i + 1 -- 更新条件变量
    end
    return res
end

--- while 循环（两次更新）
--- @param n integer 循环次数
--- @return integer 求和结果
local function while_loop_ii(n)
    local res = 0
    local i = 1 -- 初始化条件变量
    -- 循环求和 1, 4, 10, ...
    while i <= n do
        res = res + i
        -- 更新条件变量
        i = i + 1
        i = i * 2
    end
    return res
end

--- 双层 for 循环
--- @param n integer 循环次数
--- @return string 遍历结果字符串
local function nested_for_loop(n)
    local res = ""
    -- 循环 i = 1, 2, ..., n-1, n
    for i = 1, n do
        -- 循环 j = 1, 2, ..., n-1, n
        for j = 1, n do
            res = res .. "(" .. i .. ", " .. j .. "), "
        end
    end
    return res
end

-- Driver Code
local function main()
    local n = 5
    local res = for_loop(n)
    print(string.format("\nfor 循环的求和结果 res = %d", res))

    res = while_loop(n)
    print(string.format("\nwhile 循环的求和结果 res = %d", res))

    res = while_loop_ii(n)
    print(string.format("\nwhile 循环（两次更新）求和结果 res = %d", res))

    res = nested_for_loop(n)
    print(string.format("\n双层 for 循环的遍历结果 %s", res))
end

main()
