/**
 * File: binary_search_recur.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_divide_and_conquer.binary_search_recur

/* 이진 탐색: 문제 f(i, j) */
fun dfs(
    nums: IntArray,
    target: Int,
    i: Int,
    j: Int
): Int {
    // 구간이 비어 있으면 목표 원소가 없다는 뜻이므로 -1을 반환한다
    if (i > j) {
        return -1
    }
    // 중간 인덱스 m을 계산한다
    val m = (i + j) / 2
    return if (nums[m] < target) {
        // 부분 문제 f(m+1, j)를 재귀적으로 푼다
        dfs(nums, target, m + 1, j)
    } else if (nums[m] > target) {
        // 부분 문제 f(i, m-1)를 재귀적으로 푼다
        dfs(nums, target, i, m - 1)
    } else {
        // 목표 원소를 찾았으므로 해당 인덱스를 반환한다
        m
    }
}

/* 이진 탐색 */
fun binarySearch(nums: IntArray, target: Int): Int {
    val n = nums.size
    // 문제 f(0, n-1)을 푼다
    return dfs(nums, target, 0, n - 1)
}

/* 실행 코드 */
fun main() {
    val target = 6
    val nums = intArrayOf(1, 3, 6, 8, 12, 15, 23, 26, 31, 35)

    // 이진 탐색(양 끝을 포함하는 닫힌 구간)
    val index = binarySearch(nums, target)
    println("목표 원소 6의 인덱스 = $index")
}