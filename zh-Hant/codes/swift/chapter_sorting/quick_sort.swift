/**
 * File: quick_sort.swift
 * Created Time: 2023-01-29
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 快速排序類別 */
/* 哨兵劃分 */
func partition(nums: inout [Int], left: Int, right: Int) -> Int {
    // 以 nums[left] 為基準數
    var i = left
    var j = right
    while i < j {
        while i < j, nums[j] >= nums[left] {
            j -= 1 // 從右向左找首個小於基準數的元素
        }
        while i < j, nums[i] <= nums[left] {
            i += 1 // 從左向右找首個大於基準數的元素
        }
        nums.swapAt(i, j) // 交換這兩個元素
    }
    nums.swapAt(i, left) // 將基準數交換至兩子陣列的分界線
    return i // 返回基準數的索引
}

/* 快速排序 */
func quickSort(nums: inout [Int], left: Int, right: Int) {
    // 子陣列長度為 1 時終止遞迴
    if left >= right {
        return
    }
    // 哨兵劃分
    let pivot = partition(nums: &nums, left: left, right: right)
    // 遞迴左子陣列、右子陣列
    quickSort(nums: &nums, left: left, right: pivot - 1)
    quickSort(nums: &nums, left: pivot + 1, right: right)
}

/* 快速排序類別（中位基準數最佳化） */
/* 選取三個候選元素的中位數 */
func medianThree(nums: [Int], left: Int, mid: Int, right: Int) -> Int {
    let l = nums[left]
    let m = nums[mid]
    let r = nums[right]
    if (l <= m && m <= r) || (r <= m && m <= l) {
        return mid // m 在 l 和 r 之間
    }
    if (m <= l && l <= r) || (r <= l && l <= m) {
        return left // l 在 m 和 r 之間
    }
    return right
}

/* 哨兵劃分（三數取中值） */
func partitionMedian(nums: inout [Int], left: Int, right: Int) -> Int {
    // 選取三個候選元素的中位數
    let med = medianThree(nums: nums, left: left, mid: (left + right) / 2, right: right)
    // 將中位數交換至陣列最左端
    nums.swapAt(left, med)
    return partition(nums: &nums, left: left, right: right)
}

/* 快速排序（中位基準數最佳化） */
func quickSortMedian(nums: inout [Int], left: Int, right: Int) {
    // 子陣列長度為 1 時終止遞迴
    if left >= right {
        return
    }
    // 哨兵劃分
    let pivot = partitionMedian(nums: &nums, left: left, right: right)
    // 遞迴左子陣列、右子陣列
    quickSortMedian(nums: &nums, left: left, right: pivot - 1)
    quickSortMedian(nums: &nums, left: pivot + 1, right: right)
}

/* 快速排序（尾遞迴最佳化） */
func quickSortTailCall(nums: inout [Int], left: Int, right: Int) {
    var left = left
    var right = right
    // 子陣列長度為 1 時終止
    while left < right {
        // 哨兵劃分操作
        let pivot = partition(nums: &nums, left: left, right: right)
        // 對兩個子陣列中較短的那個執行快速排序
        if (pivot - left) < (right - pivot) {
            quickSortTailCall(nums: &nums, left: left, right: pivot - 1) // 遞迴排序左子陣列
            left = pivot + 1 // 剩餘未排序區間為 [pivot + 1, right]
        } else {
            quickSortTailCall(nums: &nums, left: pivot + 1, right: right) // 遞迴排序右子陣列
            right = pivot - 1 // 剩餘未排序區間為 [left, pivot - 1]
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
        print("快速排序完成後 nums = \(nums)")

        /* 快速排序（中位基準數最佳化） */
        var nums1 = [2, 4, 1, 0, 3, 5]
        quickSortMedian(nums: &nums1, left: nums1.startIndex, right: nums1.endIndex - 1)
        print("快速排序（中位基準數最佳化）完成後 nums1 = \(nums1)")

        /* 快速排序（尾遞迴最佳化） */
        var nums2 = [2, 4, 1, 0, 3, 5]
        quickSortTailCall(nums: &nums2, left: nums2.startIndex, right: nums2.endIndex - 1)
        print("快速排序（尾遞迴最佳化）完成後 nums2 = \(nums2)")
    }
}
