/**
 * File: radix_sort.swift
 * Created Time: 2023-01-29
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 取得元素 num 的第 k 位數字，其中 exp = 10^(k-1) */
func digit(num: Int, exp: Int) -> Int {
    // 傳入 exp 而非 k，可避免在此重複執行成本較高的次方運算
    (num / exp) % 10
}

/* 計數排序（依 nums 中各元素的第 k 位數字排序） */
func countingSortDigit(nums: inout [Int], exp: Int) {
    // 十進位的每個數位介於 0~9 之間，因此需要長度為 10 的桶陣列
    var counter = Array(repeating: 0, count: 10)
    // 統計 0~9 各數字出現的次數
    for i in nums.indices {
        let d = digit(num: nums[i], exp: exp) // 取得 nums[i] 的第 k 位數字，記為 d
        counter[d] += 1 // 統計數字 d 出現的次數
    }
    // 計算前綴和，將「出現次數」轉為「陣列索引」
    for i in 1 ..< 10 {
        counter[i] += counter[i - 1]
    }
    // 反向走訪，依桶內的統計結果將各元素填入 res
    var res = Array(repeating: 0, count: nums.count)
    for i in nums.indices.reversed() {
        let d = digit(num: nums[i], exp: exp)
        let j = counter[d] - 1 // 取得 d 在陣列中的索引 j
        res[j] = nums[i] // 將目前的元素填入索引 j 的位置
        counter[d] -= 1 // 將 d 的數量減 1
    }
    // 用結果覆寫原陣列 nums
    for i in nums.indices {
        nums[i] = res[i]
    }
}

/* 基數排序 */
func radixSort(nums: inout [Int]) {
    // 取得陣列中的最大元素，用來判斷最多有幾位數
    var m = Int.min
    for num in nums {
        if num > m {
            m = num
        }
    }
    // 依序從最低位走訪到最高位
    for exp in sequence(first: 1, next: { m >= ($0 * 10) ? $0 * 10 : nil }) {
        // 依陣列元素的第 k 位數字執行計數排序
        // k = 1 -> exp = 1
        // k = 2 -> exp = 10
        // 即 exp = 10^(k-1)
        countingSortDigit(nums: &nums, exp: exp)
    }
}

@main
enum RadixSort {
    /* 主程式 */
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
