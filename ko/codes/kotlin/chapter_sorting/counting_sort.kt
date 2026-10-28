/**
 * File: counting_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

import kotlin.math.max

/* 계수 정렬 */
// 간단한 구현이며, 객체 정렬에는 사용할 수 없다
fun countingSortNaive(nums: IntArray) {
    // 1. 배열의 최댓값 m을 구한다
    var m = 0
    for (num in nums) {
        m = max(m, num)
    }
    // 2. 각 숫자의 등장 횟수를 센다
    // counter[num]은 num의 등장 횟수를 나타낸다
    val counter = IntArray(m + 1)
    for (num in nums) {
        counter[num]++
    }
    // 3. counter를 순회하며 각 원소를 원래 배열 nums에 채운다
    var i = 0
    for (num in 0..<m + 1) {
        var j = 0
        while (j < counter[num]) {
            nums[i] = num
            j++
            i++
        }
    }
}

/* 계수 정렬 */
// 완전한 구현이며, 객체를 정렬할 수 있고 안정 정렬이다
fun countingSort(nums: IntArray) {
    // 1. 배열의 최댓값 m을 구한다
    var m = 0
    for (num in nums) {
        m = max(m, num)
    }
    // 2. 각 숫자의 등장 횟수를 센다
    // counter[num]은 num의 등장 횟수를 나타낸다
    val counter = IntArray(m + 1)
    for (num in nums) {
        counter[num]++
    }
    // 3. counter의 접두 합을 구하여 등장 횟수를 마지막 인덱스로 변환한다
    // 즉, counter[num]-1은 res에서 num이 마지막으로 등장하는 인덱스이다
    for (i in 0..<m) {
        counter[i + 1] += counter[i]
    }
    // 4. nums를 역순으로 순회하며 각 원소를 결과 배열 res에 채운다
    // 결과를 기록할 배열 res를 초기화한다
    val n = nums.size
    val res = IntArray(n)
    for (i in n - 1 downTo 0) {
        val num = nums[i]
        res[counter[num] - 1] = num // num을 해당 인덱스에 배치한다
        counter[num]-- // 접두 합을 1 감소시켜 다음에 num을 배치할 인덱스를 구한다
    }
    // 결과 배열 res로 원래 배열 nums를 덮어쓴다
    for (i in 0..<n) {
        nums[i] = res[i]
    }
}

/* 실행 코드 */
fun main() {
    val nums = intArrayOf(1, 0, 1, 2, 0, 4, 0, 2, 2, 4)
    countingSortNaive(nums)
    println("계수 정렬(객체 정렬 불가) 후 nums = ${nums.contentToString()}")

    val nums1 = intArrayOf(1, 0, 1, 2, 0, 4, 0, 2, 2, 4)
    countingSort(nums1)
    println("계수 정렬 후 nums1 = ${nums1.contentToString()}")
}