/**
 * File: radix_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* 獲取元素 num 的第 k 位，其中 exp = 10^(k-1) */
fun digit(num: Int, exp: Int): Int {
    // 傳入 exp 而非 k 可以避免在此重複執行昂貴的次方計算
    return (num / exp) % 10
}

/* 計數排序（根據 nums 第 k 位排序） */
fun countingSortDigit(nums: IntArray, exp: Int) {
    // 十進位制的位範圍為 0~9 ，因此需要長度為 10 的桶陣列
    val counter = IntArray(10)
    val n = nums.size
    // 統計 0~9 各數字的出現次數
    for (i in 0..<n) {
        val d = digit(nums[i], exp) // 獲取 nums[i] 第 k 位，記為 d
        counter[d]++                // 統計數字 d 的出現次數
    }
    // 求前綴和，將“出現個數”轉換為“陣列索引”
    for (i in 1..9) {
        counter[i] += counter[i - 1]
    }
    // 倒序走訪，根據桶內統計結果，將各元素填入 res
    val res = IntArray(n)
    for (i in n - 1 downTo 0) {
        val d = digit(nums[i], exp)
        val j = counter[d] - 1 // 獲取 d 在陣列中的索引 j
        res[j] = nums[i]       // 將當前元素填入索引 j
        counter[d]--           // 將 d 的數量減 1
    }
    // 使用結果覆蓋原陣列 nums
    for (i in 0..<n)
        nums[i] = res[i]
}

/* 基數排序 */
fun radixSort(nums: IntArray) {
    // 獲取陣列的最大元素，用於判斷最大位數
    var m = Int.MIN_VALUE
    for (num in nums) if (num > m) m = num
    var exp = 1
    // 按照從低位到高位的順序走訪
    while (exp <= m) {
        // 對陣列元素的第 k 位執行計數排序
        // k = 1 -> exp = 1
        // k = 2 -> exp = 10
        // 即 exp = 10^(k-1)
        countingSortDigit(nums, exp)
        exp *= 10
    }
}

/* Driver Code */
fun main() {
    // 基數排序
    val nums = intArrayOf(
        10546151, 35663510, 42865989, 34862445, 81883077,
        88906420, 72429244, 30524779, 82060337, 63832996
    )
    radixSort(nums)
    println("基數排序完成後 nums = ${nums.contentToString()}")
}