/**
 * File: two_sum.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_searching

/* Метод 1: полный перебор */
fun twoSumBruteForce(nums: IntArray, target: Int): IntArray {
    val size = nums.size
    // Два вложенных цикла, временная сложность O(n^2)
    for (i in 0..<size - 1) {
        for (j in i + 1..<size) {
            if (nums[i] + nums[j] == target) return intArrayOf(i, j)
        }
    }
    return IntArray(0)
}

/* Метод 2: вспомогательная хеш-таблица */
fun twoSumHashTable(nums: IntArray, target: Int): IntArray {
    val size = nums.size
    // Вспомогательная хеш-таблица, пространственная сложность O(n)
    val dic = HashMap<Int, Int>()
    // Один цикл, временная сложность O(n)
    for (i in 0..<size) {
        if (dic.containsKey(target - nums[i])) {
            return intArrayOf(dic[target - nums[i]]!!, i)
        }
        dic[nums[i]] = i
    }
    return IntArray(0)
}

/* Driver Code */
fun main() {
    // ======= Test Case =======
    val nums = intArrayOf(2, 7, 11, 15)
    val target = 13

    // ====== Основной код ======
    // Метод 1
    var res = twoSumBruteForce(nums, target)
    println("Результат метода 1 res = ${res.contentToString()}")
    // Метод 2
    res = twoSumHashTable(nums, target)
    println("Результат метода 2 res = ${res.contentToString()}")
}