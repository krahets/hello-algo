/**
 * File: two_sum.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_searching

/* 방법 1: 완전 열거 */
fun twoSumBruteForce(nums: IntArray, target: Int): IntArray {
    val size = nums.size
    // 이중 반복문이며 시간 복잡도는 O(n^2)이다
    for (i in 0..<size - 1) {
        for (j in i + 1..<size) {
            if (nums[i] + nums[j] == target) return intArrayOf(i, j)
        }
    }
    return IntArray(0)
}

/* 방법 2: 보조 해시 테이블 */
fun twoSumHashTable(nums: IntArray, target: Int): IntArray {
    val size = nums.size
    // 보조 해시 테이블의 공간 복잡도는 O(n)이다
    val dic = HashMap<Int, Int>()
    // 단일 반복문이며 시간 복잡도는 O(n)이다
    for (i in 0..<size) {
        if (dic.containsKey(target - nums[i])) {
            return intArrayOf(dic[target - nums[i]]!!, i)
        }
        dic[nums[i]] = i
    }
    return IntArray(0)
}

/* 실행 코드 */
fun main() {
    // ======= 테스트 사례 =======
    val nums = intArrayOf(2, 7, 11, 15)
    val target = 13

    // ====== 실행 코드 ======
    // 방법 1
    var res = twoSumBruteForce(nums, target)
    println("방법 1 res = ${res.contentToString()}")
    // 방법 2
    res = twoSumHashTable(nums, target)
    println("방법 2 res = ${res.contentToString()}")
}