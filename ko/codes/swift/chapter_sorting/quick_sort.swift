/**
 * File: quick_sort.swift
 * Created Time: 2023-01-29
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 퀵 정렬 클래스 */
/* 양방향 포인터로 분할 */
func partition(nums: inout [Int], left: Int, right: Int) -> Int {
    // nums[left]를 피벗으로 선택
    var i = left
    var j = right
    while i < j {
        while i < j, nums[j] >= nums[left] {
            j -= 1 // 오른쪽에서 왼쪽으로 피벗보다 작은 첫 원소 찾기
        }
        while i < j, nums[i] <= nums[left] {
            i += 1 // 왼쪽에서 오른쪽으로 피벗보다 큰 첫 원소 찾기
        }
        nums.swapAt(i, j) // 두 원소 교환
    }
    nums.swapAt(i, left) // 교환을 통해 피벗을 두 부분 배열의 경계에 배치
    return i // 피벗의 인덱스 반환
}

/* 퀵 정렬 */
func quickSort(nums: inout [Int], left: Int, right: Int) {
    // 부분 배열의 길이가 1이면 재귀 종료
    if left >= right {
        return
    }
    // 양방향 포인터로 분할
    let pivot = partition(nums: &nums, left: left, right: right)
    // 왼쪽과 오른쪽 부분 배열을 각각 재귀적으로 정렬
    quickSort(nums: &nums, left: left, right: pivot - 1)
    quickSort(nums: &nums, left: pivot + 1, right: right)
}

/* 퀵 정렬 클래스(중앙값 피벗 최적화) */
/* 세 후보 원소의 중앙값 선택 */
func medianThree(nums: [Int], left: Int, mid: Int, right: Int) -> Int {
    let l = nums[left]
    let m = nums[mid]
    let r = nums[right]
    if (l <= m && m <= r) || (r <= m && m <= l) {
        return mid // m이 l과 r 사이에 있음
    }
    if (m <= l && l <= r) || (r <= l && l <= m) {
        return left // l이 m과 r 사이에 있음
    }
    return right
}

/* 양방향 포인터로 분할(세 값의 중앙값 선택) */
func partitionMedian(nums: inout [Int], left: Int, right: Int) -> Int {
    // 세 후보 원소의 중앙값 선택
    let med = medianThree(nums: nums, left: left, mid: left + (right - left) / 2, right: right)
    // 교환을 통해 중앙값을 배열의 왼쪽 끝에 배치
    nums.swapAt(left, med)
    return partition(nums: &nums, left: left, right: right)
}

/* 퀵 정렬(중앙값 피벗 최적화) */
func quickSortMedian(nums: inout [Int], left: Int, right: Int) {
    // 부분 배열의 길이가 1이면 재귀 종료
    if left >= right {
        return
    }
    // 양방향 포인터로 분할
    let pivot = partitionMedian(nums: &nums, left: left, right: right)
    // 왼쪽과 오른쪽 부분 배열을 각각 재귀적으로 정렬
    quickSortMedian(nums: &nums, left: left, right: pivot - 1)
    quickSortMedian(nums: &nums, left: pivot + 1, right: right)
}

/* 퀵 정렬(재귀 깊이 최적화) */
func quickSortTailCall(nums: inout [Int], left: Int, right: Int) {
    var left = left
    var right = right
    // 부분 배열의 길이가 1이면 종료
    while left < right {
        // 양방향 포인터로 분할
        let pivot = partition(nums: &nums, left: left, right: right)
        // 두 부분 배열 중 더 짧은 쪽에 퀵 정렬 수행
        if (pivot - left) < (right - pivot) {
            quickSortTailCall(nums: &nums, left: left, right: pivot - 1) // 왼쪽 부분 배열 재귀 정렬
            left = pivot + 1 // 남은 미정렬 구간은 [pivot + 1, right]
        } else {
            quickSortTailCall(nums: &nums, left: pivot + 1, right: right) // 오른쪽 부분 배열 재귀 정렬
            right = pivot - 1 // 남은 미정렬 구간은 [left, pivot - 1]
        }
    }
}

@main
enum QuickSort {
    /* 실행 예제 */
    static func main() {
        /* 퀵 정렬 */
        var nums = [2, 4, 1, 0, 3, 5]
        quickSort(nums: &nums, left: nums.startIndex, right: nums.endIndex - 1)
        print("퀵 정렬 후 nums = \(nums)")

        /* 퀵 정렬(중앙값 피벗 최적화) */
        var nums1 = [2, 4, 1, 0, 3, 5]
        quickSortMedian(nums: &nums1, left: nums1.startIndex, right: nums1.endIndex - 1)
        print("퀵 정렬(중앙값 피벗 최적화) 후 nums1 = \(nums1)")

        /* 퀵 정렬(재귀 깊이 최적화) */
        var nums2 = [2, 4, 1, 0, 3, 5]
        quickSortTailCall(nums: &nums2, left: nums2.startIndex, right: nums2.endIndex - 1)
        print("퀵 정렬(재귀 깊이 최적화) 후 nums2 = \(nums2)")
    }
}
