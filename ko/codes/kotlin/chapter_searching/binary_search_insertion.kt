/**
 * File: binary_search_insertion.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_searching

/* 이진 탐색으로 삽입 위치 찾기(중복 원소가 없는 경우) */
fun binarySearchInsertionSimple(nums: IntArray, target: Int): Int {
    var i = 0
    var j = nums.size - 1 // 닫힌구간 [0, n-1]을 초기화한다.
    while (i <= j) {
        val m = i + (j - i) / 2 // 중점 인덱스 m을 계산한다.
        if (nums[m] < target) {
            i = m + 1 // target을 찾을 구간은 [m+1, j]이다.
        } else if (nums[m] > target) {
            j = m - 1 // target을 찾을 구간은 [i, m-1]이다.
        } else {
            return m // target을 찾았으므로 삽입 위치 m을 반환한다.
        }
    }
    // target을 찾지 못했으므로 삽입 위치 i를 반환한다.
    return i
}

/* 이진 탐색으로 삽입 위치 찾기(중복 원소가 있는 경우) */
fun binarySearchInsertion(nums: IntArray, target: Int): Int {
    var i = 0
    var j = nums.size - 1 // 닫힌구간 [0, n-1]을 초기화한다.
    while (i <= j) {
        val m = i + (j - i) / 2 // 중점 인덱스 m을 계산한다.
        if (nums[m] < target) {
            i = m + 1 // target을 찾을 구간은 [m+1, j]이다.
        } else if (nums[m] > target) {
            j = m - 1 // target을 찾을 구간은 [i, m-1]이다.
        } else {
            j = m - 1 // target보다 작은 원소 중 가장 오른쪽 원소를 찾을 구간은 [i, m-1]이다.
        }
    }
    // 삽입 위치 i를 반환한다.
    return i
}

/* 실행 예제 */
fun main() {
    // 중복 원소가 없는 배열
    var nums = intArrayOf(1, 3, 6, 8, 12, 15, 23, 26, 31, 35)
    println("\n배열 nums = ${nums.contentToString()}")
    // 이진 탐색으로 삽입 위치 찾기
    for (target in intArrayOf(6, 9)) {
        val index = binarySearchInsertionSimple(nums, target)
        println("삽입할 값 = $target | 삽입 인덱스 = $index")
    }

    // 중복 원소가 있는 배열
    nums = intArrayOf(1, 3, 6, 6, 6, 6, 6, 10, 12, 15)
    println("\n배열 nums = ${nums.contentToString()}")

    // 이진 탐색으로 삽입 위치 찾기
    for (target in intArrayOf(2, 6, 20)) {
        val index = binarySearchInsertion(nums, target)
        println("삽입할 값 = $target | 삽입 인덱스 = $index")
    }
}
