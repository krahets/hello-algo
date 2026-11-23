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

/* 센티널 분할 */
fun partition(nums: IntArray, left: Int, right: Int): Int {
    // nums[left]를 피벗으로 삼는다
    var i = left
    var j = right
    while (i < j) {
        while (i < j && nums[j] >= nums[left])
            j--           // 오른쪽에서 왼쪽으로 피벗보다 작은 첫 번째 원소를 찾는다
        while (i < j && nums[i] <= nums[left])
            i++           // 왼쪽에서 오른쪽으로 피벗보다 큰 첫 번째 원소를 찾는다
        swap(nums, i, j)  // 두 원소를 교환한다
    }
    swap(nums, i, left)   // 피벗을 두 부분 배열의 경계로 교환하여 옮긴다
    return i              // 피벗의 인덱스를 반환한다
}

/* 퀵 정렬 */
fun quickSort(nums: IntArray, left: Int, right: Int) {
    // 부분 배열의 길이가 1이면 재귀를 종료한다
    if (left >= right) return
    // 센티널 분할
    val pivot = partition(nums, left, right)
    // 왼쪽 부분 배열과 오른쪽 부분 배열에 재귀 호출한다
    quickSort(nums, left, pivot - 1)
    quickSort(nums, pivot + 1, right)
}

/* 세 후보 원소의 중앙값 선택 */
fun medianThree(nums: IntArray, left: Int, mid: Int, right: Int): Int {
    val l = nums[left]
    val m = nums[mid]
    val r = nums[right]
    if ((m in l..r) || (m in r..l))
        return mid  // m은 l과 r 사이에 있다
    if ((l in m..r) || (l in r..m))
        return left // l은 m과 r 사이에 있다
    return right
}

/* 센티널 분할(세 수의 중앙값 선택) */
fun partitionMedian(nums: IntArray, left: Int, right: Int): Int {
    // 세 후보 원소의 중앙값 선택
    val med = medianThree(nums, left, (left + right) / 2, right)
    // 중앙값을 배열 맨 왼쪽으로 교환하여 옮긴다
    swap(nums, left, med)
    // nums[left]를 피벗으로 삼는다
    var i = left
    var j = right
    while (i < j) {
        while (i < j && nums[j] >= nums[left])
            j--                      // 오른쪽에서 왼쪽으로 피벗보다 작은 첫 번째 원소를 찾는다
        while (i < j && nums[i] <= nums[left])
            i++                      // 왼쪽에서 오른쪽으로 피벗보다 큰 첫 번째 원소를 찾는다
        swap(nums, i, j)             // 두 원소를 교환한다
    }
    swap(nums, i, left)              // 피벗을 두 부분 배열의 경계로 교환하여 옮긴다
    return i                         // 피벗의 인덱스를 반환한다
}

/* 퀵 정렬 */
fun quickSortMedian(nums: IntArray, left: Int, right: Int) {
    // 부분 배열의 길이가 1이면 재귀를 종료한다
    if (left >= right) return
    // 센티널 분할
    val pivot = partitionMedian(nums, left, right)
    // 왼쪽 부분 배열과 오른쪽 부분 배열에 재귀 호출한다
    quickSort(nums, left, pivot - 1)
    quickSort(nums, pivot + 1, right)
}

/* 퀵 정렬(재귀 깊이 최적화) */
fun quickSortTailCall(nums: IntArray, left: Int, right: Int) {
    // 부분 배열의 길이가 1이면 종료한다
    var l = left
    var r = right
    while (l < r) {
        // 센티널 분할 연산
        val pivot = partition(nums, l, r)
        // 두 부분 배열 중 더 짧은 쪽에 퀵 정렬을 수행한다
        if (pivot - l < r - pivot) {
            quickSort(nums, l, pivot - 1) // 왼쪽 부분 배열을 재귀적으로 정렬한다
            l = pivot + 1 // 남은 미정렬 구간은 [pivot + 1, right]이다
        } else {
            quickSort(nums, pivot + 1, r) // 오른쪽 부분 배열을 재귀적으로 정렬한다
            r = pivot - 1 // 남은 미정렬 구간은 [left, pivot - 1]이다
        }
    }
}

/* 실행 코드 */
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