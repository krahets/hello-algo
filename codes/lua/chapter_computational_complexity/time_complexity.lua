-- @script time_complexity.lua
-- @date 2025-11-10
-- @author fisheryv (yue.fisher2025@gdhfi.com)

--- 常数阶
--- @param n integer 数据大小
--- @return integer 操作数量
local function constant(n)
    local count = 0
    local size = 100000
    for _ = 1, size do
        count = count + 1
    end
    return count
end

--- 线性阶
--- @param n integer 数据大小
--- @return integer 操作数量
local function linear(n)
    local count = 0
    for _ = 1, n do
        count = count + 1
    end
    return count
end

--- 线性阶（遍历数组）
--- @param nums table 数组
--- @return integer 操作数量
local function array_traversal(nums)
    local count = 0
    -- 循环次数与数组长度成正比
    for _, num in ipairs(nums) do
        count = count + 1
    end
    return count
end

--- 平方阶
--- @param n integer 数据大小
--- @return integer 操作数量
local function quadratic(n)
    local count = 0
    -- 循环次数与数据大小 n 成平方关系
    for i = 1, n do
        for j = 1, n do
            count = count + 1
        end
    end
    return count
end

--- 平方阶（冒泡排序）
--- @param nums table 数组
--- @return integer 操作数量
local function bubble_sort(nums)
    local count = 0 -- 计数器
    -- 外循环：未排序区间为 [1, i]
    for i = #nums, 2, -1 do
        -- 内循环：将未排序区间 [1, i] 中的最大元素交换至该区间的最右端
        for j = 1, i - 1 do
            if nums[j] > nums[j + 1] then
                -- 交换 nums[j] 与 nums[j + 1]
                local tmp = nums[j]
                nums[j] = nums[j + 1]
                nums[j + 1] = tmp
                count = count + 3 -- 元素交换包含 3 个单元操作
            end
        end
    end
    return count
end

--- 指数阶（循环实现）
--- @param n integer 数据大小
--- @return integer 操作数量
local function exponential(n)
    local count = 0
    local base = 1
    -- 细胞每轮一分为二，形成数列 1, 2, 4, 8, ..., 2^(n-1)
    for _ = 1, n do
        for _ = 1, base do
            count = count + 1
        end
        base = base * 2
    end
    -- count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    return count
end

--- 指数阶（递归实现）
--- @param n integer 数据大小
--- @return integer 操作数量
local function exp_recur(n)
    if n == 1 then
        return 1
    end
    return exp_recur(n - 1) + exp_recur(n - 1) + 1
end

--- 对数阶（循环实现）
--- @param n integer 数据大小
--- @return integer 操作数量
local function logarithmic(n)
    local count = 0
    while n > 1 do
        n = n / 2
        count = count + 1
    end
    return count
end

--- 对数阶（递归实现）
--- @param n integer 数据大小
--- @return integer 操作数量
local function log_recur(n)
    if n <= 1 then
        return 0
    end
    return log_recur(n / 2) + 1
end

--- 线性对数阶
--- @param n integer 数据大小
--- @return integer 操作数量
local function linear_log_recur(n)
    if n <= 1 then
        return 1
    end
    -- 一分为二，子问题的规模减小一半
    local count = linear_log_recur(math.floor(n / 2)) + linear_log_recur(math.floor(n / 2))
    -- 当前子问题包含 n 个操作
    for _ = 1, n do
        count = count + 1
    end
    return count
end

--- 阶乘阶（递归实现）
--- @param n integer 数据大小
--- @return integer 操作数量
local function factorial_recur(n)
    if n == 0 then
        return 1
    end
    local count = 0
    -- 从 1 个分裂出 n 个
    for _ = 1, n do
        count = count + factorial_recur(n - 1)
    end
    return count
end

-- Driver Code
local function main()
    -- 可以修改 n 运行，体会一下各种复杂度的操作数量变化趋势
    local n = 8
    print("输入数据大小 n = " .. n)

    local count = constant(n)
    print("常数阶的操作数量 = " .. count)

    count = linear(n)
    print("线性阶的操作数量 = " .. count)

    -- 创建数组 [0, 0, ..., 0]
    local nums = {}
    for i = 1, n do
        nums[i] = 0
    end
    count = array_traversal(nums)
    print("线性阶（遍历数组）的操作数量 = " .. count)

    count = quadratic(n)
    print("平方阶的操作数量 = " .. count)

    -- 创建数组 [n, n-1, ..., 2, 1]
    nums = {}
    for i = 1, n do
        nums[i] = n - i + 1
    end
    count = bubble_sort(nums)
    print("平方阶（冒泡排序）的操作数量 = " .. count)

    count = exponential(n)
    print("指数阶（循环实现）的操作数量 = " .. count)
    count = exp_recur(n)
    print("指数阶（递归实现）的操作数量 = " .. count)

    count = logarithmic(n)
    print("对数阶（循环实现）的操作数量 = " .. count)
    count = log_recur(n)
    print("对数阶（递归实现）的操作数量 = " .. count)

    count = linear_log_recur(n)
    print("线性对数阶（递归实现）的操作数量 = " .. count)

    count = factorial_recur(n)
    print("阶乘阶（递归实现）的操作数量 = " .. count)
end

-- 执行主函数
main()
