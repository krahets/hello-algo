/**
 * File: selection_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* 선택 정렬 */
fun selectionSort(nums: IntArray) {
    val n = nums.size
    // 바깥 루프: 미정렬 구간은 [i, n-1]
    for (i in 0..<n - 1) {
        var k = i
        // 안쪽 루프: 미정렬 구간에서 최솟값 찾기
        for (j in i + 1..<n) {
            if (nums[j] < nums[k])
                k = j // 최솟값의 인덱스 기록
        }
        // 최솟값과 미정렬 구간의 첫 원소 교환
        val temp = nums[i]
        nums[i] = nums[k]
        nums[k] = temp
    }
}

/* 실행 예제 */
fun main() {
    val nums = intArrayOf(4, 1, 3, 1, 5, 2)
    selectionSort(nums)
    println("선택 정렬 후 nums = ${nums.contentToString()}")
}