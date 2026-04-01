-- @script quick_sort.lua
-- @date 2025-11-15
-- @author fisheryv (yue.fisher2025@gdhfi.com)

--- @class QuickSort
--- 快速排序类
QuickSort = {}
QuickSort.__index = QuickSort

--- 创建新的快速排序实例
--- @return QuickSort 实例
function QuickSort.new()
    local obj = {}
    setmetatable(obj, QuickSort)
    return obj
end

--- 哨兵划分
--- @param nums table 待排序数组
--- @param left integer 左边界索引
--- @param right integer 右边界索引
--- @return integer 基准数索引
function QuickSort:partition(nums, left, right)
    -- 以 nums[left] 为基准数
    local i, j = left, right
    while i < j do
        while i < j and nums[j] >= nums[left] do
            j = j - 1 -- 从右向左找首个小于基准数的元素
        end
        while i < j and nums[i] <= nums[left] do
            i = i + 1 -- 从左向右找首个大于基准数的元素
        end
        -- 元素交换
        nums[i], nums[j] = nums[j], nums[i]
    end
    -- 将基准数交换至两子数组的分界线
    nums[i], nums[left] = nums[left], nums[i]
    return i -- 返回基准数的索引
end

--- 快速排序
--- @param nums table 待排序数组
--- @param left integer 左边界索引
--- @param right integer 右边界索引
function QuickSort:quick_sort(nums, left, right)
    -- 子数组长度为 1 时终止递归
    if left >= right then
        return
    end
    -- 哨兵划分
    local pivot = self:partition(nums, left, right)
    -- 递归左子数组、右子数组
    self:quick_sort(nums, left, pivot - 1)
    self:quick_sort(nums, pivot + 1, right)
end

--- @class QuickSortMedian
--- 快速排序类（中位基准数优化）
QuickSortMedian = {}
QuickSortMedian.__index = QuickSortMedian

--- 创建新的中位基准数快速排序实例
-- @return QuickSortMedian 实例
function QuickSortMedian.new()
    local obj = {}
    setmetatable(obj, QuickSortMedian)
    return obj
end

--- 选取三个候选元素的中位数
--- @param nums table 数组
--- @param left integer 左边界索引
--- @param mid integer 中间索引
--- @param right integer 右边界索引
--- @return integer 中位数索引
function QuickSortMedian:median_three(nums, left, mid, right)
    local l, m, r = nums[left], nums[mid], nums[right]
    if (l <= m and m <= r) or (r <= m and m <= l) then
        return mid -- m 在 l 和 r 之间
    end
    if (m <= l and l <= r) or (r <= l and l <= m) then
        return left -- l 在 m 和 r 之间
    end
    return right
end

--- 哨兵划分（三数取中值）
--- @param nums table 待排序数组
--- @param left integer 左边界索引
--- @param right integer 右边界索引
--- @return integer 基准数索引
function QuickSortMedian:partition(nums, left, right)
    -- 以 nums[left] 为基准数
    local med = self:median_three(nums, left, math.floor((left + right) / 2), right)
    -- 将中位数交换至数组最左端
    nums[left], nums[med] = nums[med], nums[left]
    -- 以 nums[left] 为基准数
    local i, j = left, right
    while i < j do
        while i < j and nums[j] >= nums[left] do
            j = j - 1 -- 从右向左找首个小于基准数的元素
        end
        while i < j and nums[i] <= nums[left] do
            i = i + 1 -- 从左向右找首个大于基准数的元素
        end
        -- 元素交换
        nums[i], nums[j] = nums[j], nums[i]
    end
    -- 将基准数交换至两子数组的分界线
    nums[i], nums[left] = nums[left], nums[i]
    return i -- 返回基准数的索引
end

--- 快速排序
--- @param nums table 待排序数组
--- @param left integer 左边界索引
--- @param right integer 右边界索引
function QuickSortMedian:quick_sort(nums, left, right)
    -- 子数组长度为 1 时终止递归
    if left >= right then
        return
    end
    -- 哨兵划分
    local pivot = self:partition(nums, left, right)
    -- 递归左子数组、右子数组
    self:quick_sort(nums, left, pivot - 1)
    self:quick_sort(nums, pivot + 1, right)
end

--- @class QuickSortTailCall
--- 快速排序类（递归深度优化）
QuickSortTailCall = {}
QuickSortTailCall.__index = QuickSortTailCall

--- 创建新的尾递归优化快速排序实例
--- @return QuickSortTailCall 实例
function QuickSortTailCall.new()
    local obj = {}
    setmetatable(obj, QuickSortTailCall)
    return obj
end

--- 哨兵划分
--- @param nums table 待排序数组
--- @param left integer 左边界索引
--- @param right integer 右边界索引
--- @return integer 基准数索引
function QuickSortTailCall:partition(nums, left, right)
    -- 以 nums[left] 为基准数
    local i, j = left, right
    while i < j do
        while i < j and nums[j] >= nums[left] do
            j = j - 1 -- 从右向左找首个小于基准数的元素
        end
        while i < j and nums[i] <= nums[left] do
            i = i + 1 -- 从左向右找首个大于基准数的元素
        end
        -- 元素交换
        nums[i], nums[j] = nums[j], nums[i]
    end
    -- 将基准数交换至两子数组的分界线
    nums[i], nums[left] = nums[left], nums[i]
    return i -- 返回基准数的索引
end

--- 快速排序（递归深度优化）
--- @param nums table 待排序数组
--- @param left integer 左边界索引
--- @param right integer 右边界索引
function QuickSortTailCall:quick_sort(nums, left, right)
    -- 子数组长度为 1 时终止
    while left < right do
        -- 哨兵划分操作
        local pivot = self:partition(nums, left, right)
        -- 对两个子数组中较短的那个执行快速排序
        if pivot - left < right - pivot then
            self:quick_sort(nums, left, pivot - 1)  -- 递归排序左子数组
            left = pivot + 1                        -- 剩余未排序区间为 [pivot + 1, right]
        else
            self:quick_sort(nums, pivot + 1, right) -- 递归排序右子数组
            right = pivot - 1                       -- 剩余未排序区间为 [left, pivot - 1]
        end
    end
end

-- Driver Code
local function main()
    -- 快速排序
    local nums = { 2, 4, 1, 0, 3, 5 }
    QuickSort.new():quick_sort(nums, 1, #nums)
    print("快速排序完成后 nums = [" .. table.concat(nums, ", ") .. "]")

    -- 快速排序（中位基准数优化）
    local nums1 = { 2, 4, 1, 0, 3, 5 }
    QuickSortMedian.new():quick_sort(nums1, 1, #nums1)
    print("快速排序（中位基准数优化）完成后 nums = [" .. table.concat(nums1, ", ") .. "]")

    -- 快速排序（递归深度优化）
    local nums2 = { 2, 4, 1, 0, 3, 5 }
    QuickSortTailCall.new():quick_sort(nums2, 1, #nums2)
    print("快速排序（递归深度优化）完成后 nums = [" .. table.concat(nums2, ", ") .. "]")
end

-- 执行主函数
main()
