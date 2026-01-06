/**
 * File: radix_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* Get the k-th digit of element num, where exp = 10^(k-1) */
fun digit(num: Int, exp: Int): Int {
    // Passing exp instead of k can avoid repeated expensive exponentiation here
    return (num / exp) % 10
}

/* Counting sort (based on nums k-th digit) */
fun countingSortDigit(nums: IntArray, exp: Int) {
    // Decimal digit range is 0~9, therefore need a bucket array of length 10
    val counter = IntArray(10)
    val n = nums.size
    // Count the occurrence of digits 0~9
    for (i in 0..<n) {
        val d = digit(nums[i], exp) // Get the k-th digit of nums[i], noted as d
        counter[d]++                // Count the occurrence of digit d
    }
    // Calculate prefix sum, converting "occurrence count" into "array index"
    for (i in 1..9) {
        counter[i] += counter[i - 1]
    }
    // Traverse in reverse, based on bucket statistics, place each element into res
    val res = IntArray(n)
    for (i in n - 1 downTo 0) {
        val d = digit(nums[i], exp)
        val j = counter[d] - 1 // Get the index j for d in the array
        res[j] = nums[i]       // Place the current element at index j
        counter[d]--           // Decrease the count of d by 1
    }
    // Use result to overwrite the original array nums
    for (i in 0..<n)
        nums[i] = res[i]
}

/* Radix sort */
fun radixSort(nums: IntArray) {
    // Get the maximum element of the array, used to determine the maximum number of digits
    var m = Int.MIN_VALUE
    for (num in nums) if (num > m) m = num
    var exp = 1
    // Traverse from the lowest to the highest digit
    while (exp <= m) {
        // Perform counting sort on the k-th digit of array elements
        // k = 1 -> exp = 1
        // k = 2 -> exp = 10
        // i.e., exp = 10^(k-1)
        countingSortDigit(nums, exp)
        exp *= 10
    }
}

/* Driver Code */
fun main() {
    // Radix sort
    val nums = intArrayOf(
        10546151, 35663510, 42865989, 34862445, 81883077,
        88906420, 72429244, 30524779, 82060337, 63832996
    )
    radixSort(nums)
    println("After radix sort, nums = ${nums.contentToString()}")
}