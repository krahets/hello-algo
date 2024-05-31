/**
 * File: quick_sort.swift
 * Created Time: 2023-01-29
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 快速排序类 */
/* 哨兵划分 */
func partition(nums: inout [Int], left: Int, right: Int) -> Int {
    // 以 nums[left] 为基准数
    var i = left
    var j = right
    while i < j {
        while i < j, nums[j] >= nums[left] {
            j -= 1 // 从右向左找首个小于基准数的元素
        }
        while i < j, nums[i] <= nums[left] {
            i += 1 // 从左向右找首个大于基准数的元素
        }
        nums.swapAt(i, j) // 交换这两个元素
    }
    nums.swapAt(i, left) // 将基准数交换至两子数组的分界线
    return i // 返回基准数的索引
}

/* 快速排序 */
func quickSort(nums: inout [Int], left: Int, right: Int) {
    // 子数组长度为 1 时终止递归
    if left >= right {
        return
    }
    // 哨兵划分
    let pivot = partition(nums: &nums, left: left, right: right)
    // 递归左子数组、右子数组
    quickSort(nums: &nums, left: left, right: pivot - 1)
    quickSort(nums: &nums, left: pivot + 1, right: right)
}

/* 快速排序类（中位基准数优化） */
/* 选取三个候选元素的中位数 */
func medianThree(nums: [Int], left: Int, mid: Int, right: Int) -> Int {
    let l = nums[left]
    let m = nums[mid]
    let r = nums[right]
    if (l <= m && m <= r) || (r <= m && m <= l) {
        return mid // m 在 l 和 r 之间
    }
    if (m <= l && l <= r) || (r <= l && l <= m) {
        return left // l 在 m 和 r 之间
    }
    return right
}

/* 哨兵划分（三数取中值） */
func partitionMedian(nums: inout [Int], left: Int, right: Int) -> Int {
    // 选取三个候选元素的中位数
    let med = medianThree(nums: nums, left: left, mid: left + (right - left) / 2, right: right)
    // 将中位数交换至数组最左端
    nums.swapAt(left, med)
    return partition(nums: &nums, left: left, right: right)
}

/* 快速排序（中位基准数优化） */
func quickSortMedian(nums: inout [Int], left: Int, right: Int) {
    // 子数组长度为 1 时终止递归
    if left >= right {
        return
    }
    // 哨兵划分
    let pivot = partitionMedian(nums: &nums, left: left, right: right)
    // 递归左子数组、右子数组
    quickSortMedian(nums: &nums, left: left, right: pivot - 1)
    quickSortMedian(nums: &nums, left: pivot + 1, right: right)
}

/* 快速排序（尾递归优化） */
func quickSortTailCall(nums: inout [Int], left: Int, right: Int) {
    var left = left
    var right = right
    // 子数组长度为 1 时终止
    while left < right {
        // 哨兵划分操作
        let pivot = partition(nums: &nums, left: left, right: right)
        // 对两个子数组中较短的那个执行快速排序
        if (pivot - left) < (right - pivot) {
            quickSortTailCall(nums: &nums, left: left, right: pivot - 1) // 递归排序左子数组
            left = pivot + 1 // 剩余未排序区间为 [pivot + 1, right]
        } else {
            quickSortTailCall(nums: &nums, left: pivot + 1, right: right) // 递归排序右子数组
            right = pivot - 1 // 剩余未排序区间为 [left, pivot - 1]
        }
    }
}

@main
enum QuickSort {
    /* Driver Code */
    static func main() {
        /* 快速排序 */
        var nums = [2, 4, 1, 0, 3, 5]
        quickSort(nums: &nums, left: nums.startIndex, right: nums.endIndex - 1)
        print("快速排序完成后 nums = \(nums)")

        /* 快速排序（中位基准数优化） */
        var nums1 = [2, 4, 1, 0, 3, 5]
        quickSortMedian(nums: &nums1, left: nums1.startIndex, right: nums1.endIndex - 1)
        print("快速排序（中位基准数优化）完成后 nums1 = \(nums1)")

        /* 快速排序（尾递归优化） */
        var nums2 = [2, 4, 1, 0, 3, 5]
        quickSortTailCall(nums: &nums2, left: nums2.startIndex, right: nums2.endIndex - 1)
        print("快速排序（尾递归优化）完成后 nums2 = \(nums2)")
    }
}
