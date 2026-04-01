-- @script binary_search_edge.lua
-- @date 2025-11-15
-- @author fisheryv (yue.fisher2025@gdhfi.com)

-- 添加模块搜索路径
package.path = package.path .. ";codes/lua/chapter_searching/binary_search_insertion.lua"

local binary_search_insertion = require("binary_search_insertion")

--- 二分查找最左一个 target
--- @param nums table 有序数组
--- @param target integer 目标值
--- @return integer 目标值的最左索引，未找到返回 -1
--- @warning Lua table 索引从 1 开始
local function binary_search_left_edge(nums, target)
    -- 等价于查找 target 的插入点
    local i = binary_search_insertion(nums, target)
    -- 未找到 target ，返回 -1
    if i == #nums + 1 or nums[i] ~= target then
        return -1
    end
    -- 找到 target ，返回索引 i
    return i
end

--- 二分查找最右一个 target
--- @param nums table 有序数组
--- @param target integer 目标值
--- @return integer 目标值的最右索引，未找到返回 -1
--- @warning Lua table 索引从 1 开始
local function binary_search_right_edge(nums, target)
    -- 转化为查找最左一个 target + 1
    local i = binary_search_insertion(nums, target + 1)
    -- j 指向最右一个 target ，i 指向首个大于 target 的元素
    local j = i - 1
    -- 未找到 target ，返回 -1
    if j == 0 or nums[j] ~= target then
        return -1
    end
    -- 找到 target ，返回索引 j
    return j
end

-- Driver Code
local function main()
    -- 包含重复元素的数组
    local nums = { 1, 3, 6, 6, 6, 6, 6, 10, 12, 15 }
    print(string.format("\n数组 nums = [%s]", table.concat(nums, ", ")))

    -- 二分查找左边界和右边界
    local targets = { 6, 7 }
    for _, target in ipairs(targets) do
        local index = binary_search_left_edge(nums, target)
        print(string.format("最左一个元素 %d 的索引为 %d", target, index))
        index = binary_search_right_edge(nums, target)
        print(string.format("最右一个元素 %d 的索引为 %d", target, index))
    end
end

-- 执行主函数
main()
