-- @script merge_sort.lua
-- @date 2025-11-15
-- @author fisheryv (yue.fisher2025@gdhfi.com)

--- 合并左子数组和右子数组
--- @param nums table 待合并的数组
--- @param left integer 左边界索引
--- @param mid integer 中间索引
--- @param right integer 右边界索引
local function merge(nums, left, mid, right)
    -- 左子数组区间为 [left, mid], 右子数组区间为 [mid+1, right]
    -- 创建一个临时数组 tmp，用于存放合并后的结果
    local tmp = {}
    -- 初始化左子数组和右子数组的起始索引
    local i, j, k = left, mid + 1, 1

    -- 当左右子数组都还有元素时，进行比较并将较小的元素复制到临时数组中
    while i <= mid and j <= right do
        if nums[i] <= nums[j] then
            tmp[k] = nums[i]
            i = i + 1
        else
            tmp[k] = nums[j]
            j = j + 1
        end
        k = k + 1
    end

    -- 将左子数组的剩余元素复制到临时数组中
    while i <= mid do
        tmp[k] = nums[i]
        i = i + 1
        k = k + 1
    end

    -- 将右子数组的剩余元素复制到临时数组中
    while j <= right do
        tmp[k] = nums[j]
        j = j + 1
        k = k + 1
    end

    -- 将临时数组 tmp 中的元素复制回原数组 nums 的对应区间
    for idx = 1, #tmp do
        nums[left + idx - 1] = tmp[idx]
    end
end

--- 归并排序
--- @param nums table 待排序的数组
--- @param left integer 左边界索引
--- @param right integer 右边界索引
local function merge_sort(nums, left, right)
    -- 终止条件：当子数组长度为 1 时终止递归
    if left >= right then
        return
    end

    -- 划分阶段：计算中点
    local mid = math.floor((left + right) / 2)

    -- 递归左子数组
    merge_sort(nums, left, mid)
    -- 递归右子数组
    merge_sort(nums, mid + 1, right)
    -- 合并阶段
    merge(nums, left, mid, right)
end

-- Driver Code
local function main()
    local nums = { 7, 3, 2, 6, 0, 1, 5, 4 }
    merge_sort(nums, 1, #nums)
    print("归并排序完成后 nums = [" .. table.concat(nums, ", ") .. "]")
end

-- 执行主函数
main()
