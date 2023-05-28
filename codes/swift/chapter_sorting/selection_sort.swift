/**
 * File: selection_sort.swift
 * Created Time: 2023-05-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 选择排序 */
func selectionSort(nums: inout [Int]) {
    // 外循环：未排序区间为 [i, n-1]
    for i in nums.indices.dropLast() {
        // 内循环：找到未排序区间内的最小元素
        var k = i
        for j in nums.indices.dropFirst(i + 1) {
            if nums[j] < nums[k] {
                k = j // 记录最小元素的索引
            }
        }
        // 将该最小元素与未排序区间的首个元素交换
        nums.swapAt(i, k)
    }
}

@main
enum SelectionSort {
    /* Driver Code */
    static func main() {
        var nums = [4, 1, 3, 1, 5, 2]
        selectionSort(nums: &nums)
        print("选择排序完成后 nums = \(nums)")
    }
}
