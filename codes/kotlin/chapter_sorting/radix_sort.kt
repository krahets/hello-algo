/**
 * File: radix_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* 获取元素 num 的第 k 位，其中 exp = 10^(k-1) */
fun digit(num: Int, exp: Int): Int {
    // 传入 exp 而非 k 可以避免在此重复执行昂贵的次方计算
    return (num / exp) % 10
}

/* 计数排序（根据 nums 第 k 位排序） */
fun countingSortDigit(nums: IntArray, exp: Int) {
    // 十进制的位范围为 0~9 ，因此需要长度为 10 的桶数组
    val counter = IntArray(10)
    val n = nums.size
    // 统计 0~9 各数字的出现次数
    for (i in 0..<n) {
        val d = digit(nums[i], exp) // 获取 nums[i] 第 k 位，记为 d
        counter[d]++                // 统计数字 d 的出现次数
    }
    // 求前缀和，将“出现个数”转换为“数组索引”
    for (i in 1..9) {
        counter[i] += counter[i - 1]
    }
    // 倒序遍历，根据桶内统计结果，将各元素填入 res
    val res = IntArray(n)
    for (i in n - 1 downTo 0) {
        val d = digit(nums[i], exp)
        val j = counter[d] - 1 // 获取 d 在数组中的索引 j
        res[j] = nums[i]       // 将当前元素填入索引 j
        counter[d]--           // 将 d 的数量减 1
    }
    // 使用结果覆盖原数组 nums
    for (i in 0..<n)
        nums[i] = res[i]
}

/* 基数排序 */
fun radixSort(nums: IntArray) {
    // 获取数组的最大元素，用于判断最大位数
    var m = Int.MIN_VALUE
    for (num in nums) if (num > m) m = num
    var exp = 1
    // 按照从低位到高位的顺序遍历
    while (exp <= m) {
        // 对数组元素的第 k 位执行计数排序
        // k = 1 -> exp = 1
        // k = 2 -> exp = 10
        // 即 exp = 10^(k-1)
        countingSortDigit(nums, exp)
        exp *= 10
    }
}

/* Driver Code */
fun main() {
    // 基数排序
    val nums = intArrayOf(
        10546151, 35663510, 42865989, 34862445, 81883077,
        88906420, 72429244, 30524779, 82060337, 63832996
    )
    radixSort(nums)
    println("基数排序完成后 nums = ${nums.contentToString()}")
}