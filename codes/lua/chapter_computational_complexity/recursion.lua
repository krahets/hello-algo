-- @script recursion.lua
-- @date 2025-11-10
-- @author fisheryv (yue.fisher2025@gdhfi.com)


--- 递归求和函数
--- @param n integer 输入的数字
--- @return integer 1+2+...+n 的结果
local function recur(n)
    -- 终止条件
    if n == 1 then
        return 1
    end
    -- 递：递归调用
    local res = recur(n - 1)
    -- 归：返回结果
    return n + res
end

--- 使用迭代模拟递归
--- @param n integer 输入的数字
--- @return integer 1+2+...+n 的结果
local function for_loop_recur(n)
    -- 使用一个显式的栈来模拟系统调用栈
    local stack = {}
    local res = 0
    -- 递：递归调用
    for i = n, 1, -1 do
        -- 通过"入栈操作"模拟"递"
        table.insert(stack, i)
    end
    -- 归：返回结果
    while #stack > 0 do
        -- 通过"出栈操作"模拟"归"
        res = res + table.remove(stack)
    end
    -- res = 1+2+3+...+n
    return res
end

--- 尾递归函数
--- @param n integer 输入的数字
--- @param res integer 累积结果
--- @return integer 1+2+...+n 的结果
local function tail_recur(n, res)
    -- 终止条件
    if n == 0 then
        return res
    end
    -- 尾递归调用
    return tail_recur(n - 1, res + n)
end

--- 斐波那契数列：递归
--- @param n integer 斐波那契数列的项数
--- @return integer 第n项斐波那契数
local function fib(n)
    -- 终止条件 f(1) = 0, f(2) = 1
    if n == 1 or n == 2 then
        return n - 1
    end
    -- 递归调用 f(n) = f(n-1) + f(n-2)
    local res = fib(n - 1) + fib(n - 2)
    -- 返回结果 f(n)
    return res
end

-- Driver Code
local function main()
    local n = 5

    local res = recur(n)
    print(string.format("\n递归函数的求和结果 res = %d", res))

    res = for_loop_recur(n)
    print(string.format("\n使用迭代模拟递归求和结果 res = %d", res))

    res = tail_recur(n, 0)
    print(string.format("\n尾递归函数的求和结果 res = %d", res))

    res = fib(n)
    print(string.format("\n斐波那契数列的第 %d 项为 %d", n, res))
end

-- 执行主函数
main()
