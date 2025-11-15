-- @script bubble_sort.lua
-- @date 2025-11-15
-- @author fisheryv (yue.fisher2025@gdhfi.com)

--- 冒泡排序
--- @param nums table 待排序的数组
local function bubble_sort(nums)
    local n = #nums
    -- 外循环：未排序区间为 [1, i]
    for i = n, 2, -1 do
        -- 内循环：将未排序区间 [1, i] 中的最大元素交换至该区间的最右端
        for j = 1, i - 1 do
            if nums[j] > nums[j + 1] then
                -- 交换 nums[j] 与 nums[j + 1]
                nums[j], nums[j + 1] = nums[j + 1], nums[j]
            end
        end
    end
end

--- 冒泡排序（标志优化）
--- @param nums table 待排序的数组
local function bubble_sort_with_flag(nums)
    local n = #nums
    -- 外循环：未排序区间为 [1, i]
    for i = n, 2, -1 do
        local flag = false -- 初始化标志位
        -- 内循环：将未排序区间 [1, i] 中的最大元素交换至该区间的最右端
        for j = 1, i - 1 do
            if nums[j] > nums[j + 1] then
                -- 交换 nums[j] 与 nums[j + 1]
                nums[j], nums[j + 1] = nums[j + 1], nums[j]
                flag = true -- 记录交换元素
            end
        end
        if not flag then
            break -- 此轮"冒泡"未交换任何元素，直接跳出
        end
    end
end

-- Driver Code
local function main()
    local nums = { 4, 1, 3, 1, 5, 2 }
    bubble_sort(nums)
    print("冒泡排序完成后 nums = [" .. table.concat(nums, ", ") .. "]")

    local nums1 = { 4, 1, 3, 1, 5, 2 }
    bubble_sort_with_flag(nums1)
    print("冒泡排序完成后 nums = [" .. table.concat(nums1, ", ") .. "]")
end

-- 执行主函数
main()
