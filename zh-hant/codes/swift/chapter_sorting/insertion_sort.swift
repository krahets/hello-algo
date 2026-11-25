/**
 * File: insertion_sort.swift
 * Created Time: 2023-01-29
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 插入排序 */
func insertionSort(nums: inout [Int]) {
    // 外層迴圈：已排序的區間為 [0, i-1]
    for i in nums.indices.dropFirst() {
        let base = nums[i]
        var j = i - 1
        // 內層迴圈：將 base 插入已排序區間 [0, i-1] 中的正確位置
        while j >= 0, nums[j] > base {
            nums[j + 1] = nums[j] // 將 nums[j] 向右移動一格
            j -= 1
        }
        nums[j + 1] = base // 將 base 寫入正確位置
    }
}

@main
enum InsertionSort {
    /* 主程式 */
    static func main() {
        var nums = [4, 1, 3, 1, 5, 2]
        insertionSort(nums: &nums)
        print("插入排序完成後 nums = \(nums)")
    }
}
