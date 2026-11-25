/**
 * File: radix_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* 取得元素 num 的第 k 位數字，其中 exp = 10^(k-1) */
fun digit(num: Int, exp: Int): Int {
    // 傳入 exp 而非 k，可避免在此重複執行成本較高的次方運算
    return (num / exp) % 10
}

/* 計數排序（依 nums 中各元素的第 k 位數字排序） */
fun countingSortDigit(nums: IntArray, exp: Int) {
    // 十進位的每個數位介於 0~9 之間，因此需要長度為 10 的桶陣列
    val counter = IntArray(10)
    val n = nums.size
    // 統計 0~9 各數字出現的次數
    for (i in 0..<n) {
        val d = digit(nums[i], exp) // 取得 nums[i] 的第 k 位數字，記為 d
        counter[d]++                // 統計數字 d 出現的次數
    }
    // 計算前綴和，將「出現次數」轉為「陣列索引」
    for (i in 1..9) {
        counter[i] += counter[i - 1]
    }
    // 反向走訪，依桶內的統計結果將各元素填入 res
    val res = IntArray(n)
    for (i in n - 1 downTo 0) {
        val d = digit(nums[i], exp)
        val j = counter[d] - 1 // 取得 d 在陣列中的索引 j
        res[j] = nums[i]       // 將目前的元素填入索引 j 的位置
        counter[d]--           // 將 d 的數量減 1
    }
    // 用結果覆寫原陣列 nums
    for (i in 0..<n)
        nums[i] = res[i]
}

/* 基數排序 */
fun radixSort(nums: IntArray) {
    // 取得陣列中的最大元素，用來判斷最多有幾位數
    var m = Int.MIN_VALUE
    for (num in nums) if (num > m) m = num
    var exp = 1
    // 依序從最低位走訪到最高位
    while (exp <= m) {
        // 依陣列元素的第 k 位數字執行計數排序
        // k = 1 -> exp = 1
        // k = 2 -> exp = 10
        // 即 exp = 10^(k-1)
        countingSortDigit(nums, exp)
        exp *= 10
    }
}

/* 主程式 */
fun main() {
    // 基數排序
    val nums = intArrayOf(
        10546151, 35663510, 42865989, 34862445, 81883077,
        88906420, 72429244, 30524779, 82060337, 63832996
    )
    radixSort(nums)
    println("基數排序完成後 nums = ${nums.contentToString()}")
}