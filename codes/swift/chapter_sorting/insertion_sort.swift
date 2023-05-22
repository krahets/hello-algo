/**
 * File: insertion_sort.swift
 * Created Time: 2023-01-29
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 插入排序 */
func insertionSort(nums: inout [Int]) {
    // 外循环：已排序元素数量为 1, 2, ..., n
    for i in stride(from: 1, to: nums.count, by: 1) {
        let base = nums[i]
        var j = i - 1
        // 内循环：将 base 插入到已排序部分的正确位置
        while j >= 0, nums[j] > base {
            nums[j + 1] = nums[j] // 将 nums[j] 向右移动一位
            j -= 1
        }
        nums[j + 1] = base // 将 base 赋值到正确位置
    }
}

@main
enum InsertionSort {
    /* Driver Code */
    static func main() {
        var nums = [4, 1, 3, 1, 5, 2]
        insertionSort(nums: &nums)
        print("插入排序完成后 nums = \(nums)")
    }
}
