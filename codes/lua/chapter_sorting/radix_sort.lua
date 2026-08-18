-- @script radix_sort.lua
-- @date 2025-11-15
-- @author fisheryv (yue.fisher2025@gdhfi.com)

--- 获取元素的第 k 位，其中 exp = 10^(k-1)
--- @param num integer 要获取位数的数字
--- @param exp integer 基数，10^(k-1)
--- @return integer 第 k 位的数字
local function digit(num, exp)
    -- 传入 exp 而非 k 可以避免在此重复执行昂贵的次方计算
    return math.floor(num / exp) % 10
end

--- 计数排序（根据 nums 第 k 位排序）
--- @param nums table 要排序的数字数组
--- @param exp integer 基数，10^(k-1)
local function counting_sort_digit(nums, exp)
    -- 十进制的位范围为 0~9 ，因此需要长度为 10 的桶数组
    local counter = {}
    for i = 0, 9 do
        counter[i] = 0
    end

    local n = #nums

    -- 统计 0~9 各数字的出现次数
    for i = 1, n do
        local d = digit(nums[i], exp) -- 获取 nums[i] 第 k 位，记为 d
        counter[d] = counter[d] + 1   -- 统计数字 d 的出现次数
    end

    -- 求前缀和，将"出现个数"转换为"数组索引"
    for i = 1, 9 do
        counter[i] = counter[i] + counter[i - 1]
    end

    -- 倒序遍历，根据桶内统计结果，将各元素填入 res
    local res = {}
    for i = n, 1, -1 do
        local d = digit(nums[i], exp)
        local j = counter[d]        -- 获取 d 在数组中的索引 j
        res[j] = nums[i]            -- 将当前元素填入索引 j
        counter[d] = counter[d] - 1 -- 将 d 的数量减 1
    end

    -- 使用结果覆盖原数组 nums
    for i = 1, n do
        nums[i] = res[i]
    end
end

--- 基数排序
--- @param nums table 要排序的数字数组
local function radix_sort(nums)
    -- 获取数组的最大元素，用于判断最大位数
    local m = nums[1]
    for i = 2, #nums do
        if nums[i] > m then
            m = nums[i]
        end
    end

    -- 按照从低位到高位的顺序遍历
    local exp = 1
    while exp <= m do
        -- 对数组元素的第 k 位执行计数排序
        -- k = 1 -> exp = 1
        -- k = 2 -> exp = 10
        -- 即 exp = 10^(k-1)
        counting_sort_digit(nums, exp)
        exp = exp * 10
    end
end

-- Driver Code
local function main()
    -- 基数排序
    local nums = {
        10546151,
        35663510,
        42865989,
        34862445,
        81883077,
        88906420,
        72429244,
        30524779,
        82060337,
        63832996
    }

    radix_sort(nums)
    print("基数排序完成后 nums = [" .. table.concat(nums, ", ") .. "]")
end

-- 执行主函数
main()
