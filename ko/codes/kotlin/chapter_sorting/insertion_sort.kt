/**
 * File: insertion_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* 삽입 정렬 */
fun insertionSort(nums: IntArray) {
    //바깥 루프: 정렬된 원소 수는 1, 2, ..., n
    for (i in nums.indices) {
        val base = nums[i]
        var j = i - 1
        // 안쪽 루프: base를 정렬된 구간 [0, i-1]의 올바른 위치에 삽입
        while (j >= 0 && nums[j] > base) {
            nums[j + 1] = nums[j] // nums[j]를 오른쪽으로 한 칸 이동
            j--
        }
        nums[j + 1] = base        // 올바른 위치에 base 대입
    }
}

/* 실행 예제 */
fun main() {
    val nums = intArrayOf(4, 1, 3, 1, 5, 2)
    insertionSort(nums)
    println("삽입 정렬 후 nums = ${nums.contentToString()}")
}