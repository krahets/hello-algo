/**
 * File: quick_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* 원소 교환 */
fun swap(nums: IntArray, i: Int, j: Int) {
    val temp = nums[i]
    nums[i] = nums[j]
    nums[j] = temp
}

/* 양방향 포인터로 분할 */
fun partition(nums: IntArray, left: Int, right: Int): Int {
    // nums[left]를 피벗으로 선택
    var i = left
    var j = right
    while (i < j) {
        while (i < j && nums[j] >= nums[left])
            j--           // 오른쪽에서 왼쪽으로 피벗보다 작은 첫 원소 찾기
        while (i < j && nums[i] <= nums[left])
            i++           // 왼쪽에서 오른쪽으로 피벗보다 큰 첫 원소 찾기
        swap(nums, i, j)  // 두 원소 교환
    }
    swap(nums, i, left)   // 교환을 통해 피벗을 두 부분 배열의 경계에 배치
    return i              // 피벗의 인덱스 반환
}

/* 퀵 정렬 */
fun quickSort(nums: IntArray, left: Int, right: Int) {
    // 부분 배열의 길이가 1이면 재귀 종료
    if (left >= right) return
    // 양방향 포인터로 분할
    val pivot = partition(nums, left, right)
    // 왼쪽과 오른쪽 부분 배열을 각각 재귀적으로 정렬
    quickSort(nums, left, pivot - 1)
    quickSort(nums, pivot + 1, right)
}

/* 세 후보 원소의 중앙값 선택 */
fun medianThree(nums: IntArray, left: Int, mid: Int, right: Int): Int {
    val l = nums[left]
    val m = nums[mid]
    val r = nums[right]
    if ((m in l..r) || (m in r..l))
        return mid  // m이 l과 r 사이에 있음
    if ((l in m..r) || (l in r..m))
        return left // l이 m과 r 사이에 있음
    return right
}

/* 양방향 포인터로 분할(세 값의 중앙값 선택) */
fun partitionMedian(nums: IntArray, left: Int, right: Int): Int {
    // 세 후보 원소의 중앙값 선택
    val med = medianThree(nums, left, (left + right) / 2, right)
    // 교환을 통해 중앙값을 배열의 왼쪽 끝에 배치
    swap(nums, left, med)
    // nums[left]를 피벗으로 선택
    var i = left
    var j = right
    while (i < j) {
        while (i < j && nums[j] >= nums[left])
            j--                      // 오른쪽에서 왼쪽으로 피벗보다 작은 첫 원소 찾기
        while (i < j && nums[i] <= nums[left])
            i++                      // 왼쪽에서 오른쪽으로 피벗보다 큰 첫 원소 찾기
        swap(nums, i, j)             // 두 원소 교환
    }
    swap(nums, i, left)              // 교환을 통해 피벗을 두 부분 배열의 경계에 배치
    return i                         // 피벗의 인덱스 반환
}

/* 퀵 정렬 */
fun quickSortMedian(nums: IntArray, left: Int, right: Int) {
    // 부분 배열의 길이가 1이면 재귀 종료
    if (left >= right) return
    // 양방향 포인터로 분할
    val pivot = partitionMedian(nums, left, right)
    // 왼쪽과 오른쪽 부분 배열을 각각 재귀적으로 정렬
    quickSort(nums, left, pivot - 1)
    quickSort(nums, pivot + 1, right)
}

/* 퀵 정렬(재귀 깊이 최적화) */
fun quickSortTailCall(nums: IntArray, left: Int, right: Int) {
    // 부분 배열의 길이가 1이면 종료
    var l = left
    var r = right
    while (l < r) {
        // 양방향 포인터로 분할
        val pivot = partition(nums, l, r)
        // 두 부분 배열 중 더 짧은 쪽에 퀵 정렬 수행
        if (pivot - l < r - pivot) {
            quickSort(nums, l, pivot - 1) // 왼쪽 부분 배열 재귀 정렬
            l = pivot + 1 // 남은 미정렬 구간은 [pivot + 1, right]
        } else {
            quickSort(nums, pivot + 1, r) // 오른쪽 부분 배열 재귀 정렬
            r = pivot - 1 // 남은 미정렬 구간은 [left, pivot - 1]
        }
    }
}

/* 실행 예제 */
fun main() {
    /* 퀵 정렬 */
    val nums = intArrayOf(2, 4, 1, 0, 3, 5)
    quickSort(nums, 0, nums.size - 1)
    println("퀵 정렬 후 nums = ${nums.contentToString()}")

    /* 퀵 정렬(중앙값 피벗 최적화) */
    val nums1 = intArrayOf(2, 4, 1, 0, 3, 5)
    quickSortMedian(nums1, 0, nums1.size - 1)
    println("퀵 정렬(중앙값 피벗 최적화) 후 nums1 = ${nums1.contentToString()}")

    /* 퀵 정렬(재귀 깊이 최적화) */
    val nums2 = intArrayOf(2, 4, 1, 0, 3, 5)
    quickSortTailCall(nums2, 0, nums2.size - 1)
    println("퀵 정렬(재귀 깊이 최적화) 후 nums2 = ${nums2.contentToString()}")
}