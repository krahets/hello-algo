-- @script heap_sort.lua
-- @date 2025-11-15
-- @author fisheryv (yue.fisher2025@gdhfi.com)

--- 插入排序
--- @param nums table 待排序的数组
local function insertion_sort(nums)
    -- 外循环：已排序区间为 [1, i-1]
    for i = 2, #nums do
        local base = nums[i]
        local j = i - 1
        -- 内循环：将 base 插入到已排序区间 [1, i-1] 中的正确位置
        while j >= 1 and nums[j] > base do
            nums[j + 1] = nums[j] -- 将 nums[j] 向右移动一位
            j = j - 1
        end
        nums[j + 1] = base -- 将 base 赋值到正确位置
    end
end

-- Driver Code
local function main()
    local nums = { 4, 1, 3, 1, 5, 2 }
    insertion_sort(nums)
    print("插入排序完成后 nums = [" .. table.concat(nums, ", ") .. "]")
end

-- 执行主函数
main()
