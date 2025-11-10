-- @script worst_best_time_complexity.lua
-- @date 2025-11-10
-- @author fisheryv (yue.fisher2025@gdhfi.com)


--- 生成一个数组，元素为: 1, 2, ..., n ，顺序被打乱
--- @param n integer 数组长度
--- @return table 打乱后的数组
local function random_numbers(n)
    -- 生成数组 nums =: 1, 2, 3, ..., n
    local nums = {}
    for i = 1, n do
        nums[i] = i
    end

    -- 随机打乱数组元素
    for i = n, 2, -1 do
        local j = math.random(i)
        nums[i], nums[j] = nums[j], nums[i]
    end

    return nums
end

--- 查找数组 nums 中数字 1 所在索引
--- @param nums table 待查找数组
--- @return integer 数字1的索引，未找到返回-1
local function find_one(nums)
    for i = 1, #nums do
        -- 当元素 1 在数组头部时，达到最佳时间复杂度 O(1)
        -- 当元素 1 在数组尾部时，达到最差时间复杂度 O(n)
        if nums[i] == 1 then
            return i
        end
    end
    return -1
end

-- Driver Code
local function main()
    math.randomseed(os.time()) -- 初始化随机数种子

    for _ = 1, 10 do
        local n = 100
        local nums = random_numbers(n)
        local index = find_one(nums)
        print("\n数组 [ 1, 2, ..., n ] 被打乱后 = [" .. table.concat(nums, ", ") .. "]")
        print("数字 1 的索引为 " .. index)
    end
end

main()
