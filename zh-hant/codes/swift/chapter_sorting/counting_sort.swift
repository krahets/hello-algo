/**
 * File: counting_sort.swift
 * Created Time: 2023-03-22
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 計數排序 */
// 簡單實現，無法用於排序物件
func countingSortNaive(nums: inout [Int]) {
    // 1. 統計陣列最大元素 m
    let m = nums.max()!
    // 2. 統計各數字的出現次數
    // counter[num] 代表 num 的出現次數
    var counter = Array(repeating: 0, count: m + 1)
    for num in nums {
        counter[num] += 1
    }
    // 3. 走訪 counter ，將各元素填入原陣列 nums
    var i = 0
    for num in 0 ..< m + 1 {
        for _ in 0 ..< counter[num] {
            nums[i] = num
            i += 1
        }
    }
}

/* 計數排序 */
// 完整實現，可排序物件，並且是穩定排序
func countingSort(nums: inout [Int]) {
    // 1. 統計陣列最大元素 m
    let m = nums.max()!
    // 2. 統計各數字的出現次數
    // counter[num] 代表 num 的出現次數
    var counter = Array(repeating: 0, count: m + 1)
    for num in nums {
        counter[num] += 1
    }
    // 3. 求 counter 的前綴和，將“出現次數”轉換為“尾索引”
    // 即 counter[num]-1 是 num 在 res 中最後一次出現的索引
    for i in 0 ..< m {
        counter[i + 1] += counter[i]
    }
    // 4. 倒序走訪 nums ，將各元素填入結果陣列 res
    // 初始化陣列 res 用於記錄結果
    var res = Array(repeating: 0, count: nums.count)
    for i in nums.indices.reversed() {
        let num = nums[i]
        res[counter[num] - 1] = num // 將 num 放置到對應索引處
        counter[num] -= 1 // 令前綴和自減 1 ，得到下次放置 num 的索引
    }
    // 使用結果陣列 res 覆蓋原陣列 nums
    for i in nums.indices {
        nums[i] = res[i]
    }
}

@main
enum CountingSort {
    /* Driver Code */
    static func main() {
        var nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4]
        countingSortNaive(nums: &nums)
        print("計數排序（無法排序物件）完成後 nums = \(nums)")

        var nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4]
        countingSort(nums: &nums1)
        print("計數排序完成後 nums1 = \(nums1)")
    }
}
