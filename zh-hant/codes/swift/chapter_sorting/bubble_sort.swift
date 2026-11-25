/**
 * File: bubble_sort.swift
 * Created Time: 2023-01-29
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 氣泡排序 */
func bubbleSort(nums: inout [Int]) {
    // 外層迴圈：尚未排序的區間為 [0, i]
    for i in nums.indices.dropFirst().reversed() {
        // 內層迴圈：逐次交換，將未排序區間 [0, i] 中的最大元素移到區間最右端
        for j in 0 ..< i {
            if nums[j] > nums[j + 1] {
                // 交換 nums[j] 與 nums[j + 1]
                nums.swapAt(j, j + 1)
            }
        }
    }
}

/* 氣泡排序（以旗標最佳化）*/
func bubbleSortWithFlag(nums: inout [Int]) {
    // 外層迴圈：尚未排序的區間為 [0, i]
    for i in nums.indices.dropFirst().reversed() {
        var flag = false // 初始化旗標
        for j in 0 ..< i {
            if nums[j] > nums[j + 1] {
                // 交換 nums[j] 與 nums[j + 1]
                nums.swapAt(j, j + 1)
                flag = true // 記錄本輪曾交換元素
            }
        }
        if !flag { // 這一輪「冒泡」未交換任何元素，直接跳出迴圈
            break
        }
    }
}

@main
enum BubbleSort {
    /* 主程式 */
    static func main() {
        var nums = [4, 1, 3, 1, 5, 2]
        bubbleSort(nums: &nums)
        print("氣泡排序完成後 nums = \(nums)")

        var nums1 = [4, 1, 3, 1, 5, 2]
        bubbleSortWithFlag(nums: &nums1)
        print("氣泡排序完成後 nums1 = \(nums1)")
    }
}
