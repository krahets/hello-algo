-- @file: array.lua
-- @date 2025-11-11
-- @author fisheryv (yue.fisher2025@gdhfi.com)


-- Driver Code
local function main()
    -- 初始化列表
    local nums = { 1, 3, 2, 5, 4 }
    print("\n列表 nums = [" .. table.concat(nums, ", ") .. "]")

    -- 访问元素
    -- 注意：lua 数组索引从 1 开始，所以其他语言的索引 1 处对应 lua 的索引 2
    local x = nums[2]
    print("\n访问索引 2 处的元素，得到 x = " .. x)

    -- 更新元素
    -- 注意：lua 数组索引从 1 开始，所以其他语言的索引 1 处对应 lua 的索引 2
    nums[2] = 0
    print("\n将索引 2 处的元素更新为 0 ，得到 nums = [" .. table.concat(nums, ", ") .. "]")

    -- 清空列表
    nums = {}
    print("\n清空列表后 nums = [" .. table.concat(nums, ", ") .. "]")

    -- 在尾部添加元素
    table.insert(nums, 1)
    table.insert(nums, 3)
    table.insert(nums, 2)
    table.insert(nums, 5)
    table.insert(nums, 4)
    print("\n添加元素后 nums = [" .. table.concat(nums, ", ") .. "]")

    -- 在中间插入元素
    -- 注意：lua 数组索引从 1 开始，所以其他语言的索引 3 处对应 lua 的索引 4
    table.insert(nums, 4, 6) -- 在索引 4 处插入 6
    print("\n在索引 4 处插入数字 6 ，得到 nums = [" .. table.concat(nums, ", ") .. "]")

    -- 删除元素
    -- 注意：lua 数组索引从 1 开始，所以其他语言的索引 3 处对应 lua 的索引 4
    table.remove(nums, 4) -- 删除索引 4 处的元素
    print("\n删除索引 4 处的元素，得到 nums = [" .. table.concat(nums, ", ") .. "]")

    -- 通过索引遍历列表
    local count = 0
    for i = 1, #nums do
        count = count + nums[i]
    end
    -- 直接遍历列表元素
    for _, num in ipairs(nums) do
        count = count + num
    end

    -- 拼接两个列表
    local nums1 = { 6, 8, 7, 10, 9 }
    for _, num in ipairs(nums1) do
        table.insert(nums, num)
    end
    print("\n将列表 nums1 拼接到 nums 之后，得到 nums = [" .. table.concat(nums, ", ") .. "]")

    -- 排序列表
    table.sort(nums)
    print("\n排序列表后 nums = [" .. table.concat(nums, ", ") .. "]")
end

-- 执行主函数
main()
