/**
 * File: merge_sort.swift
 * Created Time: 2023-01-29
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 合併左子陣列和右子陣列 */
func merge(nums: inout [Int], left: Int, mid: Int, right: Int) {
    // 左子陣列區間為 [left, mid], 右子陣列區間為 [mid+1, right]
    // 建立一個臨時陣列 tmp ，用於存放合併後的結果
    var tmp = Array(repeating: 0, count: right - left + 1)
    // 初始化左子陣列和右子陣列的起始索引
    var i = left, j = mid + 1, k = 0
    // 當左右子陣列都還有元素時，進行比較並將較小的元素複製到臨時陣列中
    while i <= mid, j <= right {
        if nums[i] <= nums[j] {
            tmp[k] = nums[i]
            i += 1
        } else {
            tmp[k] = nums[j]
            j += 1
        }
        k += 1
    }
    // 將左子陣列和右子陣列的剩餘元素複製到臨時陣列中
    while i <= mid {
        tmp[k] = nums[i]
        i += 1
        k += 1
    }
    while j <= right {
        tmp[k] = nums[j]
        j += 1
        k += 1
    }
    // 將臨時陣列 tmp 中的元素複製回原陣列 nums 的對應區間
    for k in tmp.indices {
        nums[left + k] = tmp[k]
    }
}

/* 合併排序 */
func mergeSort(nums: inout [Int], left: Int, right: Int) {
    // 終止條件
    if left >= right { // 當子陣列長度為 1 時終止遞迴
        return
    }
    // 劃分階段
    let mid = left + (right - left) / 2 // 計算中點
    mergeSort(nums: &nums, left: left, right: mid) // 遞迴左子陣列
    mergeSort(nums: &nums, left: mid + 1, right: right) // 遞迴右子陣列
    // 合併階段
    merge(nums: &nums, left: left, mid: mid, right: right)
}

@main
enum MergeSort {
    /* Driver Code */
    static func main() {
        /* 合併排序 */
        var nums = [7, 3, 2, 6, 0, 1, 5, 4]
        mergeSort(nums: &nums, left: nums.startIndex, right: nums.endIndex - 1)
        print("合併排序完成後 nums = \(nums)")
    }
}
