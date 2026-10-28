/**
 * File: worst_best_time_complexity.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_computational_complexity.worst_best_time_complexity

/* 원소가 { 1, 2, ..., n }이며 순서가 섞인 배열 생성 */
fun randomNumbers(n: Int): Array<Int?> {
    val nums = IntArray(n)
    // 배열 nums = { 1, 2, 3, ..., n }을 생성한다
    for (i in 0..<n) {
        nums[i] = i + 1
    }
    // 배열 원소를 무작위로 섞는다
    nums.shuffle()
    val res = arrayOfNulls<Int>(n)
    for (i in 0..<n) {
        res[i] = nums[i]
    }
    return res
}

/* 배열 nums에서 숫자 1이 있는 인덱스 탐색 */
fun findOne(nums: Array<Int?>): Int {
    for (i in nums.indices) {
        // 원소 1이 배열 맨 앞에 있으면 최선 시간 복잡도 O(1)에 도달한다
        // 원소 1이 배열 맨 뒤에 있으면 최악 시간 복잡도 O(n)에 도달한다
        if (nums[i] == 1)
            return i
    }
    return -1
}

/* 실행 코드 */
fun main() {
    for (i in 0..9) {
        val n = 100
        val nums = randomNumbers(n)
        val index = findOne(nums)
        println("\n배열 [ 1, 2, ..., n ]을 섞은 후 = ${nums.contentToString()}")
        println("숫자 1의 인덱스 = $index")
    }
}