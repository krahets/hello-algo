-- @file array.lua
-- @date 2025-11-11
-- @author fisheryv (yue.fisher2025@gdhfi.com)


--- 随机访问元素
--- @param nums table 数组
--- @return number 随机访问到的元素
local function random_access(nums)
    -- 在区间 [1, #nums] 中随机抽取一个数字
    local random_index = math.random(1, #nums)
    -- 获取并返回随机元素
    local random_num = nums[random_index]
    return random_num
end

--- 扩展数组长度
--- 请注意，Lua 的 table 是动态的，可以直接扩展
--- 为了方便学习，本函数将 table 看作长度不可变的数组
--- @param nums table 数组
--- @param enlarge number 扩展的长度
--- @return table 扩展后的新数组
local function extend(nums, enlarge)
    -- 初始化一个扩展长度后的数组
    local res = {}
    -- 将原数组中的所有元素复制到新数组
    for i = 1, #nums do
        res[i] = nums[i]
    end
    -- 填充新增的位置为0
    for i = #nums + 1, #nums + enlarge do
        res[i] = 0
    end
    -- 返回扩展后的新数组
    return res
end

--- 在数组的索引 index 处插入元素 num
--- @param nums table 数组
--- @param num number 要插入的元素
--- @param index number 插入位置的索引
local function insert(nums, num, index)
    -- 把索引 index 以及之后的所有元素向后移动一位
    for i = #nums, index, -1 do
        nums[i + 1] = nums[i]
    end
    -- 将 num 赋给 index 处的元素
    nums[index] = num
end

--- 删除索引 index 处的元素
--- @param nums table 数组
--- @param index number 要删除元素的索引
local function remove(nums, index)
    -- 把索引 index 之后的所有元素向前移动一位
    for i = index, #nums - 1 do
        nums[i] = nums[i + 1]
    end
    -- 将最后一个元素设为nil
    nums[#nums] = nil
end

--- 遍历数组
--- @param nums table 数组
local function traverse(nums)
    local count = 0
    -- 通过索引遍历数组
    for i = 1, #nums do
        count = count + nums[i]
    end
    -- 直接遍历数组元素
    for _, num in ipairs(nums) do
        count = count + num
    end
    -- 同时遍历数据索引和元素（在 Lua 中 ipairs 已经提供了这个功能）
    for i, num in ipairs(nums) do
        count = count + nums[i]
        count = count + num
    end
end

--- 在数组中查找指定元素
--- @param nums table 数组
--- @param target number 要查找的元素
--- @return number 元素的索引，未找到则返回 -1
local function find(nums, target)
    for i = 1, #nums do
        if nums[i] == target then
            return i
        end
    end
    return -1
end

-- Driver Code
local function main()
    -- 初始化数组
    local arr = { 0, 0, 0, 0, 0 }
    print("数组 arr = [" .. table.concat(arr, ", ") .. "]")
    local nums = { 1, 3, 2, 5, 4 }
    print("数组 nums = [" .. table.concat(nums, ", ") .. "]")

    -- 随机访问
    local random_num = random_access(nums)
    print("在 nums 中获取随机元素 " .. random_num)

    -- 长度扩展
    nums = extend(nums, 3)
    print("将数组长度扩展至 8 ，得到 nums = [" .. table.concat(nums, ", ") .. "]")

    -- 插入元素
    -- 注意：lua 数组索引从 1 开始，所以其他语言的索引 3 处对应 lua 的索引 4
    insert(nums, 6, 4)
    print("在索引 4 处插入数字 6 ，得到 nums = [" .. table.concat(nums, ", ") .. "]")

    -- 删除元素
    -- 注意：lua 数组索引从 1 开始，所以其他语言的索引 2 处对应 lua 的索引 3
    remove(nums, 3)
    print("删除索引 3 处的元素，得到 nums = [" .. table.concat(nums, ", ") .. "]")

    -- 遍历数组
    traverse(nums)

    -- 查找元素
    -- 注意：lua 数组索引从 1 开始，所以元素 3 的索引为 2
    local index = find(nums, 3)
    print("在 nums 中查找元素 3 ，得到索引 = " .. index)
end

-- 执行主函数
main()
