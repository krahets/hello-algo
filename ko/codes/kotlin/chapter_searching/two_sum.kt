/**
 * File: two_sum.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_searching

/* 방법 1. 모든 조합 확인 */
fun twoSumBruteForce(nums: IntArray, target: Int): IntArray {
    val size = nums.size
    // 이중 반복문을 사용하므로 시간 복잡도는 O(n^2)이다.
    for (i in 0..<size - 1) {
        for (j in i + 1..<size) {
            if (nums[i] + nums[j] == target) return intArrayOf(i, j)
        }
    }
    return IntArray(0)
}

/* 방법 2. 보조 해시 테이블 사용 */
fun twoSumHashTable(nums: IntArray, target: Int): IntArray {
    val size = nums.size
    // 보조 해시 테이블을 사용하므로 공간 복잡도는 O(n)이다.
    val dic = HashMap<Int, Int>()
    // 반복문 하나만 사용하므로 시간 복잡도는 O(n)이다.
    for (i in 0..<size) {
        if (dic.containsKey(target - nums[i])) {
            return intArrayOf(dic[target - nums[i]]!!, i)
        }
        dic[nums[i]] = i
    }
    return IntArray(0)
}

/* 실행 예제 */
fun main() {
    // ======= 테스트 케이스 =======
    val nums = intArrayOf(2, 7, 11, 15)
    val target = 13

    // ====== 실행 예제 ======
    // 방법 1
    var res = twoSumBruteForce(nums, target)
    println("방법 1 res = ${res.contentToString()}")
    // 방법 2
    res = twoSumHashTable(nums, target)
    println("방법 2 res = ${res.contentToString()}")
}