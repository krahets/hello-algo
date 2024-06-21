/**
 * File: radix_sort.swift
 * Created Time: 2023-01-29
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 獲取元素 num 的第 k 位，其中 exp = 10^(k-1) */
func digit(num: Int, exp: Int) -> Int {
    // 傳入 exp 而非 k 可以避免在此重複執行昂貴的次方計算
    (num / exp) % 10
}

/* 計數排序（根據 nums 第 k 位排序） */
func countingSortDigit(nums: inout [Int], exp: Int) {
    // 十進位制的位範圍為 0~9 ，因此需要長度為 10 的桶陣列
    var counter = Array(repeating: 0, count: 10)
    // 統計 0~9 各數字的出現次數
    for i in nums.indices {
        let d = digit(num: nums[i], exp: exp) // 獲取 nums[i] 第 k 位，記為 d
        counter[d] += 1 // 統計數字 d 的出現次數
    }
    // 求前綴和，將“出現個數”轉換為“陣列索引”
    for i in 1 ..< 10 {
        counter[i] += counter[i - 1]
    }
    // 倒序走訪，根據桶內統計結果，將各元素填入 res
    var res = Array(repeating: 0, count: nums.count)
    for i in nums.indices.reversed() {
        let d = digit(num: nums[i], exp: exp)
        let j = counter[d] - 1 // 獲取 d 在陣列中的索引 j
        res[j] = nums[i] // 將當前元素填入索引 j
        counter[d] -= 1 // 將 d 的數量減 1
    }
    // 使用結果覆蓋原陣列 nums
    for i in nums.indices {
        nums[i] = res[i]
    }
}

/* 基數排序 */
func radixSort(nums: inout [Int]) {
    // 獲取陣列的最大元素，用於判斷最大位數
    var m = Int.min
    for num in nums {
        if num > m {
            m = num
        }
    }
    // 按照從低位到高位的順序走訪
    for exp in sequence(first: 1, next: { m >= ($0 * 10) ? $0 * 10 : nil }) {
        // 對陣列元素的第 k 位執行計數排序
        // k = 1 -> exp = 1
        // k = 2 -> exp = 10
        // 即 exp = 10^(k-1)
        countingSortDigit(nums: &nums, exp: exp)
    }
}

@main
enum RadixSort {
    /* Driver Code */
    static func main() {
        // 基數排序
        var nums = [
            10_546_151,
            35_663_510,
            42_865_989,
            34_862_445,
            81_883_077,
            88_906_420,
            72_429_244,
            30_524_779,
            82_060_337,
            63_832_996,
        ]
        radixSort(nums: &nums)
        print("基數排序完成後 nums = \(nums)")
    }
}
