/**
 * File: selection_sort.swift
 * Created Time: 2023-05-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 選擇排序 */
func selectionSort(nums: inout [Int]) {
    // 外迴圈：未排序區間為 [i, n-1]
    for i in nums.indices.dropLast() {
        // 內迴圈：找到未排序區間內的最小元素
        var k = i
        for j in nums.indices.dropFirst(i + 1) {
            if nums[j] < nums[k] {
                k = j // 記錄最小元素的索引
            }
        }
        // 將該最小元素與未排序區間的首個元素交換
        nums.swapAt(i, k)
    }
}

@main
enum SelectionSort {
    /* Driver Code */
    static func main() {
        var nums = [4, 1, 3, 1, 5, 2]
        selectionSort(nums: &nums)
        print("選擇排序完成後 nums = \(nums)")
    }
}
