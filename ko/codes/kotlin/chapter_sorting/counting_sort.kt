/**
 * File: counting_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

import kotlin.math.max

/* 계수 정렬 */
// 객체를 정렬할 수 없는 간단한 구현
fun countingSortNaive(nums: IntArray) {
    // 1. 배열의 최댓값 m 구하기
    var m = 0
    for (num in nums) {
        m = max(m, num)
    }
    // 2. 각 숫자의 출현 횟수 세기
    // counter[num]은 num의 출현 횟수
    val counter = IntArray(m + 1)
    for (num in nums) {
        counter[num]++
    }
    // 3. counter를 순회하며 각 원소를 원래 배열 nums에 채우기
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
// 객체도 정렬할 수 있는 안정 정렬의 전체 구현
fun countingSort(nums: IntArray) {
    // 1. 배열의 최댓값 m 구하기
    var m = 0
    for (num in nums) {
        m = max(m, num)
    }
    // 2. 각 숫자의 출현 횟수 세기
    // counter[num]은 num의 출현 횟수
    val counter = IntArray(m + 1)
    for (num in nums) {
        counter[num]++
    }
    // 3. counter의 누적합을 구해 ‘출현 횟수’를 ‘끝 위치’로 변환
    // 즉, counter[num]-1은 res에서 num이 마지막으로 나타나는 인덱스
    for (i in 0..<m) {
        counter[i + 1] += counter[i]
    }
    // 4. nums를 역순으로 순회하며 각 원소를 결과 배열 res에 채우기
    // 결과를 기록할 배열 res 초기화
    val n = nums.size
    val res = IntArray(n)
    for (i in n - 1 downTo 0) {
        val num = nums[i]
        res[counter[num] - 1] = num // num을 해당 인덱스에 배치
        counter[num]-- // 누적합을 1 줄여 다음 num을 배치할 인덱스 구하기
    }
    // 결과 배열 res로 원래 배열 nums를 덮어쓰기
    for (i in 0..<n) {
        nums[i] = res[i]
    }
}

/* 실행 예제 */
fun main() {
    val nums = intArrayOf(1, 0, 1, 2, 0, 4, 0, 2, 2, 4)
    countingSortNaive(nums)
    println("계수 정렬(객체 정렬 불가) 후 nums = ${nums.contentToString()}")

    val nums1 = intArrayOf(1, 0, 1, 2, 0, 4, 0, 2, 2, 4)
    countingSort(nums1)
    println("계수 정렬 후 nums1 = ${nums1.contentToString()}")
}