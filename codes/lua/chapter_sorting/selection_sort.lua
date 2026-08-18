-- @script selection_sort.lua
-- @date 2025-11-15
-- @author fisheryv (yue.fisher2025@gdhfi.com)

--- 选择排序
--- @param nums table 待排序的数组（原地修改）
local function selection_sort(nums)
    local n = #nums
    -- 外循环：未排序区间为 [i, n]
    for i = 1, n - 1 do
        -- 内循环：找到未排序区间内的最小元素
        local k = i
        for j = i + 1, n do
            if nums[j] < nums[k] then
                k = j -- 记录最小元素的索引
            end
        end
        -- 将该最小元素与未排序区间的首个元素交换
        nums[i], nums[k] = nums[k], nums[i]
    end
end

-- Driver Code
local function main()
    local nums = { 4, 1, 3, 1, 5, 2 }
    selection_sort(nums)
    print("选择排序完成后 nums = [" .. table.concat(nums, ", ") .. "]")
end

-- 执行主函数
main()
