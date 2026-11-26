/**
 * File: merge_sort.swift
 * Created Time: 2023-01-29
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 合併左、右子陣列 */
func merge(nums: inout [Int], left: Int, mid: Int, right: Int) {
    // 左子陣列的區間為 [left, mid]，右子陣列的區間為 [mid+1, right]
    // 建立暫存陣列 tmp，用來存放合併結果
    var tmp = Array(repeating: 0, count: right - left + 1)
    // 設定左、右子陣列的起始索引
    var i = left, j = mid + 1, k = 0
    // 當左、右子陣列都還有元素時，比較兩邊的元素，將較小的元素複製到暫存陣列
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
    // 將左、右子陣列中剩餘的元素複製到暫存陣列
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
    // 將暫存陣列 tmp 的元素複製回原陣列 nums 的對應區間
    for k in tmp.indices {
        nums[left + k] = tmp[k]
    }
}

/* 合併排序 */
func mergeSort(nums: inout [Int], left: Int, right: Int) {
    // 終止條件
    if left >= right { // 當子陣列的長度為 1 時，終止遞迴
        return
    }
    // 分割階段
    let mid = left + (right - left) / 2 // 計算中點
    mergeSort(nums: &nums, left: left, right: mid) // 遞迴處理左子陣列
    mergeSort(nums: &nums, left: mid + 1, right: right) // 遞迴處理右子陣列
    // 合併階段
    merge(nums: &nums, left: left, mid: mid, right: right)
}

@main
enum MergeSort {
    /* 主程式 */
    static func main() {
        /* 合併排序 */
        var nums = [7, 3, 2, 6, 0, 1, 5, 4]
        mergeSort(nums: &nums, left: nums.startIndex, right: nums.endIndex - 1)
        print("合併排序完成後 nums = \(nums)")
    }
}
