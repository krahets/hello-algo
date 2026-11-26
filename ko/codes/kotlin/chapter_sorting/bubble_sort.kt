/**
 * File: bubble_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* 버블 정렬 */
fun bubbleSort(nums: IntArray) {
    // 바깥 루프: 미정렬 구간은 [0, i]
    for (i in nums.size - 1 downTo 1) {
        // 안쪽 루프: 미정렬 구간 [0, i]의 최댓값을 교환을 통해 구간의 오른쪽 끝으로 이동
        for (j in 0..<i) {
            if (nums[j] > nums[j + 1]) {
                // nums[j]와 nums[j + 1] 교환
                val temp = nums[j]
                nums[j] = nums[j + 1]
                nums[j + 1] = temp
            }
        }
    }
}

/* 플래그로 최적화한 버블 정렬 */
fun bubbleSortWithFlag(nums: IntArray) {
    // 바깥 루프: 미정렬 구간은 [0, i]
    for (i in nums.size - 1 downTo 1) {
        var flag = false // 플래그 초기화
        // 안쪽 루프: 미정렬 구간 [0, i]의 최댓값을 교환을 통해 구간의 오른쪽 끝으로 이동
        for (j in 0..<i) {
            if (nums[j] > nums[j + 1]) {
                // nums[j]와 nums[j + 1] 교환
                val temp = nums[j]
                nums[j] = nums[j + 1]
                nums[j + 1] = temp
                flag = true // 원소가 교환되었음을 기록
            }
        }
        if (!flag) break // 이 회전에서 교환이 한 번도 없으면 바로 종료
    }
}

/* 실행 예제 */
fun main() {
    val nums = intArrayOf(4, 1, 3, 1, 5, 2)
    bubbleSort(nums)
    println("버블 정렬 후 nums = ${nums.contentToString()}")

    val nums1 = intArrayOf(4, 1, 3, 1, 5, 2)
    bubbleSortWithFlag(nums1)
    println("버블 정렬 후 nums1 = ${nums1.contentToString()}")
}